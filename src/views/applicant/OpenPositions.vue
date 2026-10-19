<template>
  <div class="page">
    <Navbar />

    <main class="jobs-page">
      <!-- PAGE INTRODUCTION -->
      <section class="jobs-intro site-container">
        <h1>Lowongan Pekerjaan</h1>
        <p>Temukan posisi yang sesuai dengan kemampuan dan tujuan karier Anda.</p>
      </section>

      <!-- JOB LIST -->
      <section class="job-list site-container">
        <!-- LOADING -->
        <div v-if="isLoading" class="jobs-message">
          <span class="loading-spinner"></span>
          <p>Memuat lowongan pekerjaan...</p>
        </div>

        <!-- ERROR -->
        <div v-else-if="errorMessage" class="jobs-message jobs-error">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="28"
            height="28"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="1.7"
            stroke-linecap="round"
            stroke-linejoin="round"
            aria-hidden="true"
          >
            <circle cx="12" cy="12" r="10" />
            <path d="M12 8v4" />
            <path d="M12 16h.01" />
          </svg>

          <p>{{ errorMessage }}</p>
        </div>

        <!-- EMPTY STATE -->
        <div v-else-if="jobs.length === 0" class="jobs-message empty-jobs">
          <div class="empty-jobs-icon">
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
              <rect x="3" y="7" width="18" height="14" rx="2" />
              <path d="M8 7V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
              <path d="M3 12h18" />
            </svg>
          </div>

          <h2>Belum Ada Lowongan</h2>
          <p>
            Saat ini belum ada lowongan pekerjaan yang tersedia. Silakan kunjungi halaman ini
            kembali nanti.
          </p>
        </div>

        <!-- JOB CARDS -->
        <div v-else class="job-list-grid">
          <article v-for="job in jobs" :key="job.id" class="job-card">
            <div class="job-card-content">
              <div class="job-info">
                <h2>{{ job.title }}</h2>

                <p class="job-department">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="1.7"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    aria-hidden="true"
                  >
                    <rect x="3" y="7" width="18" height="14" rx="2" />
                    <path d="M8 7V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                    <path d="M3 12h18" />
                  </svg>

                  <span>
                    {{ job.department || 'General Department' }}
                  </span>
                </p>

                <div class="job-meta">
                  <span v-if="job.job_type" class="employment-badge">
                    <span class="badge-dot"></span>
                    {{ job.job_type }}
                  </span>

                  <span v-if="job.location" class="job-location">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="14"
                      height="14"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="1.7"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      aria-hidden="true"
                    >
                      <path d="M20 10c0 5-8 12-8 12S4 15 4 10a8 8 0 1 1 16 0Z" />
                      <circle cx="12" cy="10" r="2.5" />
                    </svg>

                    {{ job.location }}
                  </span>
                </div>
              </div>

              <RouterLink :to="`/lowongan/${job.id}`" class="detail-link">
                <span>Lihat Detail</span>

                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="18"
                  height="18"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  aria-hidden="true"
                >
                  <path d="M5 12h14" />
                  <path d="m12 5 7 7-7 7" />
                </svg>
              </RouterLink>
            </div>
          </article>
        </div>
      </section>
    </main>

    <Footer />
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import Navbar from '../../components/Navbar.vue'
import Footer from '../../components/Footer.vue'
import { supabase } from '../../lib/supabase'

const jobs = ref([])
const isLoading = ref(true)
const errorMessage = ref('')

// ==========================================
// LOAD ACTIVE JOBS FROM SUPABASE
// ==========================================
async function loadJobs() {
  isLoading.value = true
  errorMessage.value = ''

  try {
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
      .eq('is_active', true)
      .order('created_at', { ascending: false })

    if (error) {
      throw new Error(error.message)
    }

    jobs.value = data || []
  } catch (error) {
    console.error('Failed to load jobs:', error)

    errorMessage.value = `Gagal memuat lowongan pekerjaan: ${error.message}`
  } finally {
    isLoading.value = false
  }
}

onMounted(() => {
  loadJobs()
})
</script>

<style scoped>
/* ==========================================
   PAGE LAYOUT
========================================== */
.jobs-page {
  width: 100%;
  min-width: 0;
  padding-bottom: 24px;
  background: #fff;
}

.jobs-intro {
  box-sizing: border-box;
  padding-top: 18px;
  padding-bottom: 24px;
}

.jobs-intro h1 {
  margin: 0 0 8px;
  color: var(--navy, #14243d);
  font-size: clamp(26px, 2.5vw, 32px);
  font-weight: 700;
  line-height: 1.3;
  letter-spacing: -0.5px;
}

.jobs-intro p {
  margin: 0;
  color: var(--text, #64748b);
  font-size: 14px;
  line-height: 1.7;
}

/* ==========================================
   JOB LIST CONTAINER
   No outer border or background box
========================================== */
.job-list {
  box-sizing: border-box;
  min-width: 0;
  padding-bottom: 48px;
  border: none;
  outline: none;
  box-shadow: none;
  background: transparent;
}

.job-list-grid {
  display: flex;
  flex-direction: column;
  gap: 14px;
  width: 100%;
  min-width: 0;
  border: none;
  outline: none;
  box-shadow: none;
  background: transparent;
}

/* ==========================================
   INDIVIDUAL JOB CARD
========================================== */
.job-card {
  position: relative;
  width: 100%;
  min-width: 0;
  box-sizing: border-box;
  border: 1px solid #e1e8ef;
  border-radius: 10px;
  background: #fff;
  box-shadow: 0 2px 8px rgba(20, 36, 61, 0.025);
  transition:
    border-color 0.2s ease,
    box-shadow 0.2s ease;
}

.job-card:hover {
  border-color: #c6e5d3;
  box-shadow: 0 5px 16px rgba(20, 36, 61, 0.055);
}

.job-card-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 24px;
  min-height: 140px;
  box-sizing: border-box;
  padding: 24px 28px;
}

.job-info {
  flex: 1;
  min-width: 0;
}

/* ==========================================
   JOB TITLE
========================================== */
.job-info h2 {
  margin: 0 0 10px;
  color: var(--navy, #14243d);
  font-size: 19px;
  font-weight: 700;
  line-height: 1.4;
  overflow-wrap: anywhere;
}

/* ==========================================
   DEPARTMENT
========================================== */
.job-department {
  display: flex;
  align-items: center;
  gap: 8px;
  margin: 0 0 12px;
  color: #64748b;
  font-size: 14px;
  line-height: 1.5;
}

.job-department svg {
  flex-shrink: 0;
  color: #8493a7;
}

/* ==========================================
   JOB TYPE AND LOCATION
========================================== */
.job-meta {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 10px;
}

.employment-badge {
  display: inline-flex;
  align-items: center;
  gap: 7px;
  min-height: 28px;
  box-sizing: border-box;
  padding: 5px 12px;
  border: 1px solid #d9f0e3;
  border-radius: 999px;
  background: #eaf7ef;
  color: #176b46;
  font-size: 12px;
  font-weight: 600;
  line-height: 1.3;
}

.badge-dot {
  width: 6px;
  height: 6px;
  flex-shrink: 0;
  border-radius: 50%;
  background: #16a765;
}

.job-location {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  color: #718096;
  font-size: 12px;
}

.job-location svg {
  flex-shrink: 0;
}

/* ==========================================
   VIEW DETAILS
========================================== */
.detail-link {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  flex-shrink: 0;
  padding: 10px 0 10px 16px;
  color: var(--green, #00a651);
  font-size: 13px;
  font-weight: 700;
  text-decoration: none;
  white-space: nowrap;
  transition: color 0.2s ease;
}

.detail-link:hover {
  color: #087d43;
}

.detail-link svg {
  flex-shrink: 0;
  transition: transform 0.2s ease;
}

.detail-link:hover svg {
  transform: translateX(3px);
}

/* ==========================================
   LOADING, ERROR AND EMPTY STATES
========================================== */
.jobs-message {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 12px;
  min-height: 180px;
  box-sizing: border-box;
  padding: 32px 24px;
  border: 1px solid #e1e8ef;
  border-radius: 10px;
  background: #fff;
  color: #64748b;
  font-size: 14px;
  line-height: 1.7;
  text-align: center;
}

.jobs-message p {
  max-width: 440px;
  margin: 0;
}

.jobs-error {
  border-color: #fecaca;
  background: #fffafa;
  color: #dc2626;
}

.loading-spinner {
  width: 28px;
  height: 28px;
  box-sizing: border-box;
  border: 3px solid #d9f2e4;
  border-top-color: #00a651;
  border-radius: 50%;
  animation: jobs-spin 0.8s linear infinite;
}

.empty-jobs-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 58px;
  height: 58px;
  border-radius: 16px;
  background: #eef8f2;
  color: #15965b;
}

.empty-jobs h2 {
  margin: 0;
  color: var(--navy, #14243d);
  font-size: 18px;
  font-weight: 700;
}

/* ==========================================
   ANIMATIONS
========================================== */
@keyframes jobs-spin {
  to {
    transform: rotate(360deg);
  }
}

/* ==========================================
   TABLET
========================================== */
@media (max-width: 768px) {
  .jobs-intro {
    padding-top: 16px;
    padding-bottom: 22px;
  }

  .jobs-intro h1 {
    font-size: 27px;
  }

  .job-list-grid {
    gap: 13px;
  }

  .job-card-content {
    min-height: 130px;
    gap: 18px;
    padding: 22px;
  }

  .job-info h2 {
    font-size: 18px;
  }

  .job-department {
    font-size: 13px;
  }
}

/* ==========================================
   MOBILE
========================================== */
@media (max-width: 520px) {
  .jobs-intro {
    padding-top: 12px;
    padding-bottom: 20px;
  }

  .jobs-intro h1 {
    font-size: 24px;
    letter-spacing: -0.3px;
  }

  .jobs-intro p {
    font-size: 12px;
  }

  .job-list-grid {
    gap: 12px;
  }

  .job-card-content {
    align-items: flex-start;
    gap: 12px;
    min-height: 125px;
    padding: 20px 16px;
  }

  .job-info h2 {
    font-size: 16px;
  }

  .job-department {
    gap: 6px;
    margin-bottom: 11px;
    font-size: 12px;
  }

  .employment-badge {
    min-height: 27px;
    padding: 5px 10px;
    font-size: 11px;
  }

  .detail-link {
    gap: 5px;
    min-height: 32px;
    padding: 4px 0 4px 4px;
    font-size: 11px;
  }

  .detail-link svg {
    width: 15px;
    height: 15px;
  }
}

/* ==========================================
   REDUCED MOTION
========================================== */
@media (prefers-reduced-motion: reduce) {
  .job-card,
  .detail-link,
  .detail-link svg,
  .loading-spinner {
    animation: none;
    transition: none;
  }
}
</style>
