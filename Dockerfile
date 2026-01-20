FROM node:25.4.0-alpine@sha256:270a5d7079b66b11acef760bf38703f199b76f568a796a1d2577f6ed5f398070
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
