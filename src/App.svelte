<script>

import Search from './lib/Search.svelte'
import { fly, fade } from 'svelte/transition'

const docSamples = [
  '🍎 Now is the time for all good apples to come to the aid of their oranges 🍊',
  '🍊 Now is the time for all good oranges to come to the aid of their lemons 🍋',
  '🍋 Now is the time for all good lemons to come to the aid of their grapes 🍇',
  '🍇 Now is the time for all good grapes to come to the aid of their apples 🍎',
]

</script>

<main class="mt-32 font-sans ml-3 mr-3">
  <div class="m-auto max-w-fit mt-4 rounded-lg border drop-shadow-lg shadow-lg bg-stone-50/40 p-7">
    <div class="bg-green-100/50 rounded-md">
      <Search docSamples={docSamples} />
    </div>
  </div>
</main>

<style>
:root {
  font-family: Inter, Avenir, Helvetica, Arial, sans-serif;
  font-size: 16px;
  line-height: 24px;
  font-weight: 400;
  color-scheme: light dark;
  color: rgba(255, 255, 255, 0.87);
  font-synthesis: none;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-text-size-adjust: 100%;
}
:global(.highlighter) {
  background-color: rgb(254 240 138 / 1);
}
:global(body) {
  background: url(/bg.jpg) no-repeat center center fixed;
  background-size: cover;
}
</style>
