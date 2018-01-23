# simple-dummy

A simple-dummy rest service using node.js and express

# Installation

```
npm install
```

# Starting

```
npm start
```

# Tests

nothing so far

# Resources

## ping

Sends a 'pong' response.

```
curl http://localhost:3000/ping
```

## visit-counter aka root

Counts up the number of visitor seen since server start
and responses with the number.

```
curl http://localhost:3000
```

# Logging

Logs startup, shutdown and receiving of request.

# Docker

## Building

Build the image from the project root with the following command:

```
docker build -t simple-server .
```

## Starting

Start the docker image with the following command:

```
docker run --init -d -p 3000:3000 --name simple-server simple-server
```

