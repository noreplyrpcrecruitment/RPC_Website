<template>
  <article class="job-list-item">
    <div>
      <h2>{{ job.title }}</h2>
      <p>{{ job.department }}</p>
    </div>
    <router-link :to="`/lowongan/${job.id}`" class="detail-link">
      Lihat Detail <span>→</span>
    </router-link>
  </article>
</template>

<script setup>
defineProps({
  job: { type: Object, required: true },
})
</script>
