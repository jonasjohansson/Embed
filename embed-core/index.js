const axios = require('axios');
const path = require('path')
const express = require('express');  
const app = express();  
const server = require('http').createServer(app);  
const io = require('socket.io')(server);

app.use(express.static(path.join(__dirname, '/public')));

server.listen(3000); 

const controller;
const viewer;

io.of('/controller').on('connection', function(socket){

	controller = socket;

	console.log('controller connected…');

	axios.get('http://localhost/embed/embed-core/public/experiences.json')
		.then(response => {
			console.log(response.data);
			socket.emit('update', response.data);
		})
		.catch(error => {
			console.log(error);
		});

	socket.on('')
});

io.of('/viewer').on('connection', function(socket){
	console.log('viewer connected…');
});