const path = require('path');
const express = require('express');
const app = express();
const server = require('http').createServer(app);
const io = require('socket.io')(server);

const axios = require('axios');
const loudness = require('loudness');
const five = require('johnny-five');

app.use(express.static(path.join(__dirname, '/public')));

server.listen(3000);

io.on('connection', function(socket) {
	console.log('Socket connected');

	axios
		.get('http://localhost:3000/experiences.json')
		.then(response => {
			socket.emit('update', response.data);
			socket.emit('setup');
		})
		.catch(error => {
			console.log(error);
		});

	socket.on('enter', data => emit('enter'));
	socket.on('error', data => emit('error'));
	socket.on('play', data => emit('play', data));
	socket.on('stop', data => emit('stop'));
	socket.on('sleep', data => emit('sleep'));
	socket.on('reset', data => emit('reset'));
	socket.on('wake', data => emit('wake'));
	socket.on('restart', data => emit('restart'));
	socket.on('state-update', data => emit('state-update', data));

	/* Volume */

	// Get & emit Current Volume
	loudness.getVolume(function(err, volume_initial) {
		socket.emit('volume-initial', volume_initial);
		console.log('initial-volume:', volume_initial);
	});

	// Set new volume
	socket.on('volume-new', function(volume_new) {
		loudness.setVolume(volume_new, function(err) {});
		socket.emit('volume-new', volume_new);
	});

	/* Arduino Relay */

	socket.on('relay-control', function(arduino_relay_status) {
		// Check if board is even connected first
		if (relay_status == 'relay ready') {
			// Run command
			if (arduino_relay_status == 'wake') relay.close();
			else if (arduino_relay_status == 'sleep') relay.open();
		} else {
			arduino_relay_status = 'Relay not available';
			socket.broadcast.emit('relay-status', arduino_relay_status);
		}
		socket.broadcast.emit('relay-status', arduino_relay_status);
	});

	emit = (name, data = null) => {
		console.log('Emitting', name, data);
		socket.emit(name, data);
		socket.broadcast.emit(name, data);
	};
});

/* Set up relay */

var board = new five.Board();
var relay, relay_status;

board.on('ready', function() {
	relay_status = 'relay ready';
	relay = new five.Relay({ pin: 10, type: 'NC' });
	console.log(relay_status);
});
