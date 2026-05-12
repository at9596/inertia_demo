<script setup>
import { useForm, Link } from '@inertiajs/vue3'

const form = useForm({
  title: '',
  completed: false
})

const submit = () => {
  form.post('/tasks', {
    onSuccess: () => {
      form.reset()
    }
  })
}
</script>

<template>
  <div
    class="
      max-w-2xl mx-auto
      bg-white dark:bg-gray-800
      rounded-2xl shadow-lg
      p-8
    "
  >
    <!-- Header -->
    <div class="flex items-center justify-between mb-8">

      <div>
        <h1 class="text-3xl font-bold text-gray-800 dark:text-white">
          Create Task
        </h1>

        <p class="text-gray-500 dark:text-gray-300 mt-2">
          Add a new task to your list
        </p>
      </div>

      <Link
        href="/tasks"
        class="
          px-4 py-2 rounded-xl
          bg-gray-100 hover:bg-gray-200
          dark:bg-gray-700 dark:hover:bg-gray-600
          text-gray-700 dark:text-white
          transition
        "
      >
        Back
      </Link>
    </div>

    <!-- Form -->
    <form @submit.prevent="submit" class="space-y-6">

      <!-- Title -->
      <div>
        <label
          class="
            block mb-2 text-sm font-medium
            text-gray-700 dark:text-gray-300
          "
        >
          Task Title
        </label>

        <input
          v-model="form.title"
          type="text"
          placeholder="Enter task title..."
          class="
            w-full px-4 py-3 rounded-xl border
            border-gray-300 dark:border-gray-600
            bg-white dark:bg-gray-700
            text-gray-900 dark:text-white
            focus:outline-none focus:ring-2
            focus:ring-blue-500
          "
        />

        <p
          v-if="form.errors.title"
          class="mt-2 text-sm text-red-500"
        >
          {{ form.errors.title }}
        </p>
      </div>

      <!-- Completed -->
      <div class="flex items-center gap-3">
        <input
          v-model="form.completed"
          type="checkbox"
          class="w-5 h-5 rounded"
        />

        <label class="text-gray-700 dark:text-gray-300">
          Mark as completed
        </label>
      </div>

      <!-- Submit -->
      <button
        type="submit"
        :disabled="form.processing"
        class="
          w-full py-3 rounded-xl
          bg-blue-600 hover:bg-blue-700
          text-white font-semibold
          transition
          disabled:opacity-50
        "
      >
        {{ form.processing ? 'Creating...' : 'Create Task' }}
      </button>

    </form>
  </div>
</template>