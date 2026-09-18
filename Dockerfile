FROM node:26.9.0-alpine@sha256:d1afba4b9c2edf2dcc56684c90e6c670309eecbc558b9d4bc7f530efb9934b43 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY src ./src
RUN npm run build

FROM node:26.9.0-alpine@sha256:d1afba4b9c2edf2dcc56684c90e6c670309eecbc558b9d4bc7f530efb9934b43
COPY --from=builder /app/dist/server.js /app/server.js
WORKDIR /app
RUN apk upgrade --no-cache
EXPOSE 3000
CMD ["node","/app/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
