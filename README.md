# Doc Search v1.0.0

### What is this?
Main app for doc search example UI, refer to [doc-search](https://github.com/yelsaw/doc-search) for more information.
This is an example app written with [Svelte](https://svelte.dev/) which uses [TailwindCSS](https://tailwindcss.com/) for styling and [Vite](https://vitejs.dev/) bundling.

### Run without Docker
To start without docker run the following commands
```
git clone https://github.com/yelsaw/doc-search.git
cd doc-search
npm install
npm run dev
```
Alternatively use [PNPM](https://pnpm.io/installation) (i.e., pnpm install, etc) for much faster builds.

### Run with Docker

# Build image and start container
To build the image and start a docker container run the following commands
```
git clone https://github.com/yelsaw/doc-search.git
cd doc-search
docker build . -t doc-search
docker run --rm --name=doc-search -p 5000:80 doc-search
```
Proceed to http://localhost:5000, or whatever port was chosen when starting your container.

### Caveat Emptor
This project is for experimental and educational purposes only! 

Sample data is hard-coded in the App.svelte file, there's zero security or sanity checking. 

The code/comments herein aren't perfect, this project was written on a whim in a few hours and maybe updated to become useful and use "Best Practices" in the future.

### Screenshot
![image](https://github.com/yelsaw/doc-search/blob/main/screenshot.png)

# AUTHOR
Yelsaw (doc-search@yelsaw.com)



