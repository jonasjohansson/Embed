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
		arduino_relay_status = "sleep"; 
		socket.emit('relay-control', arduino_relay_status);
		console.log("sleep click");	
		$('#relay-status').html(arduino_relay_status);	  
	});		
	
	// Hardware Wake
	$('#command-wake').on("click", function() {
		arduino_relay_status = "wake"; 
		socket.emit('relay-control', arduino_relay_status);	
		console.log("wake click");	
		$('#relay-status').html(arduino_relay_status);	
	});
	

/*
	Controller alerts
*/

	socket.on('controller-alert', function(controller_alert){
		alert(controller_alert);
		console.log("yo!");
	});  
