export default defineNuxtConfig({
  modules: [
    '@nuxtjs/i18n',
  ],

  i18n: {
    vueI18n: `./i18n.config.ts`
  },

  // We want ssr:false because we want to do all calculations in the browser
  // and besides, keeping the server-side rendering working requires more
  // maintenance than only client-side rendering
  ssr: false,

  compatibilityDate: '2024-07-04',
});