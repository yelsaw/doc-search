# Doc Search v1.0.0

### What is this?
Main app for doc search example UI, refer to [doc-search](https://github.com/yelsaw/doc-search) for more information.
This is an example app written with [Svelte](https://svelte.dev/) which uses [TailwindCSS](https://tailwindcss.com/) for styling and [Vite](https://vitejs.dev/) bundling.

### Run without Docker
To run without docker clone this repo [doc-search](https://github.com/yelsaw/doc-search) and run `npm install` then `npm run dev`
Alternatively use [PNPM](https://pnpm.io/installation) for much faster builds.

### Run with Docker

# Build image and start container
To build the image and start a docker container, clone this repo and run `docker build . -t  doc-search`

Once the image is built, start the container `docker run --rm --name=doc-search -p 5000:80 doc-search`
Proceed to http://localhost:5000, or whatever port was chosen when starting your container.

### Caveat Emptor
This project is for experimental and educational purposes only! 

Sample data is hard-coded in the App.svelte file, there's zero security or sanity checking. 

The code/comments herein aren't perfect, this project was written on a whim in a few hours and maybe updated to become useful and use "Best Practices" in the future.

### Screenshot
![UI Screenshot](https://github.com/yelsaw/doc-search/screenshot.png "UI Screenshot")

# AUTHOR
Yelsaw (doc-search@yelsaw.com)



