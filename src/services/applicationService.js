import { supabase } from '../lib/supabase'

const BUCKET_NAME = 'application-documents'

// ==========================================
// UPLOAD ONE DOCUMENT
// ==========================================
async function uploadDocument(file, applicantId, documentType) {
  if (!file) {
    return null
  }

  const extension = file.name.includes('.') ? file.name.substring(file.name.lastIndexOf('.')) : ''

  const fileName = `${documentType}-${Date.now()}${extension}`

  const filePath = `${applicantId}/${fileName}`

  const { error } = await supabase.storage.from(BUCKET_NAME).upload(filePath, file, {
    cacheControl: '3600',
    upsert: false,
  })

  if (error) {
    throw new Error(`Failed to upload ${documentType}: ${error.message}`)
  }

  return filePath
}

// ==========================================
// CREATE APPLICANT
// ==========================================
async function createApplicant(form) {
  const { data, error } = await supabase
    .from('applicants')
    .insert({
      full_name: form.name,
      email: form.email,
      phone: form.phone,
      address: form.address,
      education: form.education,
    })
    .select('id')
    .single()

  if (error) {
    throw new Error(`Failed to create applicant: ${error.message}`)
  }

  return data
}

// ==========================================
// GET DATABASE JOB
// ==========================================
async function getDatabaseJob(job) {
  if (!job || !job.id) {
    throw new Error('Job information is missing.')
  }

  const { data, error } = await supabase
    .from('jobs')
    .select('id, title, is_active')
    .eq('id', job.id)
    .eq('is_active', true)
    .maybeSingle()

  if (error) {
    throw new Error(`Failed to find job in database: ${error.message}`)
  }

  if (!data) {
    throw new Error('Lowongan ini tidak ditemukan atau sudah tidak tersedia.')
  }

  return data
}

// ==========================================
// CREATE APPLICATION
// ==========================================
async function createApplication(applicantId, jobId, documents) {
  const { data, error } = await supabase
    .from('applications')
    .insert({
      applicant_id: applicantId,
      job_id: jobId,

      cv_url: documents.cv,
      cover_letter_url: documents.coverLetter,
      photo_url: documents.photo,
      ktp_url: documents.ktp,
      skck_url: documents.skck,
      health_certificate_url: documents.healthCertificate,

      work_experience_url: documents.workExperience,

      ijazah_url: documents.ijazah,

      status: 'Pending',
    })
    .select('id')
    .single()

  if (error) {
    throw new Error(`Failed to create application: ${error.message}`)
  }

  return data
}

// ==========================================
// SUBMIT COMPLETE APPLICATION
// ==========================================
export async function submitApplication(form, job) {
  console.log('================================')
  console.log('APPLICATION SERVICE STARTED')
  console.log('Frontend Job:', job)
  console.log('================================')

  // ----------------------------------------
  // 1. Create applicant
  // ----------------------------------------
  const applicant = await createApplicant(form)

  const applicantId = applicant.id

  console.log('Applicant created:', applicantId)

  // ----------------------------------------
  // 2. Find real database job ID
  // ----------------------------------------
  const databaseJob = await getDatabaseJob(job)

  const jobId = databaseJob.id

  console.log('Using Database Job ID:', jobId)

  // ----------------------------------------
  // 3. Upload documents
  // ----------------------------------------
  const cv = await uploadDocument(form.cv, applicantId, 'cv')

  const coverLetter = await uploadDocument(form.coverLetter, applicantId, 'cover-letter')

  const photo = await uploadDocument(form.photo, applicantId, 'photo')

  const ktp = await uploadDocument(form.ktp, applicantId, 'ktp')

  const skck = await uploadDocument(form.skck, applicantId, 'skck')

  const healthCertificate = await uploadDocument(
    form.healthCertificate,
    applicantId,
    'health-certificate',
  )

  const workExperience = await uploadDocument(form.workExperience, applicantId, 'work-experience')

  const ijazah = await uploadDocument(form.ijazah, applicantId, 'ijazah')

  console.log('All documents uploaded.')

  // ----------------------------------------
  // 4. Create application
  // ----------------------------------------
  const application = await createApplication(applicantId, jobId, {
    cv,
    coverLetter,
    photo,
    ktp,
    skck,
    healthCertificate,
    workExperience,
    ijazah,
  })

  console.log('Application created:', application)

  // ----------------------------------------
  // 5. Return result
  // ----------------------------------------
  return {
    applicantId,
    applicationId: application.id,
  }
}
