<script setup lang="ts">
import type { currentUserType } from "~/types";

const currentUser = useState<currentUserType | null>("currentUser");

onServerPrefetch(() => {
  if (currentUser.value) {
    // If the user is logged in, redirect to the home page
    navigateTo("/");
  }
});
</script>

<template>
  <div class="m-20 flex flex-row justify-center items-center">
    <div class="w-1/2"></div>
    <div class="w-1/2 flex-grow flex flex-row justify-end">
      <AuthLoginForm />
    </div>
  </div>
</template>
