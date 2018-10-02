var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var path = require('path');
var loudness = require('loudness');

// Move the mouse across the screen as a sine wave.
var robot = require("robotjs");

var robot = require("robotjs");
var jsdom = require("jsdom");
const { JSDOM } = jsdom;
const { window } = new JSDOM();
const { document } = (new JSDOM('')).window;
global.document = document;


app.use(express.static( 'public/css'));


app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res){
  res.sendFile(__dirname + '/stage.html');
});

app.get('/controller', function (req, res,html) {
 res.sendFile(__dirname+'/controller.html');
});


io.on('connection', function(socket){
  console.log('a user connected');
  socket.on('disconnect', function(){
    console.log('user disconnected');
  });  

  /*
	  Demo events
	*/  
  socket.on('launch mode', function(launch_mode){
    io.emit('launch mode', launch_mode);
  });  
  
  
  /*
	  Volume Control
	*/
	
	// Get & emit Current Volume
	loudness.getVolume(function (err, current_volume) {
   	io.emit('current volume', current_volume);
	});

	// Set new volume		
  socket.on('volume level', function(volume_level){
    io.emit('volume level', volume_level);
    
		loudness.setVolume(volume_level, function (err) {});    
		
  });  



  /*
	  Arrow Controls
	*/  
	  
	  socket.on('arrow value', function(arrow_value){
	    io.emit('arrow value', arrow_value);
	  });  
	    
  
  /*
	  Touchpad
	*/  
  
	  socket.on('socket touchpad', function(data){
	    io.emit('socket touchpad', data);
	  });  
	  
	  // get current cursor location
	  
	  socket.on('socket mousemove', function(data){
	    io.emit('socket mousemove', data); 
		      
	  });    
	  			     
		/* 
			!!! 
				should start at the center of center canvas
			!!!
		*/	
		var latest_mouse_x = 640;
		var latest_mouse_y = 640;
		
		socket.on('socket touchpad end', function(socket_touchpad_end){

			//Get Latest Mouse Pos
		  var latest_mouse = robot.getMousePos();
		  latest_mouse_x = latest_mouse.x;
		  latest_mouse_y = latest_mouse.y;
		
		});
	
		/* 
			!!! 
				- keep the cursor only within the panorama
				- if it's going out, stop it
			!!!
		*/	

		// Emit touch events
		var mouse_timer;
		socket.on('socket touchpad', function(data){
		  
		  var touch_dest_x = data.socket_touchpad_x;
		  var touch_dest_y = data.socket_touchpad_y; 

	    robot.moveMouse(touch_dest_x+latest_mouse_x, touch_dest_y+latest_mouse_y); 
	              
		});   
		

		
		
		// Robot click
	  socket.on('touch click', function (touch_click) {
	    robot.mouseClick();
	  });	 
  
});


http.listen(3001, function(){
  console.log('listening on *:3001');
	if (process.send) {
    process.send('online');
  }  
});






    