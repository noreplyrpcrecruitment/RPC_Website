<template>
  <div class="admin-login-page">
    <div class="admin-login-content">
      <h1>Admin Login</h1>

      <form class="admin-login-card" @submit.prevent="login">
        <!-- EMAIL -->
        <div class="admin-form-group">
          <label for="admin-email">Email</label>

          <div class="admin-input-wrapper">
            <span class="admin-input-icon">♙</span>

            <input
              id="admin-email"
              v-model.trim="email"
              type="email"
              placeholder="Masukkan email admin"
              autocomplete="username"
              required
            />
          </div>
        </div>

        <!-- PASSWORD -->
        <div class="admin-form-group">
          <label for="admin-password">Password</label>

          <div class="admin-input-wrapper">
            <span class="admin-input-icon">♧</span>

            <input
              id="admin-password"
              v-model="password"
              :type="showPassword ? 'text' : 'password'"
              placeholder="Masukkan password"
              autocomplete="current-password"
              required
            />

            <button
              type="button"
              class="admin-password-toggle"
              :aria-label="showPassword ? 'Hide password' : 'Show password'"
              @click="showPassword = !showPassword"
            >
              {{ showPassword ? '◉' : '◌' }}
            </button>
          </div>
        </div>

        <!-- ERROR -->
        <p v-if="errorMessage" class="admin-login-error" role="alert">
          {{ errorMessage }}
        </p>

        <!-- LOGIN -->
        <button type="submit" class="admin-login-button" :disabled="isLoading">
          {{ isLoading ? 'Logging in...' : 'Login' }}
        </button>

        <!-- BACK -->
        <router-link to="/" class="admin-back-home"> ← &nbsp; Kembali ke Beranda </router-link>
      </form>
    </div>

    <footer class="admin-login-footer">
      © 2026 RPC Recruitment. Seluruh hak cipta dilindungi undang-undang.
    </footer>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { supabase } from '../../lib/supabase'

const router = useRouter()
const route = useRoute()

const email = ref('')
const password = ref('')
const showPassword = ref(false)
const errorMessage = ref('')
const isLoading = ref(false)

async function login() {
  if (isLoading.value) return

  errorMessage.value = ''

  if (!email.value || !password.value) {
    errorMessage.value = 'Email dan password wajib diisi.'
    return
  }

  isLoading.value = true

  try {
    const { error } = await supabase.auth.signInWithPassword({
      email: email.value,
      password: password.value,
    })

    if (error) {
      throw error
    }

    const requestedPath = route.query.redirect
    const destination =
      typeof requestedPath === 'string' &&
      requestedPath.startsWith('/admin/') &&
      requestedPath !== '/admin/login'
        ? requestedPath
        : '/admin/open-positions'

    await router.replace(destination)
  } catch (error) {
    console.error('Admin login failed:', error)
    errorMessage.value = 'Login gagal. Periksa email dan password akun admin kamu.'
  } finally {
    isLoading.value = false
  }
}
</script>
