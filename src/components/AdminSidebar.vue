<template>
  <aside class="admin-sidebar">
    <!-- LOGO -->
    <div class="admin-sidebar-brand">
      <img src="/assets/rpc-logo.png" alt="RPC Recruitment" />

      <div>
        <strong>RPC</strong>
        <span>RECRUITMENT</span>
      </div>
    </div>

    <!-- NAVIGATION -->
    <nav class="admin-sidebar-nav">
      <router-link
        to="/admin/open-positions"
        class="admin-nav-item"
        :class="{
          active: route.name === 'admin-open-positions',
        }"
      >
        <span class="admin-nav-icon">▣</span>
        <span>Open Positions</span>
      </router-link>

      <router-link
        to="/admin/applicants"
        class="admin-nav-item"
        :class="{
          active: route.name === 'admin-applicants' || route.name === 'admin-applicant-detail',
        }"
      >
        <span class="admin-nav-icon">♧</span>
        <span>Applicants</span>
      </router-link>
    </nav>

    <!-- LOGOUT -->
    <button type="button" class="admin-logout" :disabled="isLoggingOut" @click="logout">
      <span>↪</span>
      {{ isLoggingOut ? 'Logging out...' : 'Logout' }}
    </button>
  </aside>
</template>

<script setup>
import { ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { supabase } from '../lib/supabase'

const route = useRoute()
const router = useRouter()

const isLoggingOut = ref(false)

async function logout() {
  if (isLoggingOut.value) return

  isLoggingOut.value = true

  try {
    // Actually sign out from Supabase Auth on this browser.
    const { error } = await supabase.auth.signOut({
      scope: 'local',
    })

    if (error) {
      throw error
    }

    // Replace the current history entry so Back cannot bypass
    // the router guard after logout.
    await router.replace('/admin/login')
  } catch (error) {
    console.error('Logout failed:', error)

    window.alert(`Logout failed: ${error.message || 'Please try again.'}`)
  } finally {
    isLoggingOut.value = false
  }
}
</script>
