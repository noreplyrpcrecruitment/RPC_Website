<template>
  <div class="page">
    <Navbar />

    <main class="thank-you">
      <section class="thank-you-content site-container">
        <h1>Thank You!</h1>
        <h2>Your application has been submitted successfully.</h2>
        <p>
          Thank you for your interest in joining RPC. We will review your application and contact
          you if your application is selected for the next stage.
        </p>
        <router-link to="/" class="btn btn-primary">← Back to Home</router-link>
      </section>
    </main>

    <Footer />
  </div>
</template>

<script setup>
import Navbar from '../../components/Navbar.vue'
import Footer from '../../components/Footer.vue'
</script>
