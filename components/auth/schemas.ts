import { z } from "zod";

export const signupFormSchema = z
  .object({
    firstname: z
      .string()
      .min(3, { message: "First name should be at least 2 characters" })
      .max(50, { message: "First name cannot exceed 50 characters" }),

    lastname: z
      .string()
      .min(1, { message: "Last name is required" })
      .max(50, { message: "Last name cannot exceed 50 characters" }),

    email: z.string().email({ message: "Invalid email address" }),

    password: z
      .string()
      .min(8, { message: "Password must be at least 8 characters long" })
      .max(100, { message: "Password cannot exceed 100 characters" }),
    // //Uncomment these to add specific rules for password complexity
    // .regex(/[A-Z]/, { message: "Password must contain at least one uppercase letter" })
    // .regex(/[a-z]/, { message: "Password must contain at least one lowercase letter" })
    // .regex(/\d/, { message: "Password must contain at least one number" })
    // .regex(/[\W_]/, { message: "Password must contain at least one special character" }),

    confirmPassword: z.string().default("farooka12"),

    tnc: z.boolean().refine((val) => val === true, {
      message: "You must accept the terms and conditions",
    }),
  })
  .refine((data) => data.password === data.confirmPassword, {
    path: ["confirmPassword"],
    message: "Passwords don't match",
  });

export const logInFormSchema = z.object({
  email: z.string().email({ message: "Invalid email address" }),

  password: z.string().min(1, { message: "Last name is required" }),
});

export const resetPassFormSchema = z.object({
  email: z.string().email({ message: "Invalid email address" }),
});

export const newPasswordSchema = z
  .object({
    password: z
      .string()
      .min(8, { message: "Password must be at least 8 characters long" })
      .max(100, { message: "Password cannot exceed 100 characters" }),

    confirmPassword: z.string(),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: "Passwords do not match",
    path: ["confirmPassword"],
  });
