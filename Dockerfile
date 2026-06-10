FROM node:26.3.0-alpine@sha256:3ad34ca6292aec4a91d8ddeb9229e29d9c2f689efd0dd242860889ac71842eba
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
