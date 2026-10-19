<template>
  <header class="site-header">
    <!-- TOP NAVIGATION -->
    <div class="topbar">
      <div class="site-container nav-inner">
        <!-- LOGO -->
        <router-link to="/" class="brand" aria-label="RPC Recruitment">
          <img src="/assets/rpc-logo.png" alt="RPC" />
        </router-link>

        <!-- NAVIGATION -->
        <nav class="main-nav">
          <!-- HOME -->
          <router-link
            to="/"
            :class="{
              active: route.name === 'home',
            }"
          >
            Beranda
          </router-link>

          <!-- OPEN POSITIONS -->
          <router-link
            to="/lowongan"
            :class="{
              active: ['lowongan', 'job-detail', 'application'].includes(route.name),
            }"
          >
            Lowongan
          </router-link>

          <!-- CONTACT -->
          <a href="#contact"> Kontak </a>
        </nav>
      </div>
    </div>

    <!-- RECRUITMENT BAR -->
    <div class="subbar">
      <div class="site-container">RPC RECRUITMENT</div>
    </div>
  </header>
</template>

<script setup>
import { useRoute } from 'vue-router'

const route = useRoute()
</script>
