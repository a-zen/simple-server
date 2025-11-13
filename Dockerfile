FROM node:25.2.0-alpine@sha256:3f162243a45e30f6b20f80255779785789e142bec7b1d5d3b431f31d5b3610f6
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
