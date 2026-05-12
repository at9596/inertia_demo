<script setup>
defineProps({
  tasks: Array
})

console.log("Vue is working! Tasks received:", 50)
</script>

<template>
  <div class="min-h-screen bg-gray-100 py-10 px-4">
    <div class="max-w-2xl mx-auto bg-white rounded-2xl shadow-lg p-8">
      
      <div class="flex items-center justify-between mb-6">
        <h1 class="text-3xl font-bold text-gray-800">
          My Tasks
        </h1>

        <span class="bg-blue-100 text-blue-700 text-sm font-medium px-3 py-1 rounded-full">
          {{ tasks.length }} Tasks
        </span>
      </div>

      <div v-if="tasks.length === 0" class="text-center py-10 text-gray-500">
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
            class="text-green-600 font-semibold text-sm"
          >
            Completed
          </span>

          <span
            v-else
            class="text-yellow-600 font-semibold text-sm"
          >
            Pending
          </span>
        </li>
      </ul>

    </div>
  </div>
</template>