<script setup lang="ts">
import { useForm } from "vee-validate";
import { toTypedSchema } from "@vee-validate/zod";
import { vAutoAnimate } from "@formkit/auto-animate/vue";
import { Button } from "@/components/ui/button";
import {
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { signupFormSchema } from "./schemas";
import type { ServerError } from "~/types";
import { useToast } from "../ui/toast";

const supabase = useSupabaseClient();
const { toast } = useToast();

const submitErrors = ref<ServerError | null>(null);
const submitSuccess = ref(false);

// SIGNUP FORM
const formSchema = toTypedSchema(signupFormSchema);

const { handleSubmit, isSubmitting, values } = useForm({
  validationSchema: formSchema,
});

const onSubmit = handleSubmit(async (values) => {
  try {
    submitErrors.value = null;

    const { error } = await supabase.auth.signUp({
      email: values.email,
      password: values.password,
      options: {
        data: {
          firstName: values.firstname,
          lastName: values.lastname,
        },
      },
    });

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
  <Card class="w-10/12 md:w-8/12 shadow-lg" v-auto-animate>
    <CardHeader v-if="!submitSuccess">
      <CardTitle class="text-xl"> Sign Up </CardTitle>
      <CardDescription>
        Enter your information to create an account
      </CardDescription>
    </CardHeader>
    <CardHeader v-else="!submitSuccess">
      <CardTitle class="text-xl">You are all signed up!</CardTitle>
      <CardDescription>
        <div>
          <p>
            Please check your email for the confirmation message we just sent
            you.
          </p>
          <NuxtLink to="/auth/login" class="text-primary font-semibold"
            >Sign in here.</NuxtLink
          >
        </div>

        <Separator class="mt-5 mb-1" />
        <div>
          <p>
            Didn't recieve confirmation email?
            <NuxtLink to="/auth/login" class="text-primary"
              >Resend confirmation email.</NuxtLink
            >
          </p>
        </div>
      </CardDescription>
    </CardHeader>
    <CardContent v-if="!submitSuccess">
      <form vi class="space-y-6" @submit="onSubmit">
        <div class="grid grid-cols-2 gap-4">
          <div class="">
            <!-- First Name -->
            <FormField
              v-slot="{ componentField }"
              name="firstname"
              :validate-on-model-update="false"
            >
              <FormItem v-auto-animate>
                <FormLabel>First name</FormLabel>
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

          <div class="">
            <!-- Last Name -->
            <FormField
              v-slot="{ componentField }"
              name="lastname"
              :validate-on-model-update="false"
            >
              <FormItem v-auto-animate>
                <FormLabel>Last name</FormLabel>
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
                <FormMessage />
              </FormItem>
            </FormField>
          </div>
          <div class="col-span-2">
            <!--Confirm Password -->
            <FormField
              type="checkbox"
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
          <div class="col-span-2">
            <!--Terms and conditions -->
            <FormField
              v-slot="{ value, handleChange }"
              type="checkbox"
              name="tnc"
            >
              <FormItem v-auto-animate>
                <div class="flex flex-row items-start space-x-3 space-y-0">
                  <FormControl>
                    <Checkbox
                      :checked="value"
                      @update:checked="handleChange"
                      :disabled="isSubmitting"
                    />
                  </FormControl>
                  <FormLabel class="font-normal"
                    >I have read
                    <RouterLink to="/" class="text-primary font-bold"
                      >Terms and Conditions</RouterLink
                    >
                    and agree.</FormLabel
                  >
                </div>
                <FormMessage class="ml-7" />
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
              {{ isSubmitting ? "Signing Up" : "Sign Up" }}
            </Button>
          </div>
        </div>
      </form>
    </CardContent>
  </Card>
</template>
