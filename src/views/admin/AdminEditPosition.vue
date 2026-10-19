<template>
  <div class="admin-layout">
    <AdminSidebar />

    <div class="admin-main">
      <AdminTopbar />

      <main class="admin-content">
        <!-- LOADING -->
        <section v-if="isLoading" class="admin-card">
          <div class="admin-form-message">Loading position...</div>
        </section>

        <!-- ERROR -->
        <section v-else-if="errorMessage" class="admin-card">
          <div class="admin-form-message admin-form-error">
            {{ errorMessage }}
          </div>
        </section>

        <!-- EDIT FORM -->
        <section v-else class="admin-card">
          <!-- BACK -->
          <router-link to="/admin/open-positions" class="admin-back-link">
            ← Back to Open Positions
          </router-link>

          <!-- PAGE HEADER -->
          <div class="admin-edit-header">
            <h1>Edit Position</h1>

            <p>Update the job opening information displayed on the career portal.</p>
          </div>

          <!-- FORM -->
          <form class="admin-position-form" @submit.prevent="updatePosition">
            <!-- POSITION INFORMATION -->
            <div class="admin-form-section">
              <h2>POSITION INFORMATION</h2>

              <div class="admin-form-grid">
                <!-- POSITION TITLE -->
                <div class="admin-form-field">
                  <label> Position Title <span>*</span> </label>

                  <input v-model="form.title" type="text" placeholder="e.g. Engineering" required />
                </div>

                <!-- DEPARTMENT -->
                <div class="admin-form-field">
                  <label> Department <span>*</span> </label>

                  <select v-model="form.department" required>
                    <option value="" disabled>Select Department</option>

                    <option value="IT Department">IT Department</option>

                    <option value="Engineering Department">Engineering Department</option>

                    <option value="Engineer Department">Engineer Department</option>

                    <option value="Production Department">Production Department</option>

                    <option value="IHR Department">IHR Department</option>
                  </select>
                </div>

                <!-- EMPLOYMENT TYPE -->
                <div class="admin-form-field">
                  <label> Employment Type <span>*</span> </label>

                  <select v-model="form.job_type" required>
                    <option value="" disabled>Select Employment Type</option>

                    <option value="Full Time">Full Time</option>

                    <option value="Contract">Contract</option>

                    <option value="Internship">Internship</option>
                  </select>
                </div>
              </div>
            </div>

            <!-- DESCRIPTION -->
            <div class="admin-form-section">
              <div class="admin-form-field">
                <label> DESKRIPSI PEKERJAAN <span>*</span> </label>

                <textarea
                  v-model="form.description"
                  placeholder="Tuliskan deskripsi lengkap mengenai peran, visi, tim, dan kontribusi posisi ini di RPC..."
                  required
                ></textarea>
              </div>
            </div>

            <!-- RESPONSIBILITIES -->
            <div class="admin-form-section">
              <div class="admin-form-field">
                <label> TANGGUNG JAWAB <span>*</span> </label>

                <textarea
                  v-model="form.responsibilities"
                  placeholder="Melakukan perancangan dan pengembangan solusi teknis.
Menganalisis dan memecahkan masalah teknis."
                  required
                ></textarea>

                <small> Masukkan setiap tanggung jawab pada baris baru. </small>
              </div>
            </div>

            <!-- QUALIFICATIONS -->
            <div class="admin-form-section">
              <div class="admin-form-field">
                <label> KUALIFIKASI <span>*</span> </label>

                <textarea
                  v-model="form.requirements"
                  placeholder="Minimal Diploma atau Sarjana di bidang Teknik.
Memiliki kemampuan analisis dan komunikasi yang baik."
                  required
                ></textarea>

                <small> Masukkan setiap kualifikasi pada baris baru. </small>
              </div>
            </div>

            <!-- FORM ERROR -->
            <div v-if="formError" class="admin-form-error-box">
              {{ formError }}
            </div>

            <!-- FORM ACTIONS -->
            <div class="admin-form-actions">
              <router-link to="/admin/open-positions" class="admin-secondary-button">
                Cancel
              </router-link>

              <button type="submit" class="admin-primary-button" :disabled="isSaving">
                {{ isSaving ? 'Saving...' : 'Save Changes ✓' }}
              </button>
            </div>
          </form>
        </section>
      </main>
    </div>
  </div>
</template>

<script setup>
import { onMounted, reactive, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'

import AdminSidebar from '../../components/AdminSidebar.vue'
import AdminTopbar from '../../components/AdminTopbar.vue'

import { supabase } from '../../lib/supabase'

// ==========================================
// ROUTER
// ==========================================

const route = useRoute()
const router = useRouter()

// ==========================================
// STATE
// ==========================================

const isLoading = ref(true)
const isSaving = ref(false)

const errorMessage = ref('')
const formError = ref('')

// ==========================================
// FORM
// ==========================================

const form = reactive({
  title: '',
  department: '',
  job_type: '',
  description: '',
  responsibilities: '',
  requirements: '',
})

// ==========================================
// GET JOB ID
// ==========================================

const jobId = route.params.id

// ==========================================
// LOAD POSITION
// ==========================================

async function loadPosition() {
  isLoading.value = true
  errorMessage.value = ''

  try {
    console.log('================================')
    console.log('LOADING POSITION FOR EDIT')
    console.log('================================')

    console.log('Job ID:', jobId)

    const { data, error } = await supabase
      .from('jobs')
      .select(
        `
        id,
        title,
        department,
        job_type,
        description,
        responsibilities,
        requirements
      `,
      )
      .eq('id', jobId)
      .single()

    if (error) {
      throw new Error(`Failed to load position: ${error.message}`)
    }

    if (!data) {
      throw new Error('Position not found.')
    }

    console.log('Position loaded:', data)

    form.title = data.title || ''
    form.department = data.department || ''
    form.job_type = data.job_type || ''
    form.description = data.description || ''
    form.responsibilities = data.responsibilities || ''
    form.requirements = data.requirements || ''
  } catch (error) {
    console.error('Failed to load position:', error)

    errorMessage.value = error.message || 'Failed to load position.'
  } finally {
    isLoading.value = false
  }
}

// ==========================================
// UPDATE POSITION
// ==========================================

async function updatePosition() {
  formError.value = ''

  // Basic validation
  if (!form.title.trim()) {
    formError.value = 'Position Title is required.'
    return
  }

  if (!form.department) {
    formError.value = 'Department is required.'
    return
  }

  if (!form.job_type) {
    formError.value = 'Employment Type is required.'
    return
  }

  if (!form.description.trim()) {
    formError.value = 'Job description is required.'
    return
  }

  if (!form.responsibilities.trim()) {
    formError.value = 'Responsibilities are required.'
    return
  }

  if (!form.requirements.trim()) {
    formError.value = 'Qualifications are required.'
    return
  }

  isSaving.value = true

  try {
    console.log('================================')
    console.log('UPDATING JOB POSITION')
    console.log('================================')

    console.log('Job ID:', jobId)
    console.log('Position:', form.title)

    const { data, error } = await supabase
      .from('jobs')
      .update({
        title: form.title.trim(),
        department: form.department,
        job_type: form.job_type,
        description: form.description.trim(),
        responsibilities: form.responsibilities.trim(),
        requirements: form.requirements.trim(),
      })
      .eq('id', jobId)
      .select()
      .single()

    if (error) {
      throw new Error(`Failed to update position: ${error.message}`)
    }

    console.log('Position updated successfully:', data)

    // Return to Open Positions
    router.push('/admin/open-positions')
  } catch (error) {
    console.error('Failed to update position:', error)

    formError.value = error.message || 'Failed to update position.'
  } finally {
    isSaving.value = false
  }
}

// ==========================================
// LOAD DATA
// ==========================================

onMounted(() => {
  loadPosition()
})
</script>

<style scoped>
/* ==========================================
   BACK LINK
   ========================================== */

.admin-back-link {
  display: inline-block;
  margin-bottom: 12px;
  color: #1779d4;
  font-size: 8px;
  text-decoration: none;
}

.admin-back-link:hover {
  text-decoration: underline;
}

/* ==========================================
   HEADER
   ========================================== */

.admin-edit-header {
  margin-bottom: 20px;
}

.admin-edit-header h1 {
  margin: 0 0 5px;
}

.admin-edit-header p {
  margin: 0;
  color: #718096;
  font-size: 9px;
}

/* ==========================================
   FORM
   ========================================== */

.admin-position-form {
  width: 100%;
}

.admin-form-section {
  padding: 0 0 20px;
  margin-bottom: 20px;
  border-bottom: 1px solid #e5e9ee;
}

.admin-form-section:last-of-type {
  margin-bottom: 0;
}

.admin-form-section h2 {
  margin: 0 0 16px;
  color: #1b365d;
  font-size: 10px;
  font-weight: 700;
}

/* ==========================================
   FORM GRID
   ========================================== */

.admin-form-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 12px;
}

/* ==========================================
   FIELD
   ========================================== */

.admin-form-field {
  display: flex;
  flex-direction: column;
}

.admin-form-field label {
  margin-bottom: 7px;
  color: #243b5a;
  font-size: 8px;
  font-weight: 700;
}

.admin-form-field label span {
  color: #00a651;
}

.admin-form-field input,
.admin-form-field select,
.admin-form-field textarea {
  width: 100%;
  box-sizing: border-box;
  border: 1px solid #dfe4ea;
  border-radius: 4px;
  outline: none;
  background: #fff;
  color: #243b5a;
  font-family: inherit;
  font-size: 8px;
}

.admin-form-field input,
.admin-form-field select {
  height: 27px;
  padding: 0 9px;
}

.admin-form-field textarea {
  min-height: 82px;
  padding: 9px;
  resize: vertical;
  line-height: 1.5;
}

.admin-form-field input:focus,
.admin-form-field select:focus,
.admin-form-field textarea:focus {
  border-color: #b9c6d3;
}

.admin-form-field input::placeholder,
.admin-form-field textarea::placeholder {
  color: #9aa7b5;
}

/* ==========================================
   SMALL HELP TEXT
   ========================================== */

.admin-form-field small {
  margin-top: 6px;
  color: #718096;
  font-size: 7px;
}

/* ==========================================
   FORM MESSAGE
   ========================================== */

.admin-form-message {
  padding: 45px 20px;
  text-align: center;
  color: #718096;
  font-size: 9px;
}

.admin-form-error {
  color: #c0392b;
}

/* ==========================================
   ERROR BOX
   ========================================== */

.admin-form-error-box {
  margin: 15px 0;
  padding: 10px 12px;
  border: 1px solid #f3c4c4;
  border-radius: 4px;
  background: #fff5f5;
  color: #c0392b;
  font-size: 8px;
}

/* ==========================================
   ACTIONS
   ========================================== */

.admin-form-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 20px;
}

/* ==========================================
   SECONDARY BUTTON
   ========================================== */

.admin-secondary-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 27px;
  padding: 0 13px;
  border: 1px solid #dfe4ea;
  border-radius: 4px;
  background: #f5f7f9;
  color: #344154;
  font-size: 8px;
  text-decoration: none;
  cursor: pointer;
}

/* ==========================================
   PRIMARY BUTTON
   ========================================== */

.admin-primary-button:disabled {
  opacity: 0.55;
  cursor: not-allowed;
}

/* ==========================================
   RESPONSIVE
   ========================================== */

@media (max-width: 800px) {
  .admin-form-grid {
    grid-template-columns: 1fr;
  }
}
</style>
