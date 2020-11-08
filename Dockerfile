FROM node:14
COPY . /app
WORKDIR /app
RUN apt-get update && apt-get -y full-upgrade && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
