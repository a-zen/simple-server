FROM node:25.7.0-alpine@sha256:9f841c88a6f7b1c2df07dbb9c7bb2cf4a56685a5ce79645451f3eeba7f20baff
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
