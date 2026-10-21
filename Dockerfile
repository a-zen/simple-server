FROM node:26.12.1-alpine@sha256:9bd229b644e391df00fb989efa732335aefc6170a05d8c163c5c8ca9870da401 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY src ./src
RUN npm run build

FROM node:26.12.1-alpine@sha256:9bd229b644e391df00fb989efa732335aefc6170a05d8c163c5c8ca9870da401
COPY --from=builder /app/dist/server.js /app/server.js
WORKDIR /app
RUN apk upgrade --no-cache
EXPOSE 3000
CMD ["node","/app/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
