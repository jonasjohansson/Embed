
	

$(document).ready(function() {
		
		// Global Socket Variable
		var socket = io();

		/*
			Volume Slider
		*/
		
			$("#volume-slider").rangeslider({
				polyfill : false
			});			
		
			// Set Current Volume
		  socket.on('current volume', function(current_volume){
				$('#volume-slider').val(current_volume).change();
				
				// Show on load
				TweenLite.to($('.volume-wrap'), .3, { opacity: 1});
		  });  
			
			// Set New Volume
			$("#volume-slider").on("input change", function() {
	
				var volume_level = $("#volume-slider").val();	
				
				$.debounce(250, socket.emit('volume level', volume_level));
		
			});
		
		
		
		/*
			Activate controller
		*/		
			
			
			// Show Arrow Controls
			$(".open-interactive.open-arrows").on("touchstart click", function() {
				
				TweenLite.fromTo($('.interact-wrapper.interact-arrows'), .3, { y: -100, opacity: 0}, {y: 0, opacity: 1, display: "block"});
				$(".close-interactions.back-button").show();			
			});	
			
			// Show Cursor Controls
			$(".open-interactive.open-cursor").on("touchstart click", function() {
	
				TweenLite.fromTo($('.interact-wrapper.interact-cursor'), .3, { y: -100, opacity: 0}, {y: 0, opacity: 1, display: "block"});
				$(".close-interactions.back-button").show();
			});				

			// Close Controls

			$(".close-interactions").on("touchstart click", function() {
	
				// Show Cursor Controls
				TweenLite.to($('.interact-wrapper'), .1, { y: -100, opacity: 0, display: "none"});
				$(".close-interactions.back-button").hide();
			});				
			


		/*
			ARROWS
		*/

			// Arrow – touchstart
			
			$(".interact-button").on('touchstart click', function(e){	
				
				e.preventDefault();
				var arrow_value = $(this).attr("id");	
				socket.emit('arrow value', arrow_value);		
				
				
				TweenLite.to(this, 1, { backgroundColor: "#999999"});

			});
			
			// Arrow – touchsend
			$(".interact-button").on('touchend mouseout', function(e){

				TweenLite.to(this, .2, { backgroundColor: "none"});

			});				




    socket.on('arrow value', function(arrow_value){
      

      // Refresh
      if(arrow_value == "int-arrow-back") {
		    //alert("back"); 
      } 
      if(arrow_value == "int-arrow-ok") {
				TweenLite.to($(".demo-click"), .5, {rotation: "+=180", backgroundColor: "red"});	
      }    
      if(arrow_value == "int-arrow-up") {
		    TweenLite.to($(".demo-click"), .5, {y: "-=24"}); 
      }   
      if(arrow_value == "int-arrow-right") {
		    TweenLite.to($(".demo-click"), .5, {x: "+=24"}); 
      } 
      if(arrow_value == "int-arrow-left") {
		    TweenLite.to($(".demo-click"), .5, {x: "-=24"}); 
      }
      if(arrow_value == "int-arrow-down") {
		    TweenLite.to($(".demo-click"), .5, {y: "+=24"});
      }                                    
    });

		/*
			Touchpad – DEMO
		*/
			
			
			// Get Current Mouse Position on Stage
			
			var currentMousePos = { x: -1, y: -1 };
			$(document).on('mousemove', function(event) {
				currentMousePos.x = event.pageX;
        currentMousePos.y = event.pageY;
  
    		socket.emit('socket mousemove start', {mouse_x: currentMousePos.x, mouse_y: currentMousePos.y});
    		
		  });			

			// Touch events
			
			
			//Get finger start possition
			var touchpad_x_start = 0;
			var touchpad_y_start = 0;

			var touchStarted = false, currX = 0, currY = 0, cachedX = 0, cachedY = 0;			
			
			$(".touch-area").on('touchstart', function(e){				
				// Get offset & gloabl sizes
				
				TweenLite.to(this, 1, { backgroundColor: "#666666"});
				
				e.preventDefault();
				touchpad_x_start = e.originalEvent.touches[0].pageX;
				touchpad_y_start = e.originalEvent.touches[0].pageY;			
				
				
				// Emit possition
				cachedX = touchpad_x_start;
				// caching the current y
				cachedY = touchpad_y_start;
				// a touch event is detected      
				touchStarted = true;

				// detecting if after 200ms the finger is still in the same position
				setTimeout(function (){
        	currX = touchpad_x_start;
					currY = touchpad_y_start;
					if ((cachedX === currX) && !touchStarted && (cachedY === currY)) {
            // Here you get the Tap event
            var touch_click = "tapped";
						socket.emit('touch click', touch_click);
        }
				},100);	
			
			});
			
			
			var touch_sencitivity = 2;
			
			$(".touch-area").on('touchmove', function(e){
					
					e.preventDefault();
					
					// Get offset & gloabl sizes
					var touchDivPos = $(this).offset().top;	
					//var touchDivWidth = $(".touch-area").width();
					
					// Get touch possition
					
					//var touchpad_x_start = e.originalEvent.touches[0].pageX;
					//var touchpad_y_start = e.originalEvent.touches[0].pageY;
					
					var touchpad_x_device = e.originalEvent.touches[0].pageX;
					var touchpad_y_device = e.originalEvent.touches[0].pageY;
					
					
					var touchpad_x = touchpad_x_device - touchpad_x_start;
					var touchpad_y = touchpad_y_device - touchpad_y_start;
					
					
					// Emit possition
					socket.emit('socket touchpad', {socket_touchpad_x: touchpad_x * touch_sencitivity, socket_touchpad_y: touchpad_y * touch_sencitivity});
	
					// Show & move finger
					TweenLite.set($(".finger"), { opacity: .5, x: touchpad_x_device, y: touchpad_y_device-touchDivPos});
				
			});
			

			
			// Emit touch events
	
			
			// Stop Touch Events
			$(".touch-area").on('touchend', function(e){
				
				touchStarted = false;
				
				// Send touch end notice to find last cursor possition
				var socket_touchpad_end = "moveended";
				socket.emit('socket touchpad end', {socket_touchpad_end});
				
				TweenLite.to(this, .2, { backgroundColor: "#999999"});

				TweenLite.to($(".finger"), .2, { opacity: 0});
				
				// Remove Touch Cursor
				//TweenLite.set(".touchpad_output", {clearProps:"all"});
				//TweenMax.set($(".touchpad_output"), {backgroundColor: "red"});
				
				//TweenLite.to($(".touchpad_output"), .5, {opacity: 0, display: "none"});
			
			});			
			
			
			// Touch - Click
			
			$(".demo-click").on('click', function(){
				TweenLite.to(this, .5, {rotation: "+=90"});	
			});
		
			$(".touch-click").on('click touchstart', function() {
				var touch_click = "clicked";
				socket.emit('touch click', touch_click);
				TweenLite.to(this, 1, { backgroundColor: "#666666"});
			});	

			$(".touch-click").on('touchend', function() {
				TweenLite.to(this, .2, { backgroundColor: "#999999"});
			});						
			
			/*
			$(".touch-area").on('tap click', function(){
				var touch_click = "tapped";
				socket.emit('touch click', touch_click);
			});
			*/
});	






