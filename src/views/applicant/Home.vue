<template>
  <div class="page">
    <Navbar />

    <main>
      <section class="hero site-container">
        <!-- HERO TEXT -->
        <div class="hero-copy">
          <p class="eyebrow">SELAMAT DATANG DI RPC RECRUITMENT</p>

          <h1>
            Bangun Masa Depan<br />
            di Kariermu di RPC
          </h1>

          <div class="green-rule"></div>

          <p class="hero-description">
            Temukan peluang terbaik untuk mengembangkan potensi diri Anda bersama salah satu
            perusahaan energi dan infrastruktur terdepan. Melalui program akselerasi karier dan
            bimbingan antar berpengalaman, kami berkomitmen mencetak talenta unggul yang siap
            menghadapi tantangan masa depan.
          </p>

          <!-- MAIN CTA -->
          <div class="hero-actions">
            <router-link to="/lowongan" class="btn btn-primary"> Jelajahi Lowongan → </router-link>
          </div>
        </div>

        <!-- HERO IMAGE -->
        <div class="hero-media">
          <img src="/assets/rpc-hero.jpg" alt="RPC workplace" />
        </div>
      </section>
    </main>

    <Footer />
  </div>
</template>

<script setup>
import Navbar from '../../components/Navbar.vue'
import Footer from '../../components/Footer.vue'
</script>
