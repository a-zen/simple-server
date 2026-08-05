FROM node:26.6.0-alpine@sha256:a4fb14143ee24c038c851864fe85fd90f9121abc8fdca3092798bcc02e06b1d8 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY src ./src
RUN npm run build

FROM node:26.6.0-alpine@sha256:a4fb14143ee24c038c851864fe85fd90f9121abc8fdca3092798bcc02e06b1d8
COPY --from=builder /app/dist/server.js /app/server.js
WORKDIR /app
RUN apk upgrade --no-cache
EXPOSE 3000
CMD ["node","/app/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
