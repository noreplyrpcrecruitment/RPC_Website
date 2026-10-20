<template>
  <div class="admin-page">
    <AdminSidebar />

    <div class="admin-main">
      <AdminTopbar />

      <main class="admin-content">
        <router-link to="/admin/open-positions" class="admin-back-link">
          ← Back to Open Positions
        </router-link>

        <div class="admin-page-heading">
          <h1>Add Position</h1>
          <p>Create a new job opening to be displayed on the career portal.</p>
        </div>

        <section class="admin-form-card">
          <div class="admin-form-section-title">POSITION INFORMATION</div>

          <form @submit.prevent="savePosition">
            <div class="admin-form-grid">
              <!-- Position Title -->
              <div class="admin-form-group">
                <label>Position Title <span>*</span></label>
                <input
                  v-model="form.title"
                  type="text"
                  placeholder="e.g. Engineering"
                  :disabled="isSaving"
                  required
                />
              </div>

              <!-- Department: Text Input -->
              <div class="admin-form-group">
                <label>Department <span>*</span></label>
                <input
                  v-model="form.department"
                  type="text"
                  placeholder="Enter department name"
                  :disabled="isSaving"
                  required
                />
              </div>

              <!-- Employment Type -->
              <div class="admin-form-group">
                <label>Employment Type <span>*</span></label>
                <select v-model="form.job_type" :disabled="isSaving" required>
                  <option value="" disabled>Select Employment Type</option>
                  <option value="Full Time">Full Time</option>
                  <option value="Contract">Contract</option>
                  <option value="Internship">Internship</option>
                </select>
              </div>
            </div>

            <div class="admin-form-divider"></div>

            <!-- Description -->
            <div class="admin-form-group admin-form-full">
              <label>DESKRIPSI PEKERJAAN <span>*</span></label>
              <textarea
                v-model="form.description"
                placeholder="Tuliskan deskripsi lengkap mengenai peran, visi, tim, dan kontribusi posisi ini di RPC..."
                :disabled="isSaving"
                required
              ></textarea>
            </div>

            <div class="admin-form-divider"></div>

            <!-- Responsibilities -->
            <div class="admin-form-group admin-form-full">
              <label>TANGGUNG JAWAB <span>*</span></label>
              <textarea
                v-model="form.responsibilities"
                placeholder="Melakukan perancangan dan pengembangan solusi teknis.
Menganalisis dan memecahkan masalah teknis."
                :disabled="isSaving"
                required
              ></textarea>
              <small>Masukkan setiap tanggung jawab pada baris baru.</small>
            </div>

            <div class="admin-form-divider"></div>

            <!-- Requirements -->
            <div class="admin-form-group admin-form-full">
              <label>KUALIFIKASI <span>*</span></label>
              <textarea
                v-model="form.requirements"
                placeholder="Minimal Diploma atau Sarjana di bidang Teknik.
Memiliki kemampuan analisis dan komunikasi yang baik."
                :disabled="isSaving"
                required
              ></textarea>
              <small>Masukkan setiap kualifikasi pada baris baru.</small>
            </div>

            <!-- Error -->
            <div v-if="formError" class="admin-form-error">
              {{ formError }}
            </div>

            <!-- Success -->
            <div v-if="successMessage" class="admin-form-success">
              {{ successMessage }}
            </div>

            <!-- Actions -->
            <div class="admin-form-actions">
              <router-link to="/admin/open-positions" class="admin-cancel-btn">
                Cancel
              </router-link>

              <button type="submit" class="admin-save-btn" :disabled="isSaving">
                {{ isSaving ? 'Saving...' : 'Save Position ✓' }}
              </button>
            </div>
          </form>
        </section>
      </main>
    </div>
  </div>
</template>

<script>
import AdminSidebar from '../../components/AdminSidebar.vue'
import AdminTopbar from '../../components/AdminTopbar.vue'
import { supabase } from '../../lib/supabase'

export default {
  name: 'AdminAddPosition',

  components: {
    AdminSidebar,
    AdminTopbar,
  },

  data() {
    return {
      isSaving: false,
      formError: '',
      successMessage: '',

      form: {
        title: '',
        department: '',
        job_type: '',
        location: '',
        description: '',
        responsibilities: '',
        requirements: '',
      },
    }
  },

  methods: {
    async savePosition() {
      this.formError = ''
      this.successMessage = ''

      // Validation
      if (!this.form.title.trim()) {
        this.formError = 'Position Title is required.'
        return
      }

      if (!this.form.department.trim()) {
        this.formError = 'Department is required.'
        return
      }

      if (!this.form.job_type) {
        this.formError = 'Employment Type is required.'
        return
      }

      if (!this.form.description.trim()) {
        this.formError = 'Job description is required.'
        return
      }

      if (!this.form.responsibilities.trim()) {
        this.formError = 'Responsibilities are required.'
        return
      }

      if (!this.form.requirements.trim()) {
        this.formError = 'Qualifications are required.'
        return
      }

      this.isSaving = true

      try {
        console.log('==============================')
        console.log('ADDING NEW POSITION')
        console.log('==============================')

        console.log('Position:', this.form.title)
        console.log('Department:', this.form.department)
        console.log('Employment Type:', this.form.job_type)

        // Insert into Supabase
        const { data, error } = await supabase
          .from('jobs')
          .insert({
            title: this.form.title.trim(),
            department: this.form.department.trim(),
            location: this.form.location || null,
            job_type: this.form.job_type,
            description: this.form.description.trim(),
            responsibilities: this.form.responsibilities.trim(),
            requirements: this.form.requirements.trim(),
          })
          .select()
          .single()

        if (error) {
          throw new Error(`Failed to create position: ${error.message}`)
        }

        console.log('Position created successfully:', data)

        this.successMessage = 'Position created successfully.'

        // Redirect after successful save
        setTimeout(() => {
          this.$router.push('/admin/open-positions')
        }, 700)
      } catch (error) {
        console.error('Failed to create position:', error)

        this.formError = error.message || 'Failed to create position. Please try again.'
      } finally {
        this.isSaving = false
      }
    },
  },
}
</script>

<style scoped>
/* ==========================================
   ADD POSITION PAGE
   ========================================== */

.admin-content {
  padding: 24px 24px 40px;
}

/* Back link */
.admin-back-link {
  display: inline-block;
  margin-bottom: 12px;
  color: #1687d9;
  font-size: 10px;
  font-weight: 500;
  text-decoration: none;
}

.admin-back-link:hover {
  text-decoration: underline;
}

/* Heading */
.admin-page-heading {
  margin-bottom: 18px;
}

.admin-page-heading h1 {
  margin: 0 0 5px;
  color: #18304b;
  font-size: 18px;
  font-weight: 700;
}

.admin-page-heading p {
  margin: 0;
  color: #718096;
  font-size: 9px;
}

/* Form card */
.admin-form-card {
  width: 100%;
  box-sizing: border-box;
  padding: 22px 20px 20px;
  background: #ffffff;
  border: 1px solid #e0e5ea;
  border-radius: 6px;
}

/* Section title */
.admin-form-section-title {
  margin-bottom: 20px;
  color: #263b53;
  font-size: 10px;
  font-weight: 700;
}

/* Grid */
.admin-form-grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 12px;
}

/* Form group */
.admin-form-group {
  display: flex;
  flex-direction: column;
}

.admin-form-group label {
  margin-bottom: 7px;
  color: #34495e;
  font-size: 8px;
  font-weight: 700;
}

.admin-form-group label span {
  color: #00a651;
}

/* Inputs */
.admin-form-group input,
.admin-form-group select,
.admin-form-group textarea {
  width: 100%;
  box-sizing: border-box;
  border: 1px solid #dfe4e9;
  border-radius: 4px;
  outline: none;
  background: #f7f8fa;
  color: #344154;
  font-family: inherit;
  font-size: 8px;
}

.admin-form-group input,
.admin-form-group select {
  height: 25px;
  padding: 0 9px;
}

.admin-form-group textarea {
  min-height: 82px;
  padding: 9px;
  resize: vertical;
  line-height: 1.45;
}

.admin-form-group input::placeholder,
.admin-form-group textarea::placeholder {
  color: #8793a1;
}

.admin-form-group select {
  cursor: pointer;
}

.admin-form-group input:focus,
.admin-form-group select:focus,
.admin-form-group textarea:focus {
  border-color: #aebdca;
  background: #ffffff;
}

.admin-form-group input:disabled,
.admin-form-group select:disabled,
.admin-form-group textarea:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

/* Full width */
.admin-form-full {
  width: 100%;
}

/* Divider */
.admin-form-divider {
  height: 1px;
  margin: 16px 0 18px;
  background: #e6e9ed;
}

/* Helper text */
.admin-form-group small {
  margin-top: 6px;
  color: #778597;
  font-size: 7px;
}

/* Error */
.admin-form-error {
  margin-top: 16px;
  padding: 9px 10px;
  border: 1px solid #f0caca;
  border-radius: 4px;
  background: #fff5f5;
  color: #c0392b;
  font-size: 8px;
}

/* Success */
.admin-form-success {
  margin-top: 16px;
  padding: 9px 10px;
  border: 1px solid #bde8cf;
  border-radius: 4px;
  background: #f1fff7;
  color: #008f46;
  font-size: 8px;
}

/* Actions */
.admin-form-actions {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: 18px;
  padding-top: 18px;
  border-top: 1px solid #e6e9ed;
}

.admin-cancel-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 55px;
  height: 24px;
  padding: 0 11px;
  border: 1px solid #dfe4e9;
  border-radius: 4px;
  background: #f5f6f7;
  color: #526174;
  font-size: 8px;
  text-decoration: none;
}

.admin-cancel-btn:hover {
  background: #eceff2;
}

.admin-save-btn {
  min-width: 96px;
  height: 25px;
  padding: 0 12px;
  border: 0;
  border-radius: 4px;
  background: #00a651;
  color: #ffffff;
  font-family: inherit;
  font-size: 8px;
  font-weight: 600;
  cursor: pointer;
}

.admin-save-btn:hover {
  background: #008f46;
}

.admin-save-btn:disabled {
  opacity: 0.65;
  cursor: not-allowed;
}

/* Responsive */
@media (max-width: 900px) {
  .admin-form-grid {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 600px) {
  .admin-content {
    padding: 18px 14px 30px;
  }

  .admin-form-card {
    padding: 18px 14px;
  }

  .admin-form-actions {
    gap: 10px;
  }
}
</style>
