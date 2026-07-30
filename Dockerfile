FROM node:26.5.1-alpine@sha256:233761595746769ebfdb6090f44fc7cdf818ae0ce62d2b37e0367723b9823e36 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY src ./src
RUN npm run build

FROM node:26.5.1-alpine@sha256:233761595746769ebfdb6090f44fc7cdf818ae0ce62d2b37e0367723b9823e36
COPY --from=builder /app/dist/server.js /app/server.js
WORKDIR /app
RUN apk upgrade --no-cache
EXPOSE 3000
CMD ["node","/app/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
