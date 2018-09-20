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