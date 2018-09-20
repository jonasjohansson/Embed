// Additional viewer modules for later merge

var socket = io();

/*
	General system status (relay + volume)
*/

	// Show Initial Volume
	socket.on('volume-initial', function(volume_initial){
		$("#volume-status").html(volume_initial);
	});  
	
	// Show New Volume
	socket.on('volume-new', function(volume_new){
		$("#volume-status").html(volume_new);	
	});	

	// Show Relay status
	socket.on('relay-status', function(arduino_relay_status){
		$("#relay-status").html(arduino_relay_status);	
	});		
