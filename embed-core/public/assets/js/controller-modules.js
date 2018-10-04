/*
	Controller.js (Oct 2)
*/


var socket = io();

setup = () => {};
enter = () => {};
reset = () => {};

var current_experience;
var selectedExperience;

display = experiences => {
	$experiences = document.querySelector('#experiences');

	removeChildren($experiences);

	for (let prop in experiences) {
		if (prop === 'default' || prop === 'welcome') continue;

		let experience = experiences[prop];
		let $experience = document.createElement('li');
		$experience.setAttribute('data-slug', experience.slug);
		$experience.setAttribute('data-play-prop', prop);
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
						<span class="playing">Playing</span>
					</div>
					<p class="description">${experience.description}</p>
					
				</div>			
			</div> 
			<div class="experience_details">
				<div class="inner">
					<p class="long-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit, mauris et pretium eleifend, velit odio mollis ante, quis congue lacus mauris vitae orci. Maecenas facilisis orci eu augue iaculis, non mollis justo pulvinar. Sed a pulvinar sem, et sodales sapien. Morbi viverra ante nec ante tincidunt molestie. Pellentesque rhoncus pulvinar risus et tincidunt. Nam nibh mauris, feugiat eget velit a, finibus efficitur neque. Sed fermentum leo at massa efficitur efficitur. Sed sed neque quis lectus suscipit sodales. In pulvinar posuere lorem, vitae lacinia eros sollicitudin. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.

In aliquet metus vel elit scelerisque, gravida cursus turpis hendrerit. Vivamus lobortis, felis ut semper dictum, ipsum arcu faucibus justo, vitae varius urna urna et odio. Donec ultrices, magna sodales pellentesque, diam elit finibus ante, ut pretium velit orci eu est. Nam vel orci massa. Phasellus dapibus dui nec augue ornare ultrices. Quisque malesuada massa molestie, mollis ante nec, tempus dolor. Aenean aliquam eleifend leo, vitae tincidunt nisl vehicula ac. In ultrices molestie erat, sed porttitor orci faucibus. Suspendisse luctus pulvinar tortor, eget pharetra purus condimentum nec. Donec eu laoreet libero. Sed vel urna euismod, egestas dui eget, pellentesque nisi. Integer vitae feugiat sapien. Curabitur porttitor et sapien sit amet vulputate.</p>
					<h2>Credits</h2>
					<p>
						<span class="helper">Author – </span>
						<a href="${experience.author_url}"><span class="author link">${experience.author}</span></a>		
					</p>
					<p>
						<span class="helper">Type – </span>
						<span class="author link">${experience.type}</span>	
					</p>							
				</div>				
			</div>`;

		$experiences.appendChild($experience);
	}
};

play = experience => {
	$('#experiences li').removeClass('playing');
	
	current_experience = $('li[data-slug=' + experience.slug + ']');
	current_experience.addClass('playing');
	
	$("#current-experience-title p").text(selectedExperience.title);
	$("#current-experience-image").css('background-image', 'url(' +  selectedExperience.cover_image + ')');
};

stop = () => {
	$('#experiences li').removeClass('playing');
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
		
		TweenMax.fromTo(this_pattern, tr_smooth, {opacity: 0, backgroundPositionX: "40%"}, {opacity: 1, backgroundPositionX: "50%"});
		TweenMax.fromTo(this_nav_bottom, tr_smooth, {y: 112}, {y: 0, delay: tr_delay});
		
	}
	
	
	//
	function show_loader(){
		$("#global-loader").show();
	}
	function hide_loader(){
		$("#global-loader").hide();
	}	
	function show_playing(){
		TweenMax.fromTo($("#playing-controls"), tr_smooth, {y: 112}, {y: 0, display: "block"});
	}	
	function hide_playing(){
		TweenMax.fromTo($("#playing-controls"), tr_out, {y: 0}, {y: 112, display: "none"});
	}	
	function show_play(){
		TweenMax.fromTo($("#play-controls"), tr_smooth, {y: 112}, {y: 0, display: "block"});
	}	
	function hide_play(){
		$("#play-controls").hide();	
	}	
	function hide_welcome(){
		$("#welcome").hide();	
	}	
	function hide_sleeping(){
		$("#overlay-sleeping").hide();	
	}		
	
	

/*
	State control 1 – Sockets
*/



socket.on('enter', data => {
	destination_overlay = $("#explore");	
	$("[data-action=enter]").hide();
	show_loader();
	setTimeout(hide_welcome, 500);
	setTimeout(show_destination_overlay, 500);
	setTimeout(hide_loader, 500);
});

socket.on('sleep', data => {
	destination_overlay = $("#overlay-sleeping");
	show_destination_overlay();	  	         
});

socket.on('wake', data => {
	//destination_overlay = $("#welcome");
	show_loader();
	$("[data-action=wake]").hide();
	setTimeout(hide_sleeping, 3000);
	setTimeout(hide_loader, 3000);	       
});


socket.on('play', id => {
	$("#loading").hide();
	hide_play();
	show_loader();
	setTimeout(show_playing, 1000);
	setTimeout(hide_loader, 1000);
});

socket.on('stop', data => {
	hide_playing();	 
	if(selected_experience == null) {

	} else {
		if(selected_experience.hasClass("selected")) { 
			show_play();					   
		}
	}
});

socket.on('reset', data => {
    // Hide experience stuff
    $("[data-action=enter]").show();
    
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
		$("[data-action=wake]").show();
		destination_overlay = $("#overlay-presleep-welcome");
		show_destination_overlay();
	});

	$('[data-action=close-overlay-presleep-welcome]').on("click tap", function() {
		$("[data-action=wake]").show();
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
	



	//Expand Experience
	
	var selected_experience;
	var scroll_save;
	$('#experiences').on("click", "li", function() {
		
		selected_experience = $(this);
					
		scroll_save = $('.content-feed').offset().top;
		
		//Hide all others
		$('#experiences li').hide();
		
		// Scroll to top
		window.scrollTo(0, 0);
		
		//Show this
		selected_experience.show();
		
		
		
		//Nav control
		$('#explore .nav-top').hide();
		$('#explore .nav-top.experience-nav').show();
		
				
		$('#explore').addClass("detailed-view");
		
		
		
		//Show details
		var selected_experience_details = selected_experience.find(".experience_details");
		selected_experience_details.show();
		
		//Show dynamic play-nav
		var play_prop = selected_experience.attr("data-play-prop");
		$("#play-controls button").attr("data-data", play_prop);

		// Hide stop if this one is not playing
		if(!selected_experience.hasClass("playing")) {
			$("#playing-controls").hide();	
			if(!selected_experience.hasClass("selected")) {
				TweenMax.fromTo($("#play-controls"), tr_smooth, {y: 64}, {y: 0, display: "block", delay: tr_delay});	
			}			
			
		}
		
		selected_experience.addClass("selected");
		TweenMax.set($("#experiences li"), {scale: 1});

	});
	
	$('[data-action=close-experience-details]').on("click", function() {
				
		//Show all others
		$('#experiences li').show();
		
		//Scroll to saved possition
		window.scrollTo(0, scroll_save);
		
		TweenMax.set($("#experiences li"), {scale: 1});
		
		//Bring controls up if something is playing
		if (selectedExperience !== undefined && selectedExperience !== null) {
			$("#playing-controls").show();	
		}
		
		//Nav control
		$('#explore .nav-top').show();
		$('#explore .nav-top.experience-nav').hide();
		$("#experiences li .experience_details").hide();				
		$('#explore').removeClass("detailed-view");
		
		
		//Show dynamic play-nav
		$("#play-controls button").attr("data-data", "undefined");
		$("#play-controls").hide();	
		
		selected_experience.removeClass("selected");

	});	


/*
	Visual effects
*/

	// global transitions
	
	var tr_in = 0.3;
	var tr_out = 0.1;
	var tr_smooth = .5;
	var tr_super_smooth = 1.7;
	var tr_delay = .3;
	
	//var tr_in, tr_out, tr_smooth, tr_super_smooth = 0;
		
	// Butons
	$('body').on("touchstart mouseover", "button", function() {
		$(this).addClass("touchstart");
		TweenMax.to($(this).find("i"), tr_in, {scale: 1.15});
	});
	
	$('body').on("touchend mouseleave", "button", function() {
		$(this).removeClass("touchstart");
		TweenMax.to($(this).find("i"), tr_out, {scale: 1});
	});
	
	//Experiences feed touch
	$('body').on("touchstart mouseover", "#experiences li", function() {		
		if(!$(this).hasClass("selected")) {
			TweenMax.to($(this), tr_in, {scale: 1.01});
			//TweenMax.to($(this).find(".experience_overview"), tr_in, {backgroundColor: "#121212"});	
		}
	});	
	$('body').on("touchend mouseleave", "#experiences li", function() {		
		if(!$(this).hasClass("selected")) {
			TweenMax.to($(this), tr_in, {scale: 1});
			//TweenMax.to($(this).find(".experience_overview"), tr_in, {backgroundColor: "#000"});
		}
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
	




	
