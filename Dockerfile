FROM node:26.3.0-alpine@sha256:144769ec3f32e8ee36b3cfde91e82bee25d9367b20f31a151f3f7eea3a2a8541
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
