var express = require('express');
var app = express();

var counter = 0;

app.get('/ping', function (req, res) {
  console.log('Received ping request from TODO');
  res.send('pong');
});

app.get('/', function (req, res) {
  counter++;
  console.log('Received visitor request from TODO number ' + counter);
  res.send('Hello visitor number ' + counter);
});

app.listen(3000, function () {
    console.log('started simple-dummy on port 3000');
});

// TODO: log shutdown
// TODO: add timestamp to log?
