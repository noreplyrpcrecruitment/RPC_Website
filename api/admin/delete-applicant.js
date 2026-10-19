import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.SUPABASE_URL
const supabaseSecretKey = process.env.SUPABASE_SECRET_KEY
const adminEmail = process.env.ADMIN_EMAIL
const bucketName = 'application-documents'

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
  if (req.method !== 'DELETE') {
    res.setHeader('Allow', 'DELETE')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  if (!supabaseAdmin || !adminEmail) {
    return res.status(500).json({
      error: 'Server environment variables are not configured.',
    })
  }

  try {
    const authorization = req.headers.authorization || ''
    const accessToken = authorization.startsWith('Bearer ') ? authorization.slice(7) : ''

    if (!accessToken) {
      return res.status(401).json({ error: 'Login required.' })
    }

    // Verify the actual Supabase user session.
    const { data: userData, error: userError } = await supabaseAdmin.auth.getUser(accessToken)

    if (userError || !userData.user) {
      return res.status(401).json({ error: 'Invalid session.' })
    }

    if (userData.user.email?.toLowerCase() !== adminEmail.toLowerCase()) {
      return res.status(403).json({ error: 'Admin access required.' })
    }

    const applicantId = String(req.query.applicantId || '')

    if (!/^\d+$/.test(applicantId)) {
      return res.status(400).json({ error: 'Invalid applicant ID.' })
    }

    // Confirm that the applicant exists.
    const { data: applicant, error: applicantError } = await supabaseAdmin
      .from('applicants')
      .select('id')
      .eq('id', Number(applicantId))
      .maybeSingle()

    if (applicantError) throw applicantError

    if (!applicant) {
      return res.status(404).json({ error: 'Applicant not found.' })
    }

    // List and remove all files stored under this applicant's folder.
    let offset = 0
    const pageSize = 100
    const paths = []

    while (true) {
      const { data: files, error: listError } = await supabaseAdmin.storage
        .from(bucketName)
        .list(applicantId, {
          limit: pageSize,
          offset,
        })

      if (listError) throw listError
      if (!files || files.length === 0) break

      for (const file of files) {
        if (file.name && file.id) {
          paths.push(`${applicantId}/${file.name}`)
        }
      }

      if (files.length < pageSize) break
      offset += pageSize
    }

    // Do not delete database records if document deletion fails.
    if (paths.length > 0) {
      const { error: removeError } = await supabaseAdmin.storage.from(bucketName).remove(paths)

      if (removeError) throw removeError
    }

    // Delete related applications first.
    const { error: applicationsError } = await supabaseAdmin
      .from('applications')
      .delete()
      .eq('applicant_id', Number(applicantId))

    if (applicationsError) throw applicationsError

    // Delete the applicant record last.
    const { error: deleteError } = await supabaseAdmin
      .from('applicants')
      .delete()
      .eq('id', Number(applicantId))

    if (deleteError) throw deleteError

    return res.status(200).json({
      success: true,
      applicantId,
      deletedFiles: paths.length,
    })
  } catch (error) {
    console.error('Delete applicant failed:', error)

    return res.status(500).json({
      error: 'Failed to delete applicant and related data.',
    })
  }
}
