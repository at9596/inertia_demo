<script setup>
import { ClipboardList, Download } from 'lucide-vue-next'
import ThemeToggle from '@/Pages/ThemeToggle.vue'

defineProps({
  tasks: Array
})

const downloadTasks = (tasks)=>{
  // convert tasks to json
  const jsonData = JSON.stringify(tasks, null,2)

  // create file
  const blob = new Blob([jsonData], {
   type: 'application/json'
  })

  // Generate Temprary Url
  const url = URL.createObjectURL(blob)

  // Create download link
  const link = document.createElement('a')
  link.href = url
  link.download = 'tasks.json'

  // Trigger download
  document.body.appendChild(link)
  link.click()
  
  // Cleanup
  document.body.removeChild(link)
  URL.revokeObjectURL(url)
}
</script>

<template>
  <div class="min-h-screen dark:bg-gray-900 bg-gray-100 py-10 px-4">
    <div class="max-w-2xl mx-auto bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8">
    <ThemeToggle />

      <!-- Header -->
      <div class="flex items-start justify-between mb-8">

        <!-- Left -->
        <div class="flex items-center gap-4">
          <!-- Icon -->
          <div class="bg-blue-100 p-4 rounded-2xl">
            <ClipboardList class="w-10 h-10 text-blue-600" />
          </div>

          <!-- Title -->
          <div>
           

            <h1 class="text-4xl font-bold text-gray-800 dark:text-white">
              My Tasks
            </h1>
             <p class="text-sm text-gray-500 font-medium dark:text-gray-300">
              Add form
            </p>
          </div>
        </div>

        <!-- Right Actions -->
        <div class="flex items-center gap-3">

          <!-- Download Button -->
          <button
            @click= downloadTasks(tasks)
            class="flex items-center gap-2 bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-full transition dark:bg-gray-700 dark:text-white"
          >
            <Download class="w-4 h-4" />
            Download
          </button>

          <!-- Task Count -->
          <span class="bg-blue-100 text-blue-700 text-sm font-medium px-4 py-2 rounded-full dark:bg-blue-900 dark:text-blue-200">
            {{ tasks.length }} Tasks
          </span>
        </div>
      </div>

      <div v-if="tasks.length === 0" class="text-center py-10 text-gray-500 dark:text-gray-300">
        No tasks available
      </div>

      <ul v-else class="space-y-3">
        <li
          v-for="task in tasks"
          :key="task.id"
          class="flex items-center justify-between p-4 border rounded-xl hover:bg-gray-50 transition"
        >
          <div class="flex items-center gap-3">
            <div
              class="w-3 h-3 rounded-full"
              :class="task.completed ? 'bg-green-500' : 'bg-yellow-400'"
            ></div>

            <span
              class="text-gray-800 font-medium"
              :class="{ 'line-through text-gray-400': task.completed }"
            >
              {{ task.title }}
            </span>
          </div>

          <span
            v-if="task.completed"
            class="text-green-600 font-semibold"
          >
            Completed
          </span>

          <span
            v-else
            class="text-yellow-600 font-semibold"
          >
            Pending
          </span>
        </li>
      </ul>

    </div>
  </div>
</template>