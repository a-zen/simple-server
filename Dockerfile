FROM node:24.10.0-alpine@sha256:1d8eaf99982be70694fd7913cdc6c7db20a1e2b863695c8156412899dc4368fd
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
