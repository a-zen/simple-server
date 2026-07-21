var Fastify = require('fastify')
var app = Fastify({ logger: false })

var counter = 0

app.get('/ping', function (req, reply) {
  console.log('Received ping request from ' + req.ip)
  reply.send('pong')
})

app.get('/', function (req, reply) {
  counter++
  console.log('Received visitor request from ' + req.ip +
    ' number ' + counter)
  reply.send('Hello visitor number ' + counter)
})

app.listen({ port: 3000, host: '0.0.0.0' }, function (err) {
  if (err) {
    console.error(err)
    process.exit(1)
  }
  console.log('started simple-dummy on port 3000')
})

process.on('SIGTERM', function () {
  console.info('Received SIGTERM, starting graceful shutdown')
  process.exit(0)
})
