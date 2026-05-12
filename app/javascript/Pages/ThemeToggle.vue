<script setup>
import { ref, onMounted } from 'vue'

const darkMode = ref(false)

onMounted(() => {
  darkMode.value = localStorage.theme === 'dark'

  if (darkMode.value) {
    document.documentElement.classList.add('dark')
  }
})

const toggleTheme = () => {
  darkMode.value = !darkMode.value
  console.log("clicked")
  console.log(darkMode.value)
  if (darkMode.value) {
   console.log(document.documentElement.classList)
    document.documentElement.classList.add('dark')
    localStorage.theme = 'dark'
  } else {
     console.log(document.documentElement.classList)
    document.documentElement.classList.remove('dark')
     console.log(localStorage.theme)
    localStorage.theme = 'light'
  }
}
</script>

<template>
  <button
  @click="toggleTheme"
  class="px-4 py-2 rounded bg-black text-white dark:bg-white dark:text-black"
>
  Toggle Theme
</button>
</template>
