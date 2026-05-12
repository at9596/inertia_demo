<script setup>
import { useDark, useToggle } from '@vueuse/core'

const isDark = useDark()
const toggleDark = useToggle(isDark)
</script>

<template>
  <button
    @click="toggleDark()"
    class="
      px-4 py-2 rounded-xl transition
      bg-gray-200 text-gray-800
      dark:bg-gray-700 dark:text-white
    "
  >
    {{ isDark ? '🌞 Light' : '🌙 Dark' }}
  </button>
</template>