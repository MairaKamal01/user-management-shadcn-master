<script lang="ts" setup>
definePageMeta({
  middleware: "auth",
  requiresAuth: true,
  requiresAdmin: true,
});
</script>

<template>
  <div>
    <h1 class="font-xl font-bold">About Page</h1>
  </div>
</template>

<style></style>
