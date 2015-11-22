express = require('express')
app = express()

app.use (req, res, next) ->
  console.log('%s %s %s', res.statusCode, req.method, req.url)
  next()

app.use express.static String('./build')

app.get '*', (req, res) ->
  res.sendfile "./build/index.html"

app.listen 8000

