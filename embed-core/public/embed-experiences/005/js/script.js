var defineValues = function() {
  
  // Default Values
  this.room_width = 3530;
  this.room_height = 2570;
  this.room_depth = 2660;
  this.resolution_y = 800; 
  
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
	var the_center = $(".surface.center");
	var the_left = $(".surface.left");
	var the_right = $(".surface.right");
	var the_top = $(".surface.top");

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
	
	// Display Sizes
	$(".center").width(round_width);
	$(".center").height(round_height); 
	$(".top").width(round_width);
	$(".top").height(round_depth);
	$(".top").css("left", round_depth);
	$(".left").add($(".right")).width(round_depth);
	$(".left").add($(".right")).height(round_height);
	$("body").width(body_width);

	//Print sizes
	text.size_center = round_width + " x " + round_height;
	text.size_top = round_width + " x " + round_depth;
	text.size_left = round_depth + " x " + round_height;
	text.size_right = round_depth + " x " + round_height;	
	text.body_width = body_width;
	text.body_height = body_height;
		
	$(".surface").each(function(){
		var this_width = $(this).width();
		var this_height = $(this).height();
		$(this).html(this_width + " x " + this_height);
	}); 
	
}

