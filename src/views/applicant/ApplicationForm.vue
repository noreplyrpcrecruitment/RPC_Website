<template>
  <div class="page">
    <Navbar />

    <main>
      <section class="form-page site-container">
        <div class="form-header">
          <h1>Form Lamaran Pekerjaan</h1>
          <p>
            Lengkapi data berikut untuk melamar posisi
            <strong>{{ job?.title || 'pekerjaan' }}</strong
            >.
          </p>
        </div>

        <form class="application-form" @submit.prevent="submitApplication" novalidate>
          <label>Nama Lengkap <span>*</span></label>
          <input
            v-model="form.name"
            type="text"
            placeholder="Masukkan nama lengkap Anda"
            :disabled="isSubmitting"
          />

          <label>Email <span>*</span></label>
          <input
            v-model="form.email"
            type="email"
            placeholder="Masukkan email Anda"
            :disabled="isSubmitting"
          />

          <label>Nomor Telepon <span>*</span></label>
          <input
            v-model="form.phone"
            type="tel"
            placeholder="Masukkan nomor telepon Anda"
            :disabled="isSubmitting"
          />

          <label>Alamat <span>*</span></label>
          <textarea
            v-model="form.address"
            placeholder="Masukkan alamat Anda"
            :disabled="isSubmitting"
          ></textarea>

          <label>Pendidikan Terakhir <span>*</span></label>
          <input
            v-model="form.education"
            type="text"
            placeholder="Masukkan pendidikan terakhir Anda"
            :disabled="isSubmitting"
          />

          <!-- CV / RESUME -->
          <label>CV / Resume <span>*</span></label>
          <div class="file-box">
            <div class="file-info">
              <strong>Upload CV / Resume</strong>
              <small>Format: PDF, DOC, DOCX • Maks. 5 MB</small>
              <small v-if="form.cv" class="file-name">
                {{ form.cv.name }}
              </small>
            </div>

            <label v-if="!form.cv" class="file-button">
              Choose File
              <input
                ref="cvInput"
                type="file"
                accept=".pdf,.doc,.docx"
                :disabled="isSubmitting"
                @change="handleFileUpload('cv', $event)"
              />
            </label>

            <button
              v-else
              type="button"
              class="remove-file"
              aria-label="Remove CV"
              title="Remove CV"
              :disabled="isSubmitting"
              @click="removeFile('cv', 'cvInput')"
            >
              ×
            </button>
          </div>

          <!-- COVER LETTER -->
          <label>Surat Lamaran Kerja <span>*</span></label>
          <div class="file-box">
            <div class="file-info">
              <strong>Upload Surat Lamaran Kerja</strong>
              <small>Format: PDF, DOC, DOCX • Maks. 5 MB</small>
              <small v-if="form.coverLetter" class="file-name">
                {{ form.coverLetter.name }}
              </small>
            </div>

            <label v-if="!form.coverLetter" class="file-button">
              Choose File
              <input
                ref="coverLetterInput"
                type="file"
                accept=".pdf,.doc,.docx"
                :disabled="isSubmitting"
                @change="handleFileUpload('coverLetter', $event)"
              />
            </label>

            <button
              v-else
              type="button"
              class="remove-file"
              aria-label="Remove cover letter"
              title="Remove cover letter"
              :disabled="isSubmitting"
              @click="removeFile('coverLetter', 'coverLetterInput')"
            >
              ×
            </button>
          </div>

          <!-- PHOTO -->
          <label>Foto <span>*</span></label>
          <div class="file-box">
            <div class="file-info">
              <strong>Upload Foto</strong>
              <small>Format: JPG, JPEG, PNG • Maks. 5 MB</small>
              <small v-if="form.photo" class="file-name">
                {{ form.photo.name }}
              </small>
            </div>

            <label v-if="!form.photo" class="file-button">
              Choose File
              <input
                ref="photoInput"
                type="file"
                accept=".jpg,.jpeg,.png"
                :disabled="isSubmitting"
                @change="handleFileUpload('photo', $event)"
              />
            </label>

            <button
              v-else
              type="button"
              class="remove-file"
              aria-label="Remove photo"
              title="Remove photo"
              :disabled="isSubmitting"
              @click="removeFile('photo', 'photoInput')"
            >
              ×
            </button>
          </div>

          <!-- KTP -->
          <label>KTP <span>*</span></label>
          <div class="file-box">
            <div class="file-info">
              <strong>Upload KTP</strong>
              <small>Format: JPG, JPEG, PNG, PDF • Maks. 5 MB</small>
              <small v-if="form.ktp" class="file-name">
                {{ form.ktp.name }}
              </small>
            </div>

            <label v-if="!form.ktp" class="file-button">
              Choose File
              <input
                ref="ktpInput"
                type="file"
                accept=".jpg,.jpeg,.png,.pdf"
                :disabled="isSubmitting"
                @change="handleFileUpload('ktp', $event)"
              />
            </label>

            <button
              v-else
              type="button"
              class="remove-file"
              aria-label="Remove KTP"
              title="Remove KTP"
              :disabled="isSubmitting"
              @click="removeFile('ktp', 'ktpInput')"
            >
              ×
            </button>
          </div>

          <!-- SKCK -->
          <label>SKCK <span>*</span></label>
          <div class="file-box">
            <div class="file-info">
              <strong>Upload SKCK</strong>
              <small>Format: JPG, JPEG, PNG, PDF • Maks. 5 MB</small>
              <small v-if="form.skck" class="file-name">
                {{ form.skck.name }}
              </small>
            </div>

            <label v-if="!form.skck" class="file-button">
              Choose File
              <input
                ref="skckInput"
                type="file"
                accept=".jpg,.jpeg,.png,.pdf"
                :disabled="isSubmitting"
                @change="handleFileUpload('skck', $event)"
              />
            </label>

            <button
              v-else
              type="button"
              class="remove-file"
              aria-label="Remove SKCK"
              title="Remove SKCK"
              :disabled="isSubmitting"
              @click="removeFile('skck', 'skckInput')"
            >
              ×
            </button>
          </div>

          <!-- HEALTH CERTIFICATE -->
          <label>Surat Keterangan Sehat <span>*</span></label>
          <div class="file-box">
            <div class="file-info">
              <strong>Upload Surat Keterangan Sehat</strong>
              <small>Format: JPG, JPEG, PNG, PDF • Maks. 5 MB</small>
              <small v-if="form.healthCertificate" class="file-name">
                {{ form.healthCertificate.name }}
              </small>
            </div>

            <label v-if="!form.healthCertificate" class="file-button">
              Choose File
              <input
                ref="healthCertificateInput"
                type="file"
                accept=".jpg,.jpeg,.png,.pdf"
                :disabled="isSubmitting"
                @change="handleFileUpload('healthCertificate', $event)"
              />
            </label>

            <button
              v-else
              type="button"
              class="remove-file"
              aria-label="Remove health certificate"
              title="Remove health certificate"
              :disabled="isSubmitting"
              @click="removeFile('healthCertificate', 'healthCertificateInput')"
            >
              ×
            </button>
          </div>

          <!-- WORK EXPERIENCE - OPTIONAL -->
          <label>
            Surat Pengalaman Kerja
            <span class="optional-label">(Optional)</span>
          </label>
          <div class="file-box">
            <div class="file-info">
              <strong>Upload Surat Pengalaman Kerja</strong>
              <small>Format: PDF, DOC, DOCX • Maks. 5 MB</small>
              <small v-if="form.workExperience" class="file-name">
                {{ form.workExperience.name }}
              </small>
            </div>

            <label v-if="!form.workExperience" class="file-button">
              Choose File
              <input
                ref="workExperienceInput"
                type="file"
                accept=".pdf,.doc,.docx"
                :disabled="isSubmitting"
                @change="handleFileUpload('workExperience', $event)"
              />
            </label>

            <button
              v-else
              type="button"
              class="remove-file"
              aria-label="Remove work experience"
              title="Remove work experience"
              :disabled="isSubmitting"
              @click="removeFile('workExperience', 'workExperienceInput')"
            >
              ×
            </button>
          </div>

          <!-- IJAZAH -->
          <label>Ijazah <span>*</span></label>
          <div class="file-box">
            <div class="file-info">
              <strong>Upload Ijazah</strong>
              <small>Format: JPG, JPEG, PNG, PDF • Maks. 5 MB</small>
              <small v-if="form.ijazah" class="file-name">
                {{ form.ijazah.name }}
              </small>
            </div>

            <label v-if="!form.ijazah" class="file-button">
              Choose File
              <input
                ref="ijazahInput"
                type="file"
                accept=".jpg,.jpeg,.png,.pdf"
                :disabled="isSubmitting"
                @change="handleFileUpload('ijazah', $event)"
              />
            </label>

            <button
              v-else
              type="button"
              class="remove-file"
              aria-label="Remove Ijazah"
              title="Remove Ijazah"
              :disabled="isSubmitting"
              @click="removeFile('ijazah', 'ijazahInput')"
            >
              ×
            </button>
          </div>

          <!-- ERROR -->
          <p v-if="formError" class="form-error" role="alert">
            {{ formError }}
          </p>

          <!-- SUBMIT -->
          <button
            type="submit"
            class="btn btn-primary submit-btn"
            :class="{ 'is-submitting': isSubmitting }"
            :disabled="isSubmitting || isLoadingJob"
            :aria-busy="isSubmitting"
          >
            {{
              isSubmitting
                ? 'Mengirim Lamaran...'
                : isLoadingJob
                  ? 'Memuat Lowongan...'
                  : 'Kirim Lamaran →'
            }}
          </button>
        </form>
      </section>
    </main>

    <Footer />
  </div>
</template>

<script>
import Navbar from '../../components/Navbar.vue'
import Footer from '../../components/Footer.vue'
import { supabase } from '../../lib/supabase'
import { submitApplication as submitApplicationToSupabase } from '../../services/applicationService'

export default {
  name: 'ApplicationForm',

  components: {
    Navbar,
    Footer,
  },

  data() {
    return {
      job: null,
      isSubmitting: false,
      isLoadingJob: true,

      form: {
        name: '',
        email: '',
        phone: '',
        address: '',
        education: '',
        cv: null,
        coverLetter: null,
        photo: null,
        ktp: null,
        skck: null,
        healthCertificate: null,
        workExperience: null,
        ijazah: null,
      },

      formError: '',
    }
  },

  async mounted() {
    await this.loadJob()
  },

  methods: {
    async loadJob() {
      this.isLoadingJob = true
      this.job = null
      this.formError = ''

      try {
        const routeJobId = this.$route.params.id
        let selectedJob = null

        if (routeJobId) {
          const { data, error } = await supabase
            .from('jobs')
            .select(
              `
              id,
              title,
              department,
              location,
              job_type,
              description,
              responsibilities,
              requirements,
              posted_date,
              created_at,
              is_active
            `,
            )
            .eq('id', routeJobId)
            .eq('is_active', true)
            .maybeSingle()

          if (error) throw error

          selectedJob = data
        } else {
          const savedJob = localStorage.getItem('selectedJob')

          if (savedJob) {
            try {
              const parsedJob = JSON.parse(savedJob)

              if (parsedJob?.id) {
                const { data, error } = await supabase
                  .from('jobs')
                  .select(
                    `
                    id,
                    title,
                    department,
                    location,
                    job_type,
                    description,
                    responsibilities,
                    requirements,
                    posted_date,
                    created_at,
                    is_active
                  `,
                  )
                  .eq('id', parsedJob.id)
                  .eq('is_active', true)
                  .maybeSingle()

                if (error) throw error

                selectedJob = data
              }
            } catch (error) {
              console.error('Failed to load saved job:', error)
            }
          }
        }

        if (!selectedJob) {
          this.formError =
            'Lowongan tidak ditemukan atau sudah tidak tersedia. Silakan kembali ke halaman lowongan.'
          return
        }

        this.job = selectedJob

        localStorage.setItem('selectedJob', JSON.stringify(selectedJob))

        console.log('Active job loaded:', this.job)
      } catch (error) {
        console.error('Failed to load job:', error)

        this.formError = 'Gagal memuat informasi lowongan. Silakan refresh halaman dan coba lagi.'
      } finally {
        this.isLoadingJob = false
      }
    },

    handleFileUpload(type, event) {
      if (this.isSubmitting) return

      const file = event.target.files?.[0]

      if (!file) {
        this.form[type] = null
        return
      }

      const maxSize = 5 * 1024 * 1024

      const allowedExtensionsByType = {
        cv: ['.pdf', '.doc', '.docx'],
        coverLetter: ['.pdf', '.doc', '.docx'],
        photo: ['.jpg', '.jpeg', '.png'],
        ktp: ['.jpg', '.jpeg', '.png', '.pdf'],
        skck: ['.jpg', '.jpeg', '.png', '.pdf'],
        healthCertificate: ['.jpg', '.jpeg', '.png', '.pdf'],
        workExperience: ['.pdf', '.doc', '.docx'],
        ijazah: ['.jpg', '.jpeg', '.png', '.pdf'],
      }

      if (file.size > maxSize) {
        this.formError = 'Ukuran file maksimal adalah 5 MB.'
        event.target.value = ''
        this.form[type] = null
        return
      }

      const fileName = file.name.toLowerCase()
      const allowedExtensions = allowedExtensionsByType[type] || []

      const isAllowed = allowedExtensions.some((extension) => fileName.endsWith(extension))

      if (!isAllowed) {
        this.formError = 'Format file tidak sesuai dengan ketentuan.'
        event.target.value = ''
        this.form[type] = null
        return
      }

      this.formError = ''
      this.form[type] = file

      console.log(`${type} selected:`, file.name)
    },

    removeFile(type, inputRef) {
      if (this.isSubmitting) return

      this.form[type] = null

      const input = this.$refs[inputRef]

      if (input) {
        input.value = ''
      }

      this.formError = ''
    },

    validateForm() {
      if (!this.form.name.trim()) {
        return 'Nama lengkap wajib diisi.'
      }

      if (!this.form.email.trim()) {
        return 'Email wajib diisi.'
      }

      const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

      if (!emailPattern.test(this.form.email.trim())) {
        return 'Masukkan alamat email yang valid.'
      }

      if (!this.form.phone.trim()) {
        return 'Nomor telepon wajib diisi.'
      }

      if (!this.form.address.trim()) {
        return 'Alamat wajib diisi.'
      }

      if (!this.form.education.trim()) {
        return 'Pendidikan terakhir wajib diisi.'
      }

      if (!this.form.cv) {
        return 'CV / Resume wajib diupload.'
      }

      if (!this.form.coverLetter) {
        return 'Surat Lamaran Kerja wajib diupload.'
      }

      if (!this.form.photo) {
        return 'Foto wajib diupload.'
      }

      if (!this.form.ktp) {
        return 'KTP wajib diupload.'
      }

      if (!this.form.skck) {
        return 'SKCK wajib diupload.'
      }

      if (!this.form.healthCertificate) {
        return 'Surat Keterangan Sehat wajib diupload.'
      }

      if (!this.form.ijazah) {
        return 'Ijazah wajib diupload.'
      }

      // Work experience is optional.
      return ''
    },

    async submitApplication() {
      // Prevent duplicate submissions.
      if (this.isSubmitting || this.isLoadingJob) return

      this.formError = ''

      const validationError = this.validateForm()

      if (validationError) {
        this.formError = validationError

        this.$nextTick(() => {
          document.querySelector('.form-error')?.scrollIntoView({
            behavior: 'smooth',
            block: 'center',
          })
        })

        return
      }

      if (!this.job?.id) {
        this.formError = 'Lowongan tidak ditemukan. Silakan kembali ke halaman lowongan.'
        return
      }

      // Disable the button immediately before any asynchronous work.
      this.isSubmitting = true

      try {
        // Verify the job is still active before submission.
        const { data: activeJob, error: jobError } = await supabase
          .from('jobs')
          .select('id, title, is_active')
          .eq('id', this.job.id)
          .eq('is_active', true)
          .maybeSingle()

        if (jobError) throw jobError

        if (!activeJob) {
          throw new Error('Lowongan ini sudah tidak tersedia. Silakan pilih lowongan lain.')
        }

        // Save the application and upload documents.
        const result = await submitApplicationToSupabase(this.form, activeJob)

        // Preserve the existing Thank You page data.
        localStorage.setItem(
          'latestApplication',
          JSON.stringify({
            job: activeJob,
            name: this.form.name,
            email: this.form.email,
            applicationId: result.applicationId,
            applicantId: result.applicantId,
            submittedAt: new Date().toISOString(),
          }),
        )

        // Request email notifications separately.
        // A notification error must not cancel a saved application.
        try {
          const { data, error } = await supabase.functions.invoke(
            'send-application-notifications',
            {
              body: {
                applicationId: result.applicationId,
              },
            },
          )

          if (error) {
            console.error('Email notification request failed:', error)
          } else if (data?.success === false) {
            console.error('Email notification failed:', data.message)
          } else {
            console.log('Email notification request completed.', data)
          }
        } catch (notificationError) {
          console.error('Unable to request email notifications:', notificationError)
        }

        // Continue to Thank You even if email notification fails.
        await this.$router.push({
          name: 'thank-you',
        })
      } catch (error) {
        console.error('Application submission failed:', error)

        this.formError = error?.message || 'Gagal mengirim lamaran. Silakan coba lagi.'

        this.$nextTick(() => {
          document.querySelector('.form-error')?.scrollIntoView({
            behavior: 'smooth',
            block: 'center',
          })
        })
      } finally {
        // Re-enable the button if submission fails or the page remains.
        this.isSubmitting = false
      }
    },
  },
}
</script>

<style scoped>
/* Submit button: disabled state */
.submit-btn:disabled {
  cursor: not-allowed !important;
  opacity: 0.45;
  filter: grayscale(40%);
  pointer-events: auto;
}

/* While the application is being submitted */
.submit-btn.is-submitting {
  cursor: not-allowed !important;
}

/* Smooth visual transition */
.submit-btn {
  transition:
    opacity 0.2s ease,
    filter 0.2s ease,
    background-color 0.2s ease;
}
</style>
