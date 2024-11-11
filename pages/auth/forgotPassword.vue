<script lang="ts" setup>
import { resetPassFormSchema } from "~/components/auth/schemas";
import type { ServerError } from "~/types";
import { vAutoAnimate } from "@formkit/auto-animate/vue";

const supabase = useSupabaseClient();

const submitErrors = ref<ServerError | null>(null);
const submitSuccess = ref(false);

const formSchema = toTypedSchema(resetPassFormSchema);

const { handleSubmit, isSubmitting } = useForm({
  validationSchema: formSchema,
});

const onSubmit = handleSubmit(async ({ email }) => {
  try {
    submitErrors.value = null;
    const redirectUrl = window.location.origin + "/auth/resetPassword";

    // const { data, error } =  supabase.auth.resetPasswordForEmail(email, {
    //   redirectTo: redirectUrl,
    // });

    // if (error) throw error;
    // else submitSuccess.value = true;

    supabase.auth.resetPasswordForEmail(email, {
      redirectTo: redirectUrl,
    });
    submitSuccess.value = true;
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
      <CardHeader v-if="!submitSuccess">
        <CardTitle class="text-2xl">Forgot Your Password?</CardTitle>
        <CardDescription>
          Enter your email to revie a password reset link.
        </CardDescription>
      </CardHeader>
      <CardHeader v-if="submitSuccess">
        <CardTitle class="text-2xl">Reset Password Link Sent</CardTitle>
        <CardDescription>
          A password reset link is sent to your email. Please click on the link
          to reset your password.
        </CardDescription>
      </CardHeader>
      <CardContent v-if="!submitSuccess">
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
                {{
                  isSubmitting ? "Sending Link..." : "Send Reset Password Link"
                }}
              </Button>
            </div>
          </div>
        </form>
      </CardContent>
    </Card>
  </div>
</template>

<style></style>
