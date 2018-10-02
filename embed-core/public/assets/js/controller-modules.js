/*
	Controller.js (Oct 2)
*/


var socket = io();

display = experiences => {
	$experiences = document.querySelector('#experiences');

	removeChildren($experiences);

	for (let prop in experiences) {
		if (prop === 'default' || prop === 'welcome') continue;

		let experience = experiences[prop];
		let $experience = document.createElement('li');

		$experience.setAttribute('data-slug', experience.slug);
		// $experience.setAttribute('data-title', experience.title);
		// $experience.setAttribute('data-flags', experience.flags);
		// $experience.setAttribute('data-format', experience.format);



		$experience.innerHTML = `
			<div class="experience_overview">
				<div class="cover">
					<video style="min-height: 100px; background-image: url(${experience.cover_image});">
						<source src="${experience.cover_video}" type="video/mp4">
					</video>
				</div>	
				<div class="info-wrap">
					<h2 class="bold">${experience.title}</h2>
					<div class="attributes">
						<span class="author">${experience.author}</span>
					</div>
					<p class="description">${experience.description}</p>
					
				</div>			
			</div> 
			<div class="experience_details">
				<div class="inner">
					<h3>Credits</h3>
					<a href="${experience.author_url}">
						<span class="author">${experience.author}</span>
					</a>
					<p>Long description goes here ... </p>
				</div>	
				<div class="nav-bottom">
					<button class="large align-middle" data-action="play" data-data="${prop}">
						<i class="icon-play"></i>
						<span>Play</span>
					</button>
					<button data-action="stop">stop</button>
				</div> 						
			</div>`;

		$experiences.appendChild($experience);
	}
};

play = experience => {
	for (let el of document.querySelectorAll('.selected'))
		el.classList.remove('selected');
	document.querySelector('#' + experience.slug).classList.add('selected');
};

stop = () => {
	document.querySelector('.selected').classList.remove('selected');
};

socket.on('volume-initial', volume_initial => {
	$volume_slider.value = volume_initial;
});

$volume_slider = document.querySelector('#volume-slider');

$volume_slider.addEventListener('change', e => {
	var volume_new = e.target.value;
	socket.emit('volume-new', volume_new);
});




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
		
		//TweenMax.fromTo(this_pattern, tr_smooth, {opacity: 0, backgroundPositionX: "40%"}, {opacity: .25, backgroundPositionX: "50%"});
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

/*	
socket.on('state-update', function (data) {
    setState(data.state, data.val);
});
*/



socket.on('enter', data => {
	$("#welcome").hide();		
	destination_overlay = $("#explore");
	show_destination_overlay();
	
	//Helpers	    
	$("#system-status-plus p.relay").html("start");			     
});

socket.on('sleep', data => {
	destination_overlay = $("#overlay-sleeping");
	show_destination_overlay();	  
	
	//Helpers
	arduino_relay_status = "sleep"; 		    
	$("#system-status-plus p.relay").html(arduino_relay_status);		     
});

socket.on('wake', data => {
	destination_overlay = $("#welcome");
	show_destination_overlay();	
	
	//Helpers
	arduino_relay_status = "wake"; 	
	$("#system-status-plus p.relay").html(arduino_relay_status);	         
});

socket.on('wake', data => {
	destination_overlay = $("#welcome");
	show_destination_overlay();	
	
	//Helpers
	arduino_relay_status = "wake"; 	
	$("#system-status-plus p.relay").html(arduino_relay_status);	         
});

// Loading

/*
	destination_overlay = $("#loading");
	show_destination_overlay();	    		 
*/    

socket.on('play', id => {
	$("#loading").hide();	
	$("#playing-controls").show();
});

socket.on('stop', data => {
	$("#playing-controls").hide();	         
});

socket.on('reset', data => {
    // Hide experience stuff
    $("#explore").hide();
    $("#playing-controls").hide();
		    
	destination_overlay = $("#welcome");
	show_destination_overlay();			         
});




	

/*
	State control 2 – Front-end Confirmations
*/

	 
	// Pre-sleep overlay (Welcome)
	$("[data-action=show-overlay-presleep-welcome]").on("click tap", function(e) {
		destination_overlay = $("#overlay-presleep-welcome");
		show_destination_overlay();
	});

	$('[data-action=close-overlay-presleep-welcome]').on("click tap", function() {
		destination_overlay = $("#welcome");
		show_destination_overlay();
	});
	
	// Pre-sleep overlay (Explore)
	$('[data-action=show-overlay-presleep-explore]').on("click tap", function(e) {
		destination_overlay = $("#overlay-presleep-explore");
		show_destination_overlay();
	});	
	$('[data-action=close-overlay-presleep-explore]').on("click tap", function() {
		destination_overlay = $("#explore");
		show_destination_overlay();
	});
	
	// Show pre-reset warning
	$('[data-action=show-overlay-prereset]').on("click tap", function(e) {
		destination_overlay = $("#overlay-prereset");
		show_destination_overlay();
	});	
	$('[data-action=close-overlay-prereset]').on("click tap", function() {
		destination_overlay = $("#overlay-presleep-explore");
		show_destination_overlay();
	});	
	



/*
	Expand Experience
*/
	
	var selected_experience;
	$('#experiences').on("click", "li", function() {
		
		selected_experience = $(this);
		
		
		//Hide all others
		$('#experiences li').hide();
		
		//Show this
		selected_experience.show();
		
		//Nav control
		$('#explore .nav-top').hide();
		$('#explore .nav-top.experience-nav').show();
		
				
		$('#explore').addClass("detailed-view");
		
		selected_experience.addClass("selected");
		
		//Show details
		var selected_experience_details = selected_experience.find(".experience_details");
		selected_experience_details.show();

	});
	
	$('[data-action=close-experience-details]').on("click", function() {
				
		//Show all others
		$('#experiences li').show();
		
		//Show this
		//selected_experience.show();
		
		//Nav control
		$('#explore .nav-top').show();
		$('#explore .nav-top.experience-nav').hide();
		$("#experiences li .experience_details").hide();
				
		$('#explore').removeClass("detailed-view");
		
		selected_experience.removeClass("selected");

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
	$('body').on("touchstart mouseover", "button", function() {
		$(this).addClass("touchstart");
		TweenMax.to($(this).find("i"), tr_in, {scale: 1.15});
	});
	
	$('body').on("touchend mouseleave", "button", function() {
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
	




	
