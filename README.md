# Doc Search

### What is Doc Search?
This is an example app written with [Svelte](https://svelte.dev/) which uses [TailwindCSS](https://tailwindcss.com/) for styling and [Vite](https://vitejs.dev/) bundling.

Refer to [doc-search](https://github.com/yelsaw/doc-search) for more information.

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
To build the image and start a docker container run the following commands


```
git clone https://github.com/yelsaw/doc-search.git
cd doc-search
docker build . -t doc-search
docker run --rm --name=doc-search -p 5000:80 doc-search
```
Proceed to http://localhost:5000/doc-search, or whatever port was chosen when starting your container.

### Live Demo
https://yelsaw.github.io/doc-search/

### Caveat Usor
This project is for experimental and educational purposes only!
Sample data is hard-coded in `./app/App.svelte`, there's zero security or sanity checking.
The code/comments herein aren't perfect, this project was written on a whim in a few hours to show a PoC to someone.

### Future
Perhaps this app will become more useful over time, but for now it's only an `experimental` project.

### Screenshot
![image](https://github.com/yelsaw/doc-search/blob/main/app/screenshot.png)

# AUTHOR
Yelsaw (doc-search@yelsaw.com)

# LICENSE
[MIT] (https://github.com/yelsaw/doc-search/blob/main/LICENSE)
