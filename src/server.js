var express = require('express');
var app = express();

app.get('/ping', function (req, res) {
  console.log('Received ping request from TODO');
  res.send('pong');
});

app.get('/', function (req, res) {
  console.log('Received root request from TODO');
  res.send('Hello World!');
});

app.listen(3000, function () {
    console.log('started simple-dummy on port 3000');
});

// TODO: log shutdown
// TODO: add timestamp to log?
