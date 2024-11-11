<script lang="ts" setup>
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import type { ServerError } from "~/types";
import { logInFormSchema } from "./schemas";
import { vAutoAnimate } from "@formkit/auto-animate/vue";
import { convertToObject } from "typescript";

const route = useRoute();

const supabase = useSupabaseClient();

const submitErrors = ref<ServerError | null>(null);
const submitSuccess = ref(false);

// SIGNUP FORM
const formSchema = toTypedSchema(logInFormSchema);

const { handleSubmit, isSubmitting } = useForm({
  validationSchema: formSchema,
});

const handleGuestLogin = async () => {
  try {
    const { data, error } = await supabase.auth.signInAnonymously();
    if (error) throw error;
    console.log("Anonymous user logged in:", data.user);
    
    // Redirect after successful login, e.g., to homepage
    await navigateTo("/");
  } catch (error: any) {
    submitErrors.value = {
      message: error.message,
      code: error.code,
      status: error.status?.toString(),
    };
    console.error("Error during anonymous login:", error.message);
  }
};

const onSubmit = handleSubmit(async ({ email, password }) => {
  try {
    submitErrors.value = null;

    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });
    if (error) throw error;
    else {
      if (typeof route.query.redirect === "string")
        await navigateTo(route.query.redirect);
      else if (
        Array.isArray(route.query.redirect) &&
        route.query.redirect.length > 0
      )
        await navigateTo(route.query.redirect[0]);
      else await navigateTo("/");
    }
  } catch (error: any) {
    submitErrors.value = {
      message: error.message,
      code: error.code,
      status: error.status?.toString(),
    };

    console.error(error.message, error.code, error.status);
  }
});
</script>

<template>
  <Card class="w-7/12">
    <CardHeader>
      <CardTitle class="text-2xl"> Login </CardTitle>
      <CardDescription>
        Enter your email below to login to your account
      </CardDescription>
    </CardHeader>
    <CardContent>
      <form vi class="space-y-6" @submit="onSubmit">
        <div class="grid grid-cols-2 gap-4">
          <div class="col-span-2">
            <!-- Email -->
            <FormField
              v-slot="{ componentField }"
              name="email"
              :validate-on-model-update="false"
            >
              <FormItem v-auto-animate>
                <FormLabel>Email</FormLabel>
                <FormControl>
                  <Input
                    type="text"
                    placeholder=""
                    v-bind="componentField"
                    :disabled="isSubmitting"
                  />
                </FormControl>

                <FormMessage />
              </FormItem>
            </FormField>
          </div>

          <div class="col-span-2">
            <!-- Password -->
            <FormField
              v-slot="{ componentField }"
              name="password"
              :validate-on-model-update="false"
            >
              <FormItem v-auto-animate>
                <FormLabel>Password</FormLabel>
                <FormControl>
                  <Input
                    type="password"
                    placeholder=""
                    v-bind="componentField"
                    :disabled="isSubmitting"
                  />
                </FormControl>
                <FormDescription as-child>
                  <NuxtLink
                    to="/auth/forgotPassword"
                    class="block text-right text-primary font-semibold"
                    >Forgot Password?</NuxtLink
                  >
                </FormDescription>
                <FormMessage />
              </FormItem>
            </FormField>
          </div>

          <div class="col-span-2 space-y-3" v-auto-animate>
            <Alert
              v-if="submitErrors"
              variant="destructive"
              class="flex flex-col gap-2"
            >
              <div class="flex gap-1 items-end">
                <Icon name="majesticons:exclamation-line" class="h-6 w-6" />
                <AlertTitle>Server Error</AlertTitle>
              </div>
              <AlertDescription class="pl-7">
                {{ submitErrors?.message }}
              </AlertDescription>
            </Alert>
            <Button class="w-full" type="submit" :disabled="isSubmitting">
              <Icon
                v-if="isSubmitting"
                name="svg-spinners:ring-resize"
                class="mr-1 h-5 w-5"
              />
              {{ isSubmitting ? "Logging In" : "Login" }}
            </Button>
          </div>
        </div>
      </form>
      <Button variant="outline" class="w-full mt-4"> Login with Google </Button>
      <Button variant="outline" class="w-full mt-4" @click="handleGuestLogin"> Login as a Guest </Button>
      <div class="mt-4 text-center text-sm">
        Don't have an account?
        <RouterLink to="/auth/signUp" class="underline"> Sign up </RouterLink>
      </div>
    </CardContent>
  </Card>
</template>

<style></style>
