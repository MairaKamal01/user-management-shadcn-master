<script setup lang="ts">
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
</script>

<template>
  <div class="m-20 flex flex-row justify-center items-center">
    <div class="hidden md:block md:w-1/2"></div>
    <div class="w-1/2 flex-grow flex flex-row justify-center md:justify-end">
      <AuthSignUpForm />
    </div>
  </div>
</template>
