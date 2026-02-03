FROM node:25.5.0-alpine@sha256:3b9ae5dfa49a9ee4013e61f0ae3c923bb53076299c5cd1b9f37f50258e9c961f
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
