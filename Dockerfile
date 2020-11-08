FROM node:14
COPY . /app
WORKDIR /app
RUN apt update && apt -y full-upgrade && npm install
EXPOSE 3000
CMD ["node","/app/src/server.js"]
USER node
