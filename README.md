# simple-dummy

A simple-dummy rest service using node.js and express

![Publish Docker image](https://github.com/a-zen/simple-server/workflows/Publish%20Docker%20image/badge.svg?branch=master)

## Installation

```bash
npm install
```

## Starting

```bash
npm start
```

## Tests

### container test

There are container tests using goss.

## Resources

### ping

Sends a 'pong' response.

```bash
curl http://localhost:3000/ping
```

### visit-counter aka root

Counts up the number of visitor seen since server start
and responses with the number.

```bash
curl http://localhost:3000
```

## Logging

Logs startup, shutdown and receiving of request to stdout / stderr.

## Docker

### Building

Build the image from the project root with the following command:

```bash
docker build -t simple-server .
```

### Starting the container

Start the docker image with the following command:

```bash
docker run --init -d -p 3000:3000 --name simple-server simple-server
```

