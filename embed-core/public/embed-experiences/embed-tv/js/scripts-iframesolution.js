
$(function() {
	
	
	$(function() {
		
		 var fotorama, player_width, player_height;

			
		 
		    // 1. Initialize fotorama manually.
		    var $fotoramaDiv = $('#fotorama-player').on('fotorama:ready ' +           // Fotorama is fully ready
		        'fotorama:show ' +            // Start of transition to the new frame
		        'fotorama:showend ' +         // End of the show transition
		        'fotorama:load ' +            // Stage image of some frame is loaded
		        'fotorama:error ' +           // Stage image of some frame is broken
		        'fotorama:startautoplay ' +   // Slideshow is started
		        'fotorama:stopautoplay ' +    // Slideshow is stopped
		        'fotorama:fullscreenenter ' + // Fotorama is fullscreened
		        'fotorama:fullscreenexit ' +  // Fotorama is unfullscreened
		        'fotorama:loadvideo ' +       // Video iframe is loaded
		        'fotorama:unloadvideo',       // Video iframe is removed
		        function (e, fotorama, extra) {
		          //console.log('## ' + e.type);
		          //console.log('active frame', fotorama.activeFrame);
		          //console.log('additional data', extra);
		        }
			).fotorama({
			  nav: false,
			  arrows: false,
			  autoplay: false,
			  margin: 0,
			  minwidth: '100px',
			  minheight: '100px',
			  transition: 'dissolve',
			  transitionduration: 1000,
			  fit: 'cover',
			  loop: true,
			  video: true			    
		    });
		
		    // 2. Get the API object.
		    fotorama = $fotoramaDiv.data('fotorama');
		
		    // 3. Inspect it in console.
		    console.log(fotorama);
		   
		    
			$update_sizes = function(){
			 	player_width = $(".player").width();
			 	player_height = $(".player").height();
	
			    fotorama.resize({
				  width: player_width + "px",
				  height: player_height + "px"
				});			
			}


			// Remote functions
			$prev_channel = function() {
				fotorama.show('<');	
				fotorama.playVideo();
			} 
			$next_channel = function() {
				fotorama.show('>');	
				fotorama.playVideo();
			} 	
			
			//themes
			var tv_themes = ['philips', 'braun', 'sony', 'sharp', 'optoma', 'future'], counter = 0;
	    	
	    				
			$next_theme = function() {
	        	counter = (counter + 1) % tv_themes.length; 
				
				var current_theme = tv_themes[counter];
				console.log(current_theme);
				
				$("#tv-base").removeClass();
				$("#tv-base").addClass(current_theme);
				
				$update_sizes();
				
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
			$("#remote_down").on('click', function () {
				$prev_channel();
			});	
			$("#remote_right").on('click', function () {
				$next_theme();
			});		
				

		 
		
		$(window).on('load', function () {

			 	player_width = $(".player").width();
			 	player_height = $(".player").height();
	
			    fotorama.setOptions({
				  width: player_width + "px",
				  height: player_height + "px"
				});		
			
			fotorama.playVideo();			 		    

	    
		});
						
						
	});
	
});
