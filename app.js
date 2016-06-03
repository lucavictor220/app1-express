var express = require('express');
var app = express();
var path = require('path');
var port = 4000;

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.static('public'));

app.get('/', function(req, res) {
  res.render('index');
});

app.listen(port);
console.log('Server is running on the port ' + port);
