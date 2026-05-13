<script setup>
import { useForm, Link } from '@inertiajs/vue3'

const form = useForm({
  email: '',
  password: '',
  remember_me: false
})

function submit(){
 form
    .transform((data) => ({
      user: data
    }))
    .post('/users/sign_in', {
      onSuccess: () => {
        form.reset()
      }
    })
}
</script>
<template>

  <div class="max-w-2xl mx-auto bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8">
  <div class="flex items-center justify-between mb-8">

      <div>
        <h1 class="text-3xl font-bold text-gray-800 dark:text-white">
          Login User
        </h1>

        <p class="text-gray-500 dark:text-gray-300 mt-2">
          Please login to your account
        </p>
      </div>
    </div>
   <!-- Form -->
   <form @submit.prevent="submit()" class="space-y-6">
     <!-- Email -->
      <div>
        <label for= "email"
          class="
            block mb-2 text-sm font-medium
            text-gray-700 dark:text-gray-300
          "
        >
          Email
        </label>

        <input
          v-model="form.email"
          type="text"
          placeholder="Enter email..."
          class="
            w-full px-4 py-3 rounded-xl border
            border-gray-300 dark:border-gray-600
            bg-white dark:bg-gray-700
            text-gray-900 dark:text-white
            focus:outline-none focus:ring-2
            focus:ring-blue-500
          "
          id= "email"
          autocomplete= "email"
        />

        <p
          v-if="form.errors.email"
          class="mt-2 text-sm text-red-500"
        >
          {{ form.errors.email   }}
        </p>
      </div>

       <!-- password -->
      <div class = "mb-2">
        <label for= "password"
          class="
            block mb-2 text-sm font-medium
            text-gray-700 dark:text-gray-300
          "
        >
          Password
        </label>

        <input
          v-model="form.password"
          type="password"
          placeholder="Enter password..."
          class="
            w-full px-4 py-3 rounded-xl border
            border-gray-300 dark:border-gray-600
            bg-white dark:bg-gray-700
            text-gray-900 dark:text-white
            focus:outline-none focus:ring-2
            focus:ring-blue-500
          "
          id= "password"
          autocomplete= "password"
        />

        <p
          v-if="form.errors.password"
          class="mt-2 text-sm text-red-500"
        >
          {{ form.errors.password   }}
        </p>
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
        {{ form.processing ? 'Logging...' : 'Logged in' }}
      </button>

   </form>


   <!-- Signup Link -->
<div class="text-center">
  <Link
    href="/users/sign_up"
    class="
      text-blue-600 hover:text-blue-700
      dark:text-blue-400
      font-medium
    "
  >
    Don't have an account? Sign up
  </Link>
</div>

  </div>

</template>