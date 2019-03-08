
$(function() {
	
	
	$(function() {

		    /*
			    TV-channels
			*/
			    
			var tv_channels = [
				'http://localhost:3000/embed-experiences/embed-tv/videos/files/01.mp4',
				'http://localhost:3000/embed-experiences/embed-tv/videos/files/02.mp4',
				'http://localhost:3000/embed-experiences/embed-tv/videos/files/03.mp4'],
				channel_counter = 0;
		   
			var player_container = $("#tv-base .player");
				
			$next_channel = function() {
	        	channel_counter = (channel_counter + 1) % tv_channels.length; 
				
				var current_channel = tv_channels[channel_counter];

			    var video = document.getElementsByTagName('video')[0];
			    var sources = video.getElementsByTagName('source');
			    sources[0].src = current_channel;
			    video.load();
				video.play();
				
				
				// Fade-out & Remove
				TweenMax.to(player_container, 1, {opacity: 0});
				TweenMax.to(player_container, 1, {opacity: 1, delay: 1.5});			
										
			} 			    

			

		    /*
			    TV-themes
			*/
			
			var tv_themes = ['philips', 'braun', 'sony', 'sharp', 'optoma', 'future'],
			counter = 0;
	    	
	    				
			$next_theme = function() {
	        	counter = (counter + 1) % tv_themes.length; 
				
				var current_theme = tv_themes[counter];
				console.log(current_theme);
				
				$("#tv-base").removeClass();
				$("#tv-base").addClass(current_theme);
				
				
				if(current_theme == 'philips') {
					
					TweenMax.to(".panorama", 1, {backgroundColor: "orange"});
					TweenMax.to(".top", 1, {backgroundColor: "red"});
					
					TweenMax.to("#tv-base", 1, {scale: 0.5});
					
				}
				
				if (current_theme == 'braun') {
					TweenMax.to(".panorama", 1, {backgroundColor: "grey"});	
					TweenMax.to(".top", 1, {backgroundColor: "black"});
					
					TweenMax.to("#tv-base", 1, {scale: 0.7});
				} 

				if (current_theme == 'sony') {
					TweenMax.to(".panorama", 1, {backgroundColor: "grey"});	
					TweenMax.to(".top", 1, {backgroundColor: "orange"});
					
					TweenMax.to("#tv-base", 1, {scale: 1, left: 0, top: 0});
				} 
				
				if (current_theme == 'sharp') {
					TweenMax.to(".panorama", 1, {backgroundColor: "grey"});	
					TweenMax.to(".top", 1, {backgroundColor: "orange"});
					
					TweenMax.to("#tv-base", 1, {scale: 1, left: 0, top: 0});
				} 					

				if (current_theme == 'optoma') {
					TweenMax.to(".panorama", 1, {backgroundColor: "black"});
					TweenMax.to(".top", 1, {backgroundColor: "blue"});	
					
					TweenMax.to("#tv-base", 1, {scale: 1, left: 0, top: 0});
				} 	

				if (current_theme == 'future') {
					TweenMax.to(".panorama", 1, {backgroundColor: "black"});	
					TweenMax.to(".top", 1, {backgroundColor: "pink"});
					
					TweenMax.to("#tv-base", 1, {scale: 1, left: 0, top: 0});
				} 												
			} 						 
			  
	
			// Demo remote
			$("#remote_up").on('click', function () {
				$next_channel();
			});		
			$("#remote_right").on('click', function () {
				$next_theme();
			});		
				

		 
		
		$(window).on('load', function () {

	 		//$next_channel();	    
	 		console.log("TV LOADED");
	    
		});


								
	});
	
});
