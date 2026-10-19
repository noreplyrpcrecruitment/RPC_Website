<template>
  <div class="page">
    <Navbar />

    <!-- LOADING -->
    <main v-if="isLoading" class="site-container not-found">
      <p>Memuat detail lowongan...</p>
    </main>

    <!-- JOB DETAIL -->
    <main v-else-if="job">
      <!-- JOB HEADER -->
      <section class="detail-hero">
        <div class="site-container">
          <h1>{{ job.title }}</h1>

          <p class="detail-department">
            {{ job.department || 'General Department' }}
          </p>

          <router-link to="/lowongan" class="back-link"> ← Kembali ke Lowongan </router-link>
        </div>
      </section>

      <!-- JOB CONTENT -->
      <section class="detail-content site-container">
        <!-- LEFT -->
        <div class="detail-main">
          <section>
            <h2>Deskripsi Pekerjaan</h2>

            <p>
              {{ job.description || 'Belum ada deskripsi pekerjaan.' }}
            </p>
          </section>

          <section>
            <h2>Tanggung Jawab</h2>

            <ul v-if="job.responsibilities.length" class="green-list">
              <li v-for="(item, index) in job.responsibilities" :key="`responsibility-${index}`">
                {{ item }}
              </li>
            </ul>

            <p v-else>Belum ada informasi tanggung jawab.</p>
          </section>

          <section>
            <h2>Persyaratan</h2>

            <ul v-if="job.requirements.length" class="green-list">
              <li v-for="(item, index) in job.requirements" :key="`requirement-${index}`">
                {{ item }}
              </li>
            </ul>

            <p v-else>Belum ada informasi persyaratan.</p>
          </section>
        </div>

        <!-- RIGHT -->
        <aside class="job-info-card">
          <h2>Informasi Lowongan</h2>

          <div class="info-row">
            <span>Departemen</span>
            <strong>{{ job.department || '—' }}</strong>
          </div>

          <div class="info-row">
            <span>Tipe Pekerjaan</span>
            <strong>{{ job.job_type || '—' }}</strong>
          </div>

          <button type="button" class="btn btn-primary btn-full" @click="applyForJob">
            Lamar Sekarang →
          </button>
        </aside>
      </section>
    </main>

    <!-- ERROR / NOT FOUND -->
    <main v-else class="site-container not-found">
      <h1>Lowongan Tidak Ditemukan</h1>

      <p>Lowongan yang Anda cari tidak tersedia atau sudah tidak aktif.</p>

      <router-link to="/lowongan" class="btn btn-primary"> Kembali ke Lowongan </router-link>
    </main>

    <Footer />
  </div>
</template>

<script>
import Navbar from '../../components/Navbar.vue'
import Footer from '../../components/Footer.vue'
import { supabase } from '../../lib/supabase'

export default {
  name: 'JobDetail',

  components: {
    Navbar,
    Footer,
  },

  data() {
    return {
      job: null,
      isLoading: true,
    }
  },

  mounted() {
    this.loadJob()
  },

  watch: {
    '$route.params.id'() {
      this.loadJob()
    },
  },

  methods: {
    // Convert database text or arrays into a list of items.
    formatList(value) {
      if (Array.isArray(value)) {
        return value.map((item) => String(item).trim()).filter(Boolean)
      }

      if (typeof value !== 'string' || !value.trim()) {
        return []
      }

      return value
        .split(/\r?\n/)
        .map((item) => item.replace(/^[\s•\-*]+/, '').trim())
        .filter(Boolean)
    },

    // LOAD JOB FROM SUPABASE
    async loadJob() {
      const jobId = this.$route.params.id

      this.isLoading = true
      this.job = null

      try {
        if (!jobId) {
          return
        }

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
          .eq('id', jobId)
          .eq('is_active', true)
          .maybeSingle()

        if (error) {
          throw error
        }

        if (!data) {
          this.job = null
          return
        }

        this.job = {
          ...data,
          responsibilities: this.formatList(data.responsibilities),
          requirements: this.formatList(data.requirements),
        }

        console.log('Job loaded from Supabase:', this.job)
      } catch (error) {
        console.error('Failed to load job detail:', error)
        this.job = null
      } finally {
        this.isLoading = false
      }
    },

    // APPLY FOR JOB
    applyForJob() {
      if (!this.job || !this.job.is_active) {
        return
      }

      // Keep the selected job for the application form.
      localStorage.setItem('selectedJob', JSON.stringify(this.job))

      this.$router.push({
        name: 'application',
        params: {
          id: this.job.id,
        },
      })
    },
  },
}
</script>
