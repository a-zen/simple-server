FROM node:25.1.0-alpine@sha256:271156a7dea9bd16713f1c140f0cf99f66af5aed306699f26bebadbd1efb3aed
COPY . /app
WORKDIR /app
RUN apk upgrade --no-cache && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
