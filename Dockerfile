FROM node:25.6.1-alpine@sha256:7b5d127ed528aea140c88229044212fdda3e2d986aa0273c10e22192ec592814
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
