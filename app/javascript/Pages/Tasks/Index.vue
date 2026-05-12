<script setup>
import {  Download, X } from 'lucide-vue-next'
import { router } from '@inertiajs/vue3'

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

const deleteTask = (taskId) => {
  if (confirm('Are you sure you want to delete this task?')) {
    router.delete(`/tasks/${taskId}`)
  }
}
</script>

<template>
  <div class="min-h-screen dark:bg-gray-900 bg-gray-100 py-10 px-4">
    <div class="max-w-2xl mx-auto bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8">

      <!-- Header -->
      <div class="flex items-start justify-between mb-8">

        <!-- Left -->
        <div class="flex items-center gap-4">
          <!-- Title -->
          <div>
           

            <h1 class="text-4xl font-bold text-gray-800 dark:text-white">
              My Tasks
            </h1>
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
              class="text-gray-800 font-medium dark:text-gray-400"
              :class="{ 'line-through text-gray-400 dark:text-gray-200': task.completed }"
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
           <!-- Delete Button -->
      <button
        @click="deleteTask(task.id)"
        class="
          p-2 rounded-full
          bg-red-100 hover:bg-red-200
          dark:bg-red-900 dark:hover:bg-red-800
          transition
        "
      >
        <X class="w-4 h-4 text-red-600 dark:text-red-300" />
      </button>
        </li>
      </ul>
     


    </div>
  </div>
</template>