
export default defineNuxtPlugin(nuxtApp => {
  const errorState = useState('error')
  nuxtApp.hook('vue:error', (err: any) => {

    console.log('HANDLING ERROR');

    errorState.value = {
      message: err.message || myError[err?.cause?.name || 'unknown-error'].message,
      data: err.data || {},
    }

  })
})
