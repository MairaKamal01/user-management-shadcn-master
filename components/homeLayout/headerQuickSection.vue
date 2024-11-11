<script lang="ts" setup>
import { vAutoAnimate } from "@formkit/auto-animate/vue";
</script>

<template>
  <div class="hidden md:flex items-center" v-auto-animate>
    <ClientOnly>
      <HomeLayoutDarkModeToggle />
      <HomeLayoutGithubLinkBtn />
    </ClientOnly>
  </div>
</template>

<style></style>
