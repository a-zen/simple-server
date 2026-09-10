FROM node:26.8.2-alpine@sha256:ef24c5053d50fdc3e4e56eb4e7ddb7861874ab0fdc797046ba897581deb8e868 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY src ./src
RUN npm run build

FROM node:26.8.2-alpine@sha256:ef24c5053d50fdc3e4e56eb4e7ddb7861874ab0fdc797046ba897581deb8e868
COPY --from=builder /app/dist/server.js /app/server.js
WORKDIR /app
RUN apk upgrade --no-cache
EXPOSE 3000
CMD ["node","/app/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
