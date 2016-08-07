express = require 'express'
path = require 'path'
logger = require 'morgan'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
ClearbitController = require './assets/controllers/ClearbitController'

PORT = 8080;

data = []

app = express();

app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded({ extended: false })
app.use cookieParser()
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'
app.use express.static 'app'

app.get '/', (req, res) ->
  res.render 'index'

app.post '/', ClearbitController

app.listen PORT
console.log 'Server is running on the port ' + PORT + ' :)'
