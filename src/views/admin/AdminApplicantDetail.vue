<template>
  <div class="admin-layout">
    <!-- SIDEBAR -->
    <aside class="admin-sidebar">
      <div class="admin-sidebar-brand">
        <img src="/assets/rpc-logo.png" alt="RPC Recruitment" />
        <div>
          <strong>RPC</strong>
          <span>RECRUITMENT</span>
        </div>
      </div>

      <nav class="admin-sidebar-nav">
        <router-link to="/admin/open-positions" class="admin-nav-item">
          <span class="admin-nav-icon">▣</span>
          <span>Open Positions</span>
        </router-link>

        <router-link to="/admin/applicants" class="admin-nav-item active">
          <span class="admin-nav-icon">♧</span>
          <span>Applicants</span>
        </router-link>
      </nav>

      <button class="admin-logout" @click="logout">
        <span>⇥</span>
        Logout
      </button>
    </aside>

    <!-- MAIN -->
    <main class="admin-main">
      <header class="admin-topbar">
        <div class="admin-topbar-right">
          <button type="button" class="admin-notification" aria-label="Notifications">♧</button>

          <div class="admin-user">
            <div class="admin-user-avatar">AU</div>
            <span>Admin User</span>
            <span class="admin-user-arrow">⌄</span>
          </div>
        </div>
      </header>

      <!-- CONTENT -->
      <div class="admin-content">
        <button class="applicant-back-link" @click="goBack">← Back to Applicants</button>

        <h1 class="applicant-page-title">Applicant Detail</h1>

        <div v-if="loading" class="admin-card">Loading applicant details...</div>

        <div v-else-if="errorMessage" class="admin-card">
          <p class="applicant-error">{{ errorMessage }}</p>
          <button class="admin-primary-button" @click="loadApplicant">Try Again</button>
        </div>

        <section v-else-if="application && applicant" class="admin-card applicant-detail-card">
          <!-- APPLICATION OVERVIEW -->
          <section class="applicant-section">
            <h2>APPLICATION OVERVIEW</h2>

            <div class="applicant-overview-grid">
              <div>
                <span class="applicant-label">Posisi Dilamar</span>
                <strong>{{ job?.title || '-' }}</strong>
              </div>

              <div>
                <span class="applicant-label">Tanggal Melamar</span>
                <strong>-</strong>
              </div>

              <div>
                <span class="applicant-label">Status</span>
                <span class="admin-status" :class="statusClass(application.status)">
                  {{ application.status || 'Pending' }}
                </span>
              </div>
            </div>
          </section>

          <!-- PERSONAL INFORMATION -->
          <section class="applicant-section">
            <h2>INFORMASI PRIBADI</h2>

            <div class="applicant-personal-grid">
              <div class="applicant-field-column">
                <div class="applicant-field">
                  <span class="applicant-label">Nama Lengkap</span>
                  <strong>{{ applicant.full_name || '-' }}</strong>
                </div>

                <div class="applicant-field">
                  <span class="applicant-label">Email</span>
                  <strong>{{ applicant.email || '-' }}</strong>
                </div>

                <div class="applicant-field">
                  <span class="applicant-label">Nomor Telepon</span>
                  <strong>{{ applicant.phone || '-' }}</strong>
                </div>
              </div>

              <div class="applicant-field-column">
                <div class="applicant-field">
                  <span class="applicant-label">Alamat</span>
                  <strong class="applicant-multiline">
                    {{ applicant.address || '-' }}
                  </strong>
                </div>

                <div class="applicant-field">
                  <span class="applicant-label">Pendidikan Terakhir</span>
                  <strong>{{ applicant.education || '-' }}</strong>
                </div>
              </div>
            </div>
          </section>

          <!-- DOCUMENTS -->
          <section class="applicant-section">
            <h2>DOKUMEN</h2>

            <div class="applicant-documents">
              <div
                v-for="docItem in documentItems"
                :key="docItem.key"
                class="applicant-document-row"
              >
                <div class="applicant-document-icon">▤</div>

                <div class="applicant-document-info">
                  <strong>{{ docItem.label }}</strong>

                  <span v-if="docItem.path">
                    {{ fileName(docItem.path) }}
                  </span>

                  <span v-else class="applicant-document-missing">
                    {{ docItem.optional ? 'Tidak diunggah (opsional)' : 'Dokumen tidak tersedia' }}
                  </span>
                </div>

                <div v-if="docItem.path" class="applicant-document-actions">
                  <button
                    class="admin-outline-button"
                    :disabled="openingDocument === docItem.key"
                    @click="viewDocument(docItem)"
                  >
                    {{ openingDocument === docItem.key ? 'Opening...' : '◎ View' }}
                  </button>

                  <button
                    class="admin-primary-button"
                    :disabled="downloadingDocument === docItem.key"
                    @click="downloadDocument(docItem)"
                  >
                    {{ downloadingDocument === docItem.key ? 'Downloading...' : '↓ Download' }}
                  </button>
                </div>
              </div>
            </div>
          </section>

          <!-- UPDATE STATUS -->
          <section class="applicant-section applicant-status-section">
            <h2>UPDATE STATUS</h2>

            <label for="applicant-status" class="applicant-label applicant-status-label">
              Status
            </label>

            <select id="applicant-status" v-model="selectedStatus" class="applicant-status-select">
              <option v-for="status in statusOptions" :key="status" :value="status">
                {{ status }}
              </option>
            </select>

            <p class="applicant-status-hint">
              Pending · New · In Review · Shortlisted · Interview · Rejected
            </p>

            <p
              v-if="statusMessage"
              class="applicant-status-message"
              :class="{ 'applicant-error': statusFailed }"
            >
              {{ statusMessage }}
            </p>

            <button
              class="admin-primary-button applicant-update-button"
              :disabled="savingStatus || selectedStatus === application.status"
              @click="updateStatus"
            >
              {{ savingStatus ? 'Updating...' : 'Update Status' }}
            </button>
          </section>
        </section>
      </div>
    </main>
  </div>
</template>

<script>
import { supabase } from '../../lib/supabase'

const BUCKET_NAME = 'application-documents'

export default {
  name: 'AdminApplicantDetail',

  data() {
    return {
      application: null,
      applicant: null,
      job: null,

      loading: true,
      savingStatus: false,

      openingDocument: null,
      downloadingDocument: null,

      errorMessage: '',
      statusMessage: '',
      statusFailed: false,
      selectedStatus: 'Pending',

      statusOptions: ['Pending', 'New', 'In Review', 'Shortlisted', 'Interview', 'Rejected'],

      documentDefinitions: [
        { key: 'cv_url', label: 'CV / Resume' },
        { key: 'cover_letter_url', label: 'Surat Lamaran Kerja' },
        { key: 'photo_url', label: 'Foto' },
        { key: 'ktp_url', label: 'KTP' },
        { key: 'skck_url', label: 'SKCK' },
        {
          key: 'health_certificate_url',
          label: 'Surat Keterangan Sehat',
        },
        {
          key: 'work_experience_url',
          label: 'Surat Pengalaman Kerja',
          optional: true,
        },
        { key: 'ijazah_url', label: 'Ijazah' },
      ],
    }
  },

  computed: {
    applicationId() {
      return this.$route.params.id
    },

    documentItems() {
      if (!this.application) return []

      return this.documentDefinitions.map((item) => ({
        ...item,
        path: this.application[item.key] || null,
      }))
    },
  },

  mounted() {
    this.loadApplicant()
  },

  methods: {
    // LOAD APPLICATION DETAIL
    async loadApplicant() {
      this.loading = true
      this.errorMessage = ''

      try {
        const { data: application, error: applicationError } = await supabase
          .from('applications')
          .select(
            `
              id,
              applicant_id,
              job_id,
              cv_url,
              cover_letter_url,
              photo_url,
              ktp_url,
              skck_url,
              health_certificate_url,
              work_experience_url,
              ijazah_url,
              status
            `,
          )
          .eq('id', this.applicationId)
          .maybeSingle()

        if (applicationError) throw applicationError

        if (!application) {
          throw new Error('Data lamaran tidak ditemukan atau akses ditolak.')
        }

        const { data: applicant, error: applicantError } = await supabase
          .from('applicants')
          .select('id, full_name, email, phone, address, education')
          .eq('id', application.applicant_id)
          .maybeSingle()

        if (applicantError) throw applicantError

        if (!applicant) {
          throw new Error('Data pribadi pelamar tidak ditemukan.')
        }

        const { data: job, error: jobError } = await supabase
          .from('jobs')
          .select('id, title, department')
          .eq('id', application.job_id)
          .maybeSingle()

        if (jobError) throw jobError

        this.application = application
        this.applicant = applicant
        this.job = job
        this.selectedStatus = application.status || 'Pending'
      } catch (error) {
        console.error('Failed to load applicant:', error)
        this.errorMessage = error.message || 'Gagal memuat data pelamar.'
      } finally {
        this.loading = false
      }
    },

    // NORMALIZE DOCUMENT PATH AND GET URL
    async getDocumentUrl(path) {
      const cleanPath = String(path || '')
        .trim()
        .replace(/^\/+/, '')

      if (!cleanPath) {
        throw new Error('Path dokumen kosong.')
      }

      console.log('Document path:', cleanPath)
      console.log('Storage bucket:', BUCKET_NAME)

      // Try a signed URL first.
      const { data, error } = await supabase.storage
        .from(BUCKET_NAME)
        .createSignedUrl(cleanPath, 60)

      if (!error && data?.signedUrl) {
        return data.signedUrl
      }

      console.error('Signed URL failed:', error)

      // Fallback to public URL because this bucket is currently public.
      const { data: publicData } = supabase.storage.from(BUCKET_NAME).getPublicUrl(cleanPath)

      if (publicData?.publicUrl) {
        return publicData.publicUrl
      }

      throw error || new Error('Gagal mendapatkan URL dokumen.')
    },

    // VIEW DOCUMENT
    async viewDocument(docItem) {
      const newTab = window.open('about:blank', '_blank')

      if (!newTab) {
        alert('Please allow pop-ups for this website.')
        return
      }

      this.openingDocument = docItem.key

      try {
        const url = await this.getDocumentUrl(docItem.path)
        const extension = this.fileName(docItem.path).split('.').pop().toLowerCase()

        if (extension === 'docx' || extension === 'doc') {
          const viewerUrl =
            'https://view.officeapps.live.com/op/view.aspx?src=' + encodeURIComponent(url)

          newTab.location.href = viewerUrl
        } else {
          newTab.location.href = url
        }
      } catch (error) {
        console.error('View document failed:', error)
        newTab.close()

        alert(`Dokumen gagal dibuka: ${error.message || 'Unknown error'}`)
      } finally {
        this.openingDocument = null
      }
    },

    // DOWNLOAD DOCUMENT
    async downloadDocument(docItem) {
      this.downloadingDocument = docItem.key

      try {
        const url = await this.getDocumentUrl(docItem.path)

        const response = await fetch(url)

        if (!response.ok) {
          throw new Error(`Gagal mengunduh dokumen (HTTP ${response.status}).`)
        }

        const blob = await response.blob()
        const objectUrl = URL.createObjectURL(blob)
        const link = window.document.createElement('a')

        link.href = objectUrl
        link.download = this.fileName(docItem.path)

        window.document.body.appendChild(link)
        link.click()
        link.remove()

        // Delay revoking the URL to allow the browser to start downloading.
        window.setTimeout(() => {
          URL.revokeObjectURL(objectUrl)
        }, 1000)
      } catch (error) {
        console.error('Download document failed:', error)

        alert(`Dokumen gagal diunduh: ${error.message || 'Unknown error'}`)
      } finally {
        this.downloadingDocument = null
      }
    },

    // UPDATE APPLICATION STATUS
    async updateStatus() {
      if (!this.application || this.savingStatus) return

      this.savingStatus = true
      this.statusMessage = ''
      this.statusFailed = false

      try {
        const { data, error } = await supabase
          .from('applications')
          .update({ status: this.selectedStatus })
          .eq('id', this.application.id)
          .select('id, status')
          .single()

        if (error) throw error

        this.application.status = data.status
        this.selectedStatus = data.status
        this.statusMessage = 'Status lamaran berhasil diperbarui.'
      } catch (error) {
        console.error('Update status failed:', error)

        this.statusFailed = true
        this.statusMessage = error.message || 'Gagal memperbarui status.'
      } finally {
        this.savingStatus = false
      }
    },

    // HELPERS
    fileName(path) {
      return path ? path.split('/').pop() : ''
    },

    statusClass(status) {
      const classes = {
        Pending: 'pending',
        New: 'new',
        'In Review': 'review',
        Shortlisted: 'shortlisted',
        Interview: 'interview',
        Rejected: 'rejected',
      }

      return classes[status] || ''
    },

    goBack() {
      this.$router.push('/admin/applicants')
    },

    logout() {
      this.$router.push('/admin/login')
    },
  },
}
</script>
