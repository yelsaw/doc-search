FROM node:18.8.0-alpine AS nodebuilder

RUN mkdir -p /app
WORKDIR /app
COPY . .
RUN npm install -g pnpm@$pnpm
RUN pnpm install
RUN pnpm run build

FROM nginx:1.23.1-alpine
COPY --from=nodebuilder /app/dist /usr/share/nginx/html
