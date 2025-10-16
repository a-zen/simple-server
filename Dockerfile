FROM node:25.0.0-alpine@sha256:e7cd93dd330c82d33e2556e8d46729dae728b1034bfaa52177c7d7e3d183ce2c
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
