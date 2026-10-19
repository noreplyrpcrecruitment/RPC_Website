<template>
  <div class="admin-layout">
    <AdminSidebar />

    <div class="admin-main">
      <AdminTopbar />

      <main class="admin-content">
        <section class="admin-card applicants-card">
          <div class="applicants-header">
            <div class="applicants-heading">
              <div class="applicants-heading-icon">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="25"
                  height="25"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <path d="M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
                  <circle cx="10" cy="7" r="4" />
                  <path d="M20 21v-2a4 4 0 0 0-3-3.87" />
                  <path d="M16 3.13a4 4 0 0 1 0 7.75" />
                </svg>
              </div>

              <div>
                <h1>Applicants</h1>
                <p>View and manage candidates who applied for available positions.</p>
              </div>
            </div>
          </div>

          <div v-if="loading" class="applicants-message">Loading applicants...</div>

          <div v-else-if="errorMessage" class="applicants-error">
            <span>{{ errorMessage }}</span>
            <button class="admin-outline-button" @click="loadApplicants">Try Again</button>
          </div>

          <div v-else class="admin-table-wrapper applicants-table-wrapper">
            <table class="admin-table applicants-table">
              <thead>
                <tr>
                  <th class="number-column">No.</th>
                  <th class="name-column">Applicant Name</th>
                  <th class="position-column">Position Applied</th>
                  <th class="date-column">Applied Date</th>
                  <th class="status-column">Status</th>
                  <th class="actions-column">Actions</th>
                </tr>
              </thead>

              <tbody>
                <tr v-for="(applicant, index) in applicants" :key="applicant.applicationId">
                  <td class="number-cell">{{ index + 1 }}</td>

                  <td class="applicant-name-cell">
                    <span class="applicant-name-text">
                      {{ applicant.name }}
                    </span>
                  </td>

                  <td class="position-cell">
                    <span class="position-text">
                      {{ applicant.position }}
                    </span>
                  </td>

                  <td class="date-cell">
                    {{ applicant.appliedDate }}
                  </td>

                  <td class="status-cell">
                    <span class="admin-status" :class="getStatusClass(applicant.status)">
                      {{ applicant.status }}
                    </span>
                  </td>

                  <td class="actions-cell">
                    <div class="applicant-actions">
                      <router-link
                        :to="`/admin/applicants/${applicant.applicationId}`"
                        class="admin-detail-link"
                        title="View applicant details"
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          width="19"
                          height="19"
                          viewBox="0 0 24 24"
                          fill="none"
                          stroke="currentColor"
                          stroke-width="1.9"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          aria-hidden="true"
                        >
                          <path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12Z" />
                          <circle cx="12" cy="12" r="3" />
                        </svg>

                        <span>Lihat Detail</span>
                        <span class="detail-arrow">→</span>
                      </router-link>

                      <span class="action-divider" aria-hidden="true"></span>

                      <button
                        class="admin-delete-icon"
                        :disabled="deletingId === applicant.applicationId"
                        @click="deleteApplicant(applicant)"
                        :title="
                          deletingId === applicant.applicationId
                            ? 'Deleting applicant'
                            : 'Delete applicant'
                        "
                        :aria-label="`Delete applicant ${applicant.name}`"
                      >
                        <svg
                          v-if="deletingId !== applicant.applicationId"
                          xmlns="http://www.w3.org/2000/svg"
                          width="19"
                          height="19"
                          viewBox="0 0 24 24"
                          fill="none"
                          stroke="currentColor"
                          stroke-width="1.8"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          aria-hidden="true"
                        >
                          <path d="M3 6h18" />
                          <path d="M8 6V4h8v2" />
                          <path d="m19 6-1 14H6L5 6" />
                          <path d="M10 11v5" />
                          <path d="M14 11v5" />
                        </svg>

                        <span v-else class="delete-loading">...</span>
                      </button>
                    </div>
                  </td>
                </tr>

                <tr v-if="applicants.length === 0">
                  <td colspan="6" class="applicants-empty">
                    <div class="empty-state">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="34"
                        height="34"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.5"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        aria-hidden="true"
                      >
                        <path d="M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
                        <circle cx="10" cy="7" r="4" />
                        <path d="M19 8v6" />
                        <path d="M22 11h-6" />
                      </svg>
                      <p>No applicants have submitted applications yet.</p>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { supabase } from '../../lib/supabase'
import AdminSidebar from '../../components/AdminSidebar.vue'
import AdminTopbar from '../../components/AdminTopbar.vue'

const BUCKET_NAME = 'application-documents'

const applicants = ref([])
const loading = ref(true)
const errorMessage = ref('')
const deletingId = ref(null)

const documentColumns = [
  'cv_url',
  'cover_letter_url',
  'photo_url',
  'ktp_url',
  'skck_url',
  'health_certificate_url',
  'work_experience_url',
  'ijazah_url',
]

// Format application submission date and time.
function formatAppliedDate(value) {
  if (!value) return '-'

  const date = new Date(value)

  if (Number.isNaN(date.getTime())) return '-'

  return date.toLocaleString('en-GB', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
    timeZone: 'Asia/Jakarta',
  })
}

// Load applications from Supabase.
async function loadApplicants() {
  loading.value = true
  errorMessage.value = ''

  try {
    const { data: applicationData, error: applicationError } = await supabase
      .from('applications')
      .select(
        `
          id,
          applicant_id,
          job_id,
          cv_url,
          status,
          created_at
        `,
      )
      .order('created_at', { ascending: false, nullsFirst: false })

    if (applicationError) throw applicationError

    if (!applicationData || applicationData.length === 0) {
      applicants.value = []
      return
    }

    const applicantIds = [...new Set(applicationData.map((item) => item.applicant_id))]

    const jobIds = [...new Set(applicationData.map((item) => item.job_id))]

    const { data: applicantData, error: applicantError } = await supabase
      .from('applicants')
      .select('id, full_name, email, phone')
      .in('id', applicantIds)

    if (applicantError) throw applicantError

    const { data: jobData, error: jobError } = await supabase
      .from('jobs')
      .select('id, title')
      .in('id', jobIds)

    if (jobError) throw jobError

    const applicantMap = new Map((applicantData || []).map((item) => [String(item.id), item]))

    const jobMap = new Map((jobData || []).map((item) => [String(item.id), item]))

    applicants.value = applicationData.map((application) => {
      const person = applicantMap.get(String(application.applicant_id))
      const job = jobMap.get(String(application.job_id))

      return {
        applicationId: application.id,
        applicantId: application.applicant_id,
        name: person?.full_name || 'Unknown Applicant',
        email: person?.email || '',
        phone: person?.phone || '',
        position: job?.title || 'Unknown Position',
        appliedDate: formatAppliedDate(application.created_at),
        status: application.status || 'Pending',
        resumePath: application.cv_url || null,
      }
    })
  } catch (error) {
    console.error('Failed to load applicants:', error)

    errorMessage.value = error.message || 'Failed to load applicants from Supabase.'
  } finally {
    loading.value = false
  }
}

// Delete an application and its uploaded documents.
async function deleteApplicant(applicant) {
  if (deletingId.value !== null) return

  const confirmed = window.confirm(
    `PERMANENT DELETE\n\n` +
      `Applicant: ${applicant.name}\n` +
      `Position: ${applicant.position}\n\n` +
      `This will permanently delete this applicant, all their applications, ` +
      `and uploaded documents. This action cannot be undone.\n\n` +
      `Continue?`,
  )

  if (!confirmed) return

  deletingId.value = applicant.applicationId
  errorMessage.value = ''

  try {
    // Get the current Supabase login session.
    const {
      data: { session },
      error: sessionError,
    } = await supabase.auth.getSession()

    if (sessionError) throw sessionError

    if (!session?.access_token) {
      throw new Error('Your session has expired. Please log in again.')
    }

    // Call the secure server-side deletion API.
    const response = await fetch(
      `/api/admin/delete-applicant?applicantId=${encodeURIComponent(applicant.applicantId)}`,
      {
        method: 'DELETE',
        headers: {
          Authorization: `Bearer ${session.access_token}`,
        },
      },
    )

    const result = await response.json().catch(() => ({}))

    if (!response.ok) {
      throw new Error(result.error || `Delete failed (${response.status}).`)
    }

    alert(
      `Applicant ${applicant.name} was deleted successfully.\n` +
        `Documents deleted: ${result.deletedFiles ?? 0}`,
    )

    await loadApplicants()
  } catch (error) {
    console.error('Delete applicant failed:', error)

    alert(
      `Delete failed:\n${error.message || 'Unknown error'}\n\n` +
        'No further action was taken by this page. Check the server logs if needed.',
    )

    await loadApplicants()
  } finally {
    deletingId.value = null
  }
}

// Status badge styles.
function getStatusClass(status) {
  const classes = {
    New: 'new',
    'In Review': 'review',
    Shortlisted: 'shortlisted',
    Interview: 'interview',
    Rejected: 'rejected',
  }

  return classes[status] || ''
}

onMounted(loadApplicants)
</script>

<style scoped>
.applicants-card {
  padding: 28px;
  border-radius: 14px;
}

.applicants-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 24px;
  margin-bottom: 28px;
}

.applicants-heading {
  display: flex;
  align-items: center;
  gap: 16px;
  min-width: 0;
}

.applicants-heading-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 52px;
  height: 52px;
  flex-shrink: 0;
  border-radius: 14px;
  background: #edf5ff;
  color: #2563eb;
}

.applicants-heading h1 {
  margin: 0 0 6px;
  color: #172b4d;
  font-size: 25px;
  font-weight: 700;
  line-height: 1.3;
}

.applicants-heading p {
  margin: 0;
  color: #718096;
  font-size: 13px;
  line-height: 1.6;
}

.applicants-table-wrapper {
  width: 100%;
  overflow-x: auto;
  border: 1px solid #dfe6ef;
  border-radius: 11px;
  background: #fff;
}

.applicants-table {
  width: 100%;
  min-width: 850px;
  table-layout: auto;
  border-collapse: separate;
  border-spacing: 0;
}

.applicants-table thead th {
  padding: 15px 16px;
  background: #f5f7fa;
  color: #263a56;
  font-size: 11px;
  font-weight: 700;
  text-align: left;
  white-space: nowrap;
  border-bottom: 1px solid #dfe6ef;
}

.applicants-table thead th:first-child {
  padding-left: 20px;
}

.applicants-table thead th:last-child {
  padding-right: 22px;
  text-align: right;
}

.applicants-table tbody td {
  padding: 15px 16px;
  border-bottom: 1px solid #e5eaf1;
  color: #526783;
  font-size: 12px;
  vertical-align: middle;
}

.applicants-table tbody tr:last-child td {
  border-bottom: none;
}

.applicants-table tbody tr {
  transition: background 0.15s ease;
}

.applicants-table tbody tr:hover {
  background: #fbfcfe;
}

.applicants-table tbody td:first-child {
  padding-left: 20px;
}

.applicants-table tbody td:last-child {
  padding-right: 22px;
}

.number-column {
  width: 55px;
}

.name-column {
  min-width: 190px;
}

.position-column {
  min-width: 170px;
}

.date-column {
  min-width: 175px;
}

.status-column {
  min-width: 110px;
}

.actions-column {
  min-width: 255px;
  text-align: right !important;
}

.number-cell {
  color: #718096 !important;
  font-variant-numeric: tabular-nums;
}

.applicant-name-cell {
  max-width: 260px;
}

.applicant-name-text {
  display: block;
  overflow-wrap: anywhere;
  color: #172b4d;
  font-weight: 600;
  line-height: 1.5;
}

.position-text {
  display: block;
  overflow-wrap: anywhere;
  color: #718096;
  line-height: 1.5;
}

.date-cell {
  color: #718096 !important;
  white-space: nowrap;
  font-variant-numeric: tabular-nums;
}

.status-cell {
  white-space: nowrap;
}

.applicants-table .admin-status {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 27px;
  padding: 5px 12px;
  border-radius: 20px;
  background: #f0f2f5;
  color: #64748b;
  font-size: 10px;
  font-weight: 600;
  white-space: nowrap;
}

.applicants-table .admin-status.shortlisted {
  background: #e5f8ee;
  color: #009b57;
}

.applicants-table .admin-status.new {
  background: #e8f2ff;
  color: #2563eb;
}

.applicants-table .admin-status.review {
  background: #fff5df;
  color: #b7791f;
}

.applicants-table .admin-status.interview {
  background: #e9e7ff;
  color: #6654c0;
}

.applicants-table .admin-status.rejected {
  background: #f0f2f5;
  color: #64748b;
}

.actions-cell {
  text-align: right;
}

.applicant-actions {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 12px;
  white-space: nowrap;
}

.admin-detail-link {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 7px;
  color: #00a859;
  font-size: 11px;
  font-weight: 600;
  text-decoration: none;
  white-space: nowrap;
  transition: color 0.2s ease;
}

.admin-detail-link:hover {
  color: #007f43;
}

.admin-detail-link svg {
  flex-shrink: 0;
}

.detail-arrow {
  font-size: 16px;
  line-height: 1;
  transition: transform 0.2s ease;
}

.admin-detail-link:hover .detail-arrow {
  transform: translateX(3px);
}

.action-divider {
  display: block;
  width: 1px;
  height: 31px;
  flex-shrink: 0;
  background: #dce3eb;
}

.admin-delete-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 42px;
  height: 42px;
  flex-shrink: 0;
  padding: 0;
  border: 1px solid #ffb7b7;
  border-radius: 10px;
  background: #fff;
  color: #ef3035;
  cursor: pointer;
  transition:
    background 0.2s ease,
    color 0.2s ease,
    border-color 0.2s ease,
    transform 0.2s ease;
}

.admin-delete-icon:hover:not(:disabled) {
  border-color: #ef3035;
  background: #fff0f0;
  color: #dc2626;
  transform: translateY(-1px);
}

.admin-delete-icon:active:not(:disabled) {
  transform: scale(0.96);
}

.admin-delete-icon:disabled {
  cursor: not-allowed;
  opacity: 0.5;
}

.admin-delete-icon svg {
  flex-shrink: 0;
}

.delete-loading {
  font-size: 16px;
  font-weight: 700;
}

.applicants-message,
.applicants-empty {
  padding: 30px 16px;
  color: #718096;
  font-size: 12px;
  text-align: center;
}

.applicants-error {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 12px;
  padding: 22px 16px;
  color: #dc2626;
  font-size: 12px;
}

.empty-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 10px;
  color: #94a3b8;
}

.empty-state p {
  margin: 0;
  line-height: 1.6;
}

@media (max-width: 900px) {
  .applicants-card {
    padding: 22px;
  }

  .applicants-header {
    align-items: flex-start;
    gap: 18px;
  }

  .applicants-heading-icon {
    width: 46px;
    height: 46px;
  }

  .applicants-heading h1 {
    font-size: 22px;
  }
}

@media (max-width: 600px) {
  .applicants-card {
    padding: 16px;
  }

  .applicants-header {
    flex-direction: column;
    align-items: stretch;
    gap: 18px;
    margin-bottom: 22px;
  }

  .applicants-heading {
    align-items: flex-start;
    gap: 12px;
  }

  .applicants-heading-icon {
    width: 40px;
    height: 40px;
    border-radius: 10px;
  }

  .applicants-heading-icon svg {
    width: 21px;
    height: 21px;
  }

  .applicants-heading h1 {
    font-size: 20px;
  }

  .applicants-heading p {
    font-size: 12px;
  }

  .applicants-table {
    min-width: 850px;
  }
}
</style>
