<template>
  <HomeLayoutHeader2 />
  <slot />
</template>

<script lang="ts" setup>
const colorMode = useColorMode();
import { vAutoAnimate } from "@formkit/auto-animate/vue";
</script>

<style></style>
