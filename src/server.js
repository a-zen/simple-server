var express = require('express')
var app = express()

var counter = 0

app.get('/ping', function (req, res) {
  console.log('Received ping request from ' + req.connection.remoteAddress)
  res.send('pong')
})

app.get('/', function (req, res) {
  counter++
  console.log('Received visitor request from ' + req.connection.remoteAddress +
    ' number ' + counter)
  res.send('Hello visitor number ' + counter)
})

app.listen(3000, function () {
  console.log('started simple-dummy on port 3000')
})

process.on('SIGTERM', function () {
  console.info('Received SIGTERM, starting graceful shutdown')
  process.exit(0)
})
