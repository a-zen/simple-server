FROM node:26.5.0-alpine@sha256:a2bcf9238874d3900c086e685b8dc43e1ca8fa4e4a6c6e5f14a21f2f42e3af5f
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
