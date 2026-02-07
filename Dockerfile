FROM node:25.6.0-alpine@sha256:09f7192862e11e31ee586e94e2b51274aafa5416e595fc847f1c5cdcfe5ef652
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
