<script>
import { fly, fade } from 'svelte/transition'

const docSamples = [
  '🍎 Now is the time for all good apples to come to the aid of their oranges 🍊',
  '🍊 Now is the time for all good oranges to come to the aid of their lemons 🍋',
  '🍋 Now is the time for all good lemons to come to the aid of their grapes 🍇',
  '🍇 Now is the time for all good grapes to come to the aid of their apples 🍎',
]
/**
 * Global vars
 * @var {searchStrings} initialized as array
 * @var {numberOfMatches} initialized as 0
 * @var {searchString} bound to search input
 */
let searchStrings = []
let documentDetail = []
let numberOfMatches = 0
let searchString = ''

/**
 * Flatten all unique words from any strings in the arrays
 * @param {strings} array of strings
 * @param  {searchString} string to be searched
 * @returns {boolean}
 */
const isValid = (strings, searchString) => {
  return [...new Set(docSamples.map(docs => {
    return docs.split(' ') }).flat(1))
  ].find(str => str.toLowerCase() === searchString)
}

/**
 * Creates a meta structure used for showing a valid strings origin
 * @param {strings} array of strings
 * @param {searchString} string to be searched
 * @returns {array}
 */
const documentMeta = (strings, searchString) => {
  return strings.map(text => {
  return text.split(/ /)
  }).map((words, docId ) => {
      return words.map((word, position) => {
        return { doc:docId + 1, position:position, word:word }
      })
  }).flat(1).filter(doc => doc.word === searchString)
}

//let searchDetail = docStringsPositions.filter(doc => doc.word === searchString)

/**
 * Click method for search button, populates searchStrings if string is found
 * @warning side effect, searchStrings populated if string is found
 * @returns {void}
 */
const getResults = () => {
  searchString = searchString.trim().toLowerCase()
  // Check for valid string from bound input and check all available strings
  if(searchString && isValid(docSamples, searchString)) {
    // If string is available check current found words
    if(!searchStrings.find(str => str.toLowerCase() === searchString)) {
      // Push the known string on to the stack for display
      searchStrings = [...searchStrings, searchString]
      // Push the known string details on to matching index stack
      // TODO: implement all details in one struct to save cycles and redundancy
      documentDetail = [...documentDetail, documentMeta(docSamples, searchString)]
    }
  }
}

/**
 * Calls {getResults} "on Enter Key"
 * @returns {void}
 */
const getResultsEnter = (e) => {
  if(e.key === "Enter") {
    getResults()
  }
}

/**
 * Removes single search and detail records by index
 * @warn side effect, searchStrings and documentDetail _maybe_ affected
 * @returns {void}
 */
const removeSingle = (index) => {
  searchStrings = searchStrings.filter((_,i) => i !== index)
  documentDetail = documentDetail.filter((_,i) => i !== index)
}

/**
 * Removes all {searchStrings} and {documentDetail} records by index
 * @warn side effect, searchStrings and documentDetail _will_ be affected
 * @returns {void}
 */
const removeAll = (index) => {
  searchStrings = []
  documentDetail = []
}

</script>

<main class="mt-32 font-sans ml-3 mr-3">

<div class="m-auto max-w-fit mt-4 rounded-lg border drop-shadow-lg shadow-lg bg-stone-50/40 p-7">
<div class="bg-green-100/50 rounded-md">
<div class="shadow-lg rounded-lg">
  <div class="py-5 px-4 sm:px-6">
    <h3 class="text-lg font-medium text-green-900">Doc Search v1.0</h3>
    <p class="mt-1 max-w-2xl text-sm text-gray-500">After you perform a search details will be populated if the string is found</p>
  </div>
  <div class="border-gray-200">
    <dl>
      <div class="bg-white py-4 px-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">Enter String</dt>
        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><input bind:value={searchString} on:keydown={getResultsEnter} class="rounded-md mr-2 mb-2" type="text" /><button class="rounded-md bg-green-300 px-3 py-3 text-center text-green-800 hover:bg-gray-100 hover:text-black" on:click={getResults}>Search</button></dd>
      </div>
      <div class="mt-2">
      {#if searchStrings.length > 0 }
        <div transition:fade="{{ duration: 600 }}" class="bg-white py-5 px-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
          <dt class="text-sm font-medium text-gray-500">Last Searches:<br />
            <p class="mt-1 max-w-2xl text-sm text-gray-500">(Doc:Position)</p>
            <button class="rounded-md bg-red-300 px-1 py-1 text-center text-red-800 hover:bg-gray-100 hover:text-black" on:click={removeAll}>Remove All</button>
          </dt>
          <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
            <ul class="divide-y divide-gray-200 rounded-md border border-gray-200">
              {#each searchStrings as string, i}
              <li class="flex items-center justify-between py-3 pl-3 pr-4 text-sm">
                <div transition:fly="{{ x: 200, duration: 500 }}" class="flex w-0 flex-1 items-center">
                  <span class="bg-green-200 rounded-full px-2 py-1 text-sm text-green mr-1 mb-1">{string}</span>
                  {#each documentDetail[i].map(doc => { return `${doc.doc}:${doc.position}` }) as details }
                  <span class="bg-gray-200 rounded-full px-2 py-1 text-sm text-gray mr-1 mb-1">{details}</span>
                  {/each}
                </div>
                <div  class="ml-4 flex-shrink-0">
                  <button class="rounded-md bg-red-300 px-1 py-1 text-center text-red-800 hover:bg-gray-100 hover:text-black" on:click={() => removeSingle(i)}>Remove</button>
                </div>
              </li>
              {/each}
            </ul>
          </dd>
        </div>
      {/if}
    </div>
      {#each docSamples as text, i}
      <div class="{i % 2 ? 'bg-white' : 'bg-sky-100'} shadow-lg py-5 px-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">Doc{i + 1}</dt>
        <dd class="doc-text mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
        {text}
      </dd>
      </div>
      {/each}
    </dl>
  </div>
</div>
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
