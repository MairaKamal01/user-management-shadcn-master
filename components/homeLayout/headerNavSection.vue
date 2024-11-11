<template>
  <div class="flex-grow hidden md:flex justify-end">
    <NavigationMenu>
      <NavigationMenuList>
        <NavigationMenuItem>
          <NavigationMenuLink href="/" :class="navigationMenuTriggerStyle()">
            Home
          </NavigationMenuLink>
        </NavigationMenuItem>
        <NavigationMenuItem>
          <NavigationMenuLink
            href="#Pipeline-section"
            :class="navigationMenuTriggerStyle()"
          >
            About
          </NavigationMenuLink>
        </NavigationMenuItem>
      </NavigationMenuList>
    </NavigationMenu>
  </div>
</template>

<script lang="ts" setup>
import { navigationMenuTriggerStyle } from "@/components/ui/navigation-menu";
</script>

<style></style>
