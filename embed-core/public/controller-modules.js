// Additional controller modules for later merge

/*
	Volume
*/

// Set Initial Volume
socket.on('volume-initial', function(volume_initial){
	$('#volume-slider').val(volume_initial).change();
});  

// Set New Volume
$("#volume-slider").on("input change", function() {
	var volume_new = $("#volume-slider").val();	
	socket.emit('volume-new', volume_new);
});	



/*
	Commands
*/
	
	var welcome_status = true;
	
	/*
		Sleep/Wake
	*/
	
	// Turn it on...
	var arduino_relay_status;
	
	// Hardware Sleep
	$('#command-sleep').on("click", function() {
		arduino_relay_status = "sleep"; 
		socket.emit('relay-control', arduino_relay_status);
		console.log("sleep click");	
		$('#relay-status').html(arduino_relay_status);	  
		alert("hardware sleep command");
	});		
	
	// Hardware Wake
	$('#command-wake').on("click", function() {
		arduino_relay_status = "wake"; 
		socket.emit('relay-control', arduino_relay_status);	
		console.log("wake click");	
		$('#relay-status').html(arduino_relay_status);	
		
		alert("hardware wake command");
		
		//
		if(welcome_status = true) {
			
		}
	});


	/*
		Experiences
	*/
	

	// Start from Welcome
	$('#command-start').on("click", function() {
		alert("start command");
	});		
	


/*
	Visual State Control
	- Purely visual state control 
*/
	
	// Generic Overlay Function
	var destination_overlay, this_pattern, this_nav_bottom;
	function show_destination_overlay(){
		destination_overlay.show();
		this_pattern = destination_overlay.find(".pattern");
		this_nav_bottom = destination_overlay.find(".nav-bottom");
		
		TweenMax.fromTo(this_pattern, tr_smooth, {opacity: 0, x: -64}, {opacity: 1, x: 0});
		TweenMax.fromTo(this_nav_bottom, tr_smooth, {y: 64}, {y: 0});
	}
	
	
	// Show overlay sleep
	$('#show-overlay-sleep').on("click tap", function(e) {
		$("#welcome").hide();
		
		destination_overlay = $("#overlay-sleep");
		show_destination_overlay();
	});
	
	// Clse overlay sleep (cancel)
	
	$('#close-overlay-sleep').on("click tap", function() {
		$("#overlay-sleep").hide();
		
		destination_overlay = $("#welcome");
		show_destination_overlay();
	});





/*
	Visual effects
*/

// global transitions

var tr_in = 0.3;
var tr_out = 0.1;
var tr_smooth = .7;
var tr_super_smooth = 1.7;

// Butons
$('button').on("touchstart mouseover", function() {
	$(this).addClass("touchstart");
	TweenMax.to($(this).find("i"), tr_in, {scale: 1.1});
});

$('button').on("touchend mouseleave", function() {
	$(this).removeClass("touchstart");
	TweenMax.to($(this).find("i"), tr_out, {scale: 1});
});