<template>
  <div>
    <header
      class="px-3 md:px-20 py-2 gap-2 h-16 w-full flex flex-row items-center border-b"
    >
      <HomeLayoutHeaderIcon />
      <HomeLayoutHeaderNavSection />
      <Separator orientation="vertical" class="hidden md:block" />
      <HomeLayoutHeaderQuickSection />
      <Separator orientation="vertical" class="hidden md:block" />
      <HomeLayoutHeaderAuthSection />
      <!-- <HomeLayoutMenuSheet /> -->
    </header>
  </div>
</template>

<script lang="ts" setup>
import { Separator } from "@/components/ui/separator";
</script>

<style></style>
