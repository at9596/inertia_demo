<script setup>
import {computed} from 'vue'
import ThemeToggle from '@/Components/ThemeToggle.vue'
import { Link } from '@inertiajs/vue3'
import { ClipboardList, LogOut } from 'lucide-vue-next'
import { usePage,router } from '@inertiajs/vue3'
const page = usePage()
const userlogged = computed(() => {
  return page.props.auth?.user
})
const logout = () => {
  router.delete('/users/sign_out')
}
</script>

<template>
  <div class="min-h-screen bg-gray-100 dark:bg-gray-900 transition">

    <!-- Header -->
    <header
      class="
        bg-white dark:bg-gray-800
        border-b border-gray-200 dark:border-gray-700
      "
    >
      <div
        class="
          max-w-6xl mx-auto
          px-6 py-4
          flex items-center justify-between
        "
      >

        <!-- Logo -->
        <div class="flex items-center gap-3">
           <Link
    href="/tasks/new"
    class="flex items-center gap-3"
  >
    <div class="bg-blue-100 p-2 rounded-xl">
      <ClipboardList class="w-6 h-6 text-blue-600" />
    </div>

    <h1 class="text-xl font-bold text-gray-800 dark:text-white">
      Task Manager
    </h1>
  </Link>
        </div>

        <!-- Theme Toggle -->
        <ThemeToggle />
         <button
          v-if="userlogged"
            @click="logout"
            class="
              flex items-center gap-2
              px-4 py-2 rounded-xl
              bg-red-100 hover:bg-red-200
              dark:bg-red-900 dark:hover:bg-red-800
              text-red-600 dark:text-red-300
              transition
            "
          >
            <LogOut class="w-4 h-4" />
            Sign out
          </button>
      </div>
    </header>

    <!-- Page Content -->
    <main class="max-w-6xl mx-auto p-6">
      <slot />
    </main>

  </div>
</template>