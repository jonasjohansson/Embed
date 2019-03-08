var socket = io();

// Room Variables


var rooms, room_id, room_w, room_h, room_d, room_resolution;

// Load room settings
socket.on('update-rooms', data => {
	rooms = data;

	//Missing
	room_id = "001";
	room_resolution = 400;
	
	// Existing
	room_w = rooms[room_id].w;
	room_h = rooms[room_id].h;
	room_d = rooms[room_id].d;

});


// Define settings & Defaults
var defineValues = function() {
  
  // Default Values
  this.room_width = 1;
  this.room_height = 1;
  this.room_depth = 1;
  this.resolution_y = 640; 
  
  // Output
  this.size_center = "";
  this.size_top = "";
  this.size_left = "";
  this.size_right = "";
  
  // Overall Output
  this.body_width = 0;
  this.body_height = 0;  
};


var text = new defineValues();
var gui = new dat.GUI();

window.onload = function() {
	
	// Appens Sysyetm Setting	
	text.room_width = room_w;
	text.room_height = room_h;
	text.room_depth = room_d;
	text.resolution_y = room_resolution;
	
	var dimensions = gui.addFolder('Dimensions');	
	dimensions.add(text, 'room_width').min(1).step(1).onChange(setValue);
	dimensions.add(text, 'room_height').min(1).step(1).onChange(setValue);
	dimensions.add(text, 'room_depth').min(1).step(1).onChange(setValue);
	dimensions.add(text, 'resolution_y').min(1).step(1).onChange(setValue);
	dimensions.open();
		
	var output = gui.addFolder('Output');
	output.add(text, 'size_center').listen();
	output.add(text, 'size_top').listen();
	output.add(text, 'size_left').listen();
	output.add(text, 'size_right').listen();
	output.add(text, 'body_width').listen();
	output.add(text, 'body_height').listen();
	output.open();	
	
	setValue();	
};  




function setValue() {

	// Viewer surfaces
	var the_center = $("#system-center");
	var the_left = $("#system-left");
	var the_right = $("#system-right");
	var the_top = $("#system-top");

	// Settings Inputs	
	var setting_width = text.room_width;
	var setting_height = text.room_height;
	var setting_depth = text.room_depth;
	var setting_proj_height = text.resolution_y;
	
	// Findings			
	var combined_width = setting_width + setting_depth * 2;
	var combined_height = setting_height + setting_depth; 

	// Adjusted ratios to max resolution X
	var set_onepercent = setting_proj_height/setting_height; 

	// Output values
	var the_width = setting_width * set_onepercent;
	var the_height = setting_height * set_onepercent;
	var the_depth = setting_depth * set_onepercent;	
	
	// Round values
	var round_width = Math.round(the_width);
	var round_height =  Math.round(the_height);
	var round_depth =  Math.round(the_depth);		
	var body_width = round_width + round_depth * 2;
	var body_height = round_height + round_depth;
	
	// Place surfaces
	$("#system-center").css({'width':round_width, 'height':round_height, 'left': round_depth, 'top': round_depth});
	$("#system-top").css({'width':round_width, 'height':round_depth, 'left': round_depth});
	$("#system-left").css({'width':round_depth, 'height':round_height, 'top': round_depth});
	$("#system-right").css({'width':round_depth, 'height':round_height, 'left': round_depth + round_width, 'top': round_depth});
	
	$("body").css({'width':body_width, 'height':body_height});

	//Print sizes
	text.size_center = round_width + " x " + round_height;
	text.size_top = round_width + " x " + round_depth;
	text.size_left = round_depth + " x " + round_height;
	text.size_right = round_depth + " x " + round_height;	
	text.body_width = body_width;
	text.body_height = body_height;
		
}

