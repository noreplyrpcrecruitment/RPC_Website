import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.SUPABASE_URL
const supabaseSecretKey = process.env.SUPABASE_SECRET_KEY
const cronSecret = process.env.CRON_SECRET

const supabaseAdmin =
  supabaseUrl && supabaseSecretKey
    ? createClient(supabaseUrl, supabaseSecretKey, {
        auth: {
          persistSession: false,
          autoRefreshToken: false,
        },
      })
    : null

export default async function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET')
    return res.status(405).json({
      error: 'Method not allowed',
    })
  }

  if (!supabaseAdmin || !cronSecret) {
    return res.status(500).json({
      error: 'Cron environment variables are not configured.',
    })
  }

  const authorization = req.headers.authorization || ''

  if (authorization !== `Bearer ${cronSecret}`) {
    return res.status(401).json({
      error: 'Unauthorized',
    })
  }

  try {
    // Get today's date using the Jakarta timezone (WIB).
    const jakartaDateParts = new Intl.DateTimeFormat('en-US', {
      timeZone: 'Asia/Jakarta',
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
    }).formatToParts(new Date())

    const dateParts = Object.fromEntries(jakartaDateParts.map(({ type, value }) => [type, value]))

    const today = `${dateParts.year}-${dateParts.month}-${dateParts.day}`

    // Find jobs whose deadline is before today's date.
    const { data: expiredJobs, error: findError } = await supabaseAdmin
      .from('jobs')
      .select('id, title')
      .lt('deadline', today)

    if (findError) {
      throw findError
    }

    if (!expiredJobs || expiredJobs.length === 0) {
      return res.status(200).json({
        success: true,
        message: 'No expired jobs found.',
        deletedCount: 0,
      })
    }

    const jobIds = expiredJobs.map((job) => job.id)

    // Preserve job titles in application history before deleting jobs.
    for (const job of expiredJobs) {
      const { error: historyError } = await supabaseAdmin
        .from('applications')
        .update({
          job_title: job.title,
        })
        .eq('job_id', job.id)
        .is('job_title', null)

      if (historyError) {
        throw historyError
      }
    }

    // Delete only expired jobs.
    // Applications are preserved because the foreign key uses SET NULL.
    const { data: deletedJobs, error: deleteError } = await supabaseAdmin
      .from('jobs')
      .delete()
      .in('id', jobIds)
      .select('id')

    if (deleteError) {
      throw deleteError
    }

    return res.status(200).json({
      success: true,
      message: 'Expired jobs deleted successfully.',
      deletedCount: deletedJobs?.length || 0,
      deletedJobIds: deletedJobs?.map((job) => job.id) || [],
    })
  } catch (error) {
    console.error('Delete expired jobs failed:', error)

    return res.status(500).json({
      error: 'Failed to delete expired jobs.',
    })
  }
}
