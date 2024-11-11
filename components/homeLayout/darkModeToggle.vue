<template>
  <Button
    variant="ghost"
    @click="toggleTheme"
    class="transition-all duration-300"
  >
    <Icon
      v-if="isMounted && colorMode.value === 'dark'"
      name="mdi:weather-sunny"
      class="w-4 h-4"
    />
    <Icon
      v-else-if="isMounted"
      name="mdi:weather-night"
      class="w-4 h-4 text-gray-500"
    />
  </Button>
</template>

<script setup>
import { ref, onMounted } from "vue";

const colorMode = useColorMode();
const isMounted = ref(false);

const toggleTheme = () => {
  colorMode.preference = colorMode.preference === "dark" ? "light" : "dark";
};

onMounted(() => {
  isMounted.value = true;
});
</script>
