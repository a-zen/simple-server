FROM node:26.5.0-alpine@sha256:e88a35be04478413b7c71c455cd9865de9b9360e1f43456be5951032d7ac1a66 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY src ./src
RUN npm run build

FROM node:26.5.0-alpine@sha256:e88a35be04478413b7c71c455cd9865de9b9360e1f43456be5951032d7ac1a66
COPY --from=builder /app/dist/server.js /app/server.js
WORKDIR /app
RUN apk upgrade --no-cache
EXPOSE 3000
CMD ["node","/app/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
