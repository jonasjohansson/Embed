const request = require('request')

var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
	res.sendFile(__dirname + '/controller.html');
});

io.on('connection', function(socket){
	console.log('a user connected');
	socket.on('load', function (data) {
		console.log(data);
	});
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});

request({
	url: './experiences.json',
	json: true
}, function (error, response, body) {
	if (!error && response.statusCode === 200) {
		console.log(body) 
	}
});