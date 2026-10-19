<template>
  <div class="admin-layout">
    <AdminSidebar />

    <div class="admin-main">
      <AdminTopbar />

      <main class="admin-content">
        <section class="admin-card">
          <!-- HEADER -->
          <div class="admin-card-header">
            <div>
              <h1>Open Positions</h1>
              <p>Manage job openings displayed on the career portal.</p>
            </div>

            <router-link to="/admin/open-positions/add" class="admin-primary-button">
              + &nbsp; Add Position
            </router-link>
          </div>

          <!-- LOADING -->
          <div v-if="isLoading" class="admin-table-message">Loading positions...</div>

          <!-- ERROR -->
          <div v-else-if="errorMessage" class="admin-table-message admin-table-error">
            {{ errorMessage }}

            <button type="button" class="admin-retry-button" @click="loadPositions">
              Try Again
            </button>
          </div>

          <!-- EMPTY -->
          <div v-else-if="positions.length === 0" class="admin-table-message">
            No open positions found.
          </div>

          <!-- TABLE -->
          <div v-else class="admin-table-wrapper">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>No.</th>
                  <th>Position Title</th>
                  <th>Department</th>
                  <th>Posted Date</th>
                  <th>Actions</th>
                </tr>
              </thead>

              <tbody>
                <tr v-for="(position, index) in positions" :key="position.id">
                  <td>{{ index + 1 }}</td>

                  <td class="admin-position-name">
                    {{ position.title }}
                  </td>

                  <td>{{ position.department || '—' }}</td>

                  <td>{{ formatDate(position.postedDate) }}</td>

                  <td>
                    <div class="admin-actions">
                      <!-- EDIT -->
                      <button
                        type="button"
                        class="admin-action-button edit"
                        title="Edit position"
                        aria-label="Edit position"
                        :disabled="isRemoving !== null"
                        @click="editPosition(position.id)"
                      >
                        ✎
                      </button>

                      <!-- PERMANENT DELETE -->
                      <button
                        type="button"
                        class="admin-action-button delete"
                        title="Permanently delete position"
                        aria-label="Delete position"
                        :disabled="isRemoving !== null"
                        @click="removePosition(position)"
                      >
                        {{ isRemoving === position.id ? '...' : '♙' }}
                      </button>
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
import { onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'

import AdminSidebar from '../../components/AdminSidebar.vue'
import AdminTopbar from '../../components/AdminTopbar.vue'
import { supabase } from '../../lib/supabase'

// ==========================================
// ROUTER
// ==========================================

const router = useRouter()

// ==========================================
// STATE
// ==========================================

const positions = ref([])
const isLoading = ref(true)
const errorMessage = ref('')
const isRemoving = ref(null)

// ==========================================
// LOAD ACTIVE POSITIONS
// ==========================================

async function loadPositions() {
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
        job_type,
        posted_date,
        created_at,
        is_active
      `,
      )
      .eq('is_active', true)
      .order('id', { ascending: true })

    if (error) {
      throw new Error(error.message)
    }

    positions.value = (data || []).map((job) => ({
      id: job.id,
      title: job.title,
      department: job.department,
      jobType: job.job_type,
      postedDate: job.posted_date || job.created_at,
    }))
  } catch (error) {
    console.error('Failed to load positions:', error)

    errorMessage.value = `Failed to load positions: ${error.message}`
  } finally {
    isLoading.value = false
  }
}

// ==========================================
// EDIT POSITION
// ==========================================

function editPosition(id) {
  router.push({
    name: 'admin-edit-position',
    params: { id },
  })
}

// ==========================================
// PERMANENTLY DELETE POSITION
// ==========================================

async function removePosition(position) {
  if (isRemoving.value !== null) {
    return
  }

  const confirmed = window.confirm(
    `Are you sure you want to permanently delete "${position.title}"? ` +
      'This action cannot be undone.',
  )

  if (!confirmed) {
    return
  }

  isRemoving.value = position.id
  errorMessage.value = ''

  try {
    // Permanently delete the row from Supabase.
    const { data, error } = await supabase.from('jobs').delete().eq('id', position.id).select('id')

    if (error) {
      throw new Error(error.message)
    }

    // Verify that a row was actually deleted.
    if (!data || data.length === 0) {
      throw new Error(
        'No job was deleted. Check the DELETE policy, ' + 'permissions, and job ID in Supabase.',
      )
    }

    // Refresh the list after successful deletion.
    await loadPositions()

    if (errorMessage.value) {
      window.alert(
        'The job was deleted, but the list could not be refreshed. ' + errorMessage.value,
      )
      return
    }

    window.alert(`"${position.title}" has been permanently deleted.`)
  } catch (error) {
    console.error('Failed to delete position:', error)

    errorMessage.value = `Failed to delete position: ${error.message}`
  } finally {
    isRemoving.value = null
  }
}

// ==========================================
// FORMAT DATE
// ==========================================

function formatDate(dateValue) {
  if (!dateValue) {
    return '—'
  }

  const date = new Date(dateValue)

  if (Number.isNaN(date.getTime())) {
    return '—'
  }

  return date.toLocaleDateString('en-GB', {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
  })
}

// ==========================================
// INITIAL LOAD
// ==========================================

onMounted(() => {
  loadPositions()
})
</script>

<style scoped>
.admin-table-message {
  padding: 35px 20px;
  text-align: center;
  color: #718096;
  font-size: 14px;
}

.admin-table-error {
  color: #c0392b;
}

.admin-retry-button {
  display: block;
  margin: 15px auto 0;
  padding: 8px 16px;
  border: 1px solid #c0392b;
  border-radius: 6px;
  background: #fff;
  color: #c0392b;
  cursor: pointer;
}

.admin-retry-button:hover {
  background: #fff5f5;
}

.admin-action-button {
  border: 0;
  cursor: pointer;
}

.admin-action-button:disabled {
  opacity: 0.45;
  cursor: not-allowed;
}
</style>
