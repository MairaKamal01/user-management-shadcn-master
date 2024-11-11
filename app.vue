<script lang="ts" setup></script>

<template>
  <div>
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
  </div>
</template>

<style>
:root #__nuxt {
  height: 100vh;
  margin: 0;
  padding: 0;
  overflow-x: hidden; /* Prevent horizontal overflow */
  font-size: 90%; /*Decrease base font size */
}

#__nuxt {
  height: 100%;
  margin: 0;
  padding: 0;
  overflow-x: hidden;
}

html,
body {
  height: 100vh;
  margin: 0;
  padding: 0;
  overflow-x: hidden; /* Prevent horizontal overflow */
}

.page-enter-active,
.page-leave-active {
  transition: all 0.4s;
}
.page-enter-from,
.page-leave-to {
  opacity: 0;
  filter: blur(1rem);
}
</style>
