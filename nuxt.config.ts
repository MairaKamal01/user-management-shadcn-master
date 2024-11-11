// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2024-04-03",
  devtools: { enabled: true },

  sourcemap: {
    server: true,
    client: true,
  },

  app: {
    pageTransition: { name: "page", mode: "out-in" },
  },
  
  modules: [
    "@nuxtjs/tailwindcss",
    "shadcn-nuxt",
    "@nuxtjs/color-mode",
    "@nuxt/icon",
    "@nuxtjs/supabase",
    "@vee-validate/nuxt",
  ],
  supabase: {
    redirect: false,
    redirectOptions: {
      login: "/auth/login",
      callback: "/",
      //exclude: ["/", "/about", "/auth/*"],
      //include: ["/admin/(/*)"],
    },
  },
  veeValidate: {
    autoImports: true,
  },
  plugins: ["~/plugins/auth.ts"],
  colorMode: {
    preference: "system", // default value of $colorMode.preference
    fallback: "light", // fallback value if not system preference found
    hid: "nuxt-color-mode-script",
    globalName: "__NUXT_COLOR_MODE__",
    componentName: "ColorScheme",
    classPrefix: "",
    classSuffix: "",
    storage: "localStorage", // or 'sessionStorage' or 'cookie'
    storageKey: "nuxt-color-mode",
  },
  shadcn: {
    /**
     * Prefix for all the imported component
     */
    prefix: "",
    /**
     * Directory that the component lives in.
     * @default "./components/ui"
     */
    componentDir: "./components/ui",
  },
});