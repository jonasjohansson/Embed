// Additional controller modules for later merge
	
	var socket = io();

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
	Sleep/Wake
*/

	// Turn it on...
	var arduino_relay_status;
	
	// Hardware Sleep
	$('#command-sleep').on("click", function() {
		arduino_relay_status = false; 
		socket.emit('relay-control', arduino_relay_status);
		console.log("sleep click");		  
	});		
	
	// Hardware Wake
	$('#command-wake').on("click", function() {
		arduino_relay_status = true; 
		socket.emit('relay-control', arduino_relay_status);	
		console.log("wake click");		
	});
