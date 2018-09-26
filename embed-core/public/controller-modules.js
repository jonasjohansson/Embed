// Additional controller modules for later merge



/*
	Declare smart variables
*/
	
	// Relay control
	var arduino_relay_status;
	
	// Generic Overlay Function
	var destination_overlay, this_pattern, this_nav_bottom;
	
	// Temp
	var welcome_status = true;


/*
	Dynamic functions
*/
	
	// Show relevant content based on "destination_overlay"
	function show_destination_overlay(){
		$("section.overlay-block").hide();
		destination_overlay.show();
		this_pattern = destination_overlay.find(".pattern");
		this_nav_bottom = destination_overlay.find(".nav-bottom");
		
		TweenMax.fromTo(this_pattern, tr_smooth, {opacity: 0, backgroundPositionX: "40%"}, {opacity: .25, backgroundPositionX: "50%"});
		TweenMax.fromTo(this_nav_bottom, tr_smooth, {y: 64}, {y: 0});
	}
	
	// Show temp overlay (only above)
	function show_temp_overlay(){
		destination_overlay.show();
		this_pattern = destination_overlay.find(".pattern");
		this_nav_bottom = destination_overlay.find(".nav-bottom");
		
		TweenMax.fromTo(this_pattern, tr_smooth, {opacity: 0, backgroundPositionX: -64}, {opacity: 1, backgroundPositionX: 0});
		TweenMax.fromTo(this_nav_bottom, tr_smooth, {y: 64}, {y: 0});
	}	



/*
	State control 1 – Sockets
*/

	
socket.on('state-update', function (data) {
    setState(data.state, data.val);
});

setState = (state, val) => {
	
	// just print the state for testing
	$("#system-status-plus p.state").html(state,val);
	
	// perform actions based on the state
    if(state == "sleep") {
		
		// Relay
		arduino_relay_status = "sleep"; 
		socket.emit('relay-control', arduino_relay_status);
		console.log("projectors off");		    
		$("#system-status-plus p.relay").html(arduino_relay_status);	
					    
		// >on success:
		destination_overlay = $("#overlay-sleeping");
		show_destination_overlay();	    		 
    
    } else if(state == "wake") {
	    
	    // Relay
		arduino_relay_status = "wake"; 
		socket.emit('relay-control', arduino_relay_status);	
		console.log("projectors on");		
		$("#system-status-plus p.relay").html(arduino_relay_status);	    
		
		// > on success:
		destination_overlay = $("#welcome");
		show_destination_overlay();	    		 
    
    } else if(state == "start") {

		$("#welcome").hide();		
		destination_overlay = $("#explore");
		show_destination_overlay();	    		 
    
    } else if(state == "loading") {

		destination_overlay = $("#loading");
		show_destination_overlay();	    		 
    
    } else if(state == "playing") {

		$("#loading").hide();	
		$("#playing-controls").show();
  		 
    } else if(state == "stopped") {
		
		// Hide controls
		$("#playing-controls").hide();
		// > Hide "currently playing" 
		// > Load "Default experience"   		 
   
    } else if(state == "reset-welcome") {
	    
	    // Hide experience stuff
	    $("#explore").hide();
	    $("#playing-controls").hide();
		// > Stop "currently playing"
		// > Load "Welcome Experience"  
			    
		destination_overlay = $("#welcome");
		show_destination_overlay();			
 		 
    }          
    
    
    
}




	

/*
	State control 2 – Front-end Confirmations
*/

	 
	// Pre-sleep overlay (Welcome)
	$('#show-overlay-presleep-welcome').on("click tap", function(e) {
		destination_overlay = $("#overlay-presleep-welcome");
		show_destination_overlay();
	});

	$('#close-overlay-presleep-welcome').on("click tap", function() {
		destination_overlay = $("#welcome");
		show_destination_overlay();
	});
	
	// Pre-sleep overlay (Explore)
	$('#show-overlay-presleep-explore').on("click tap", function(e) {
		destination_overlay = $("#overlay-presleep-explore");
		show_destination_overlay();
	});	
	$('#close-overlay-presleep-explore').on("click tap", function() {
		destination_overlay = $("#explore");
		show_destination_overlay();
	});
	
	// Show pre-reset warning
	$('#show-overlay-prereset').on("click tap", function(e) {
		destination_overlay = $("#overlay-prereset");
		show_destination_overlay();
	});	
	$('#close-overlay-prereset').on("click tap", function() {
		destination_overlay = $("#overlay-presleep-explore");
		show_destination_overlay();
	});	
	




/*
	Visual effects
*/

	// global transitions
	/*
	var tr_in = 0.3;
	var tr_out = 0.1;
	var tr_smooth = .5;
	var tr_super_smooth = 1.7;
	*/
	var tr_in, tr_out, tr_smooth, tr_super_smooth = 0;
		
	// Butons
	$('button').on("touchstart mouseover", function() {
		$(this).addClass("touchstart");
		TweenMax.to($(this).find("i"), tr_in, {scale: 1.15});
	});
	
	$('button').on("touchend mouseleave", function() {
		$(this).removeClass("touchstart");
		TweenMax.to($(this).find("i"), tr_out, {scale: 1});
	});
	
	//Loading spin
	
	TweenMax.to('button.loading', tr_super_smooth, {rotation:"360", ease:Linear.easeNone,repeat:-1});
	
	

/*
	Volume
*/

	// Range slider
	$(".controller-plus #volume-slider").rangeslider({
		polyfill : false
	});		

	// Set Initial Volume
	socket.on('volume-initial', function(volume_initial){
		$('#volume-slider').val(volume_initial).change();
	});  
	
	// Set New Volume
	$("#volume-slider").on("input change", function() {
		var volume_new = $("#volume-slider").val();	
		socket.emit('volume-new', volume_new);
		if(volume_new > 0) {
			$(".volume-wrap i").addClass("on");	
		} else {
			$(".volume-wrap i").removeClass("on");		
		}
	});	
	
	
