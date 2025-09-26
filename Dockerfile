FROM node:24.9.0-alpine@sha256:5fde6e454206a7a1208046d0a4284980b9721c85459cadb7f368eef775a60811
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
