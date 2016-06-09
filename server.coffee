express = require 'express'
path = require 'path'
logger = require 'morgan'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
port = 8080;

data = []

app = express();

app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded({ extended: false })
app.use cookieParser()
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'
app.use express.static 'public'

app.get '/', (req, res) ->
  res.render 'index'

# app.post '/', (req, res) ->
#   data.push req.body
#   res.json data

app.listen port
console.log 'Server is running on the port ' + port + ' :)'
