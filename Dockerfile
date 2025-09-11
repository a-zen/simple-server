FROM node:24.8.0-alpine@sha256:3e843c608bb5232f39ecb2b25e41214b958b0795914707374c8acc28487dea17
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
