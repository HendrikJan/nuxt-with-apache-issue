export default defineI18nConfig(() => {
  console.log('🅰️ 🅱️ 🅾️ Loading i18n config file')
  return {
    legacy: false,
    locale: 'en',
    messages: {
      en: {
        welcome: 'Welcome'
      },
      fr: {
        welcome: 'Bienvenue'
      }
    }
  }
})