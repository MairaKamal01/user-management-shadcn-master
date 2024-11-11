<script lang="ts" setup>
import { vAutoAnimate } from "@formkit/auto-animate/vue";
import { newPasswordSchema } from "~/components/auth/schemas";
import resetPassword from "~/middleware/resetPassword";
import type { ServerError } from "~/types";

definePageMeta({
  middleware: resetPassword,
});

const supabase = useSupabaseClient();
const route = useRoute();
const submitErrors = ref<ServerError | null>(null);
const submitSuccess = ref(false);
const invalidLinkError = ref<string | null>(null);

const formSchema = toTypedSchema(newPasswordSchema);

const { handleSubmit, isSubmitting } = useForm({
  validationSchema: formSchema,
});

onBeforeMount(() => {
  if (route.query.error) {
    invalidLinkError.value =
      "The link is invalid or expired and cannot be used to change the password. Please generate a new one.";
  }
});

const onSubmit = handleSubmit(async ({ password }) => {
  try {
    submitErrors.value = null;
    const redirectUrl = window.location.origin + "/auth/resetPassword";

    const { data, error } = await supabase.auth.updateUser({
      password: password,
    });

    supabase.auth.signOut();

    if (error) throw error;
    else submitSuccess.value = true;
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
  <div class="m-20 flex justify-end items-center">
    <Card class="w-3/12" v-auto-animate>
      <CardHeader v-if="!submitSuccess && !invalidLinkError">
        <CardTitle class="text-2xl">Create New Password</CardTitle>
        <CardDescription> Enter your new password. </CardDescription>
      </CardHeader>
      <CardHeader v-if="submitSuccess">
        <CardTitle class="text-2xl">Your Password Is Updated</CardTitle>
        <CardDescription>
          You can login with your new password.
          <NuxtLink to="/auth/login" class="text-primary font-semibold"
            >Login here.</NuxtLink
          >
        </CardDescription>
      </CardHeader>
      <CardHeader v-if="invalidLinkError">
        <CardTitle class="text-xl text-destructive">Invalid Link</CardTitle>
        <CardDescription>
          <div>
            <p class="text-destructive">
              {{ invalidLinkError }}
            </p>
          </div>
          <Separator class="mt-5 mb-1" />
          <div>
            <p>
              Forgot your password?
              <NuxtLink to="/auth/forgotPassword" class="text-primary"
                >Click here</NuxtLink
              >
              to get a password reset link.
            </p>
          </div>
        </CardDescription>
      </CardHeader>
      <CardContent v-if="!submitSuccess && !invalidLinkError">
        <form vi class="space-y-6" @submit="onSubmit">
          <div class="grid grid-cols-2 gap-4">
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

                  <FormMessage />
                </FormItem>
              </FormField>
            </div>
            <div class="col-span-2">
              <!-- Password -->
              <FormField
                v-slot="{ componentField }"
                name="confirmPassword"
                :validate-on-model-update="false"
              >
                <FormItem v-auto-animate>
                  <FormLabel>Confirm Password</FormLabel>
                  <FormControl>
                    <Input
                      type="password"
                      placeholder=""
                      v-bind="componentField"
                      :disabled="isSubmitting"
                    />
                  </FormControl>

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
                {{ isSubmitting ? "Updating Password..." : "Update Password" }}
              </Button>
            </div>
          </div>
        </form>
      </CardContent>
    </Card>
  </div>
</template>

<style></style>
