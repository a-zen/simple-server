FROM node:24.6.0-alpine@sha256:de5947748f6e158bf335c3540e1aab648a5607d5078f35fdb6d5c1c6189dd781
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
