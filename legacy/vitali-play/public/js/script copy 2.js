var request = null;
var mouse = { x: 0, y: 0 };

var depth_back, depth_y, depth_x, windowwidth, windowheight;

var stage_width, stage_height, setting_width, setting_height, setting_depth, setting_stage_width, setting_stage_height, setting_stage_fit;






$(document).ready(function() {


	function adjustStage() {
		
		/*
			Dynamic Window Variables
		*/
		
		windowwidth = window.innerWidth;
		windowheight = window.innerHeight;
		
		cx = window.innerWidth / 2;
    cy = window.innerHeight / 2;
     
    cy_mobile = $(".intro-wrapper").height() / 2;  
    
    depth_y = "50% 50% " + - cy_mobile + "px"; 
    depth_x = "50% 50% " + - cx + "px"; 
    
    if(cx > cy_mobile ) {
	  	depth_back = depth_y;   
    } else {
	   	depth_back = depth_x; 
    }
    

    windowonepercent = windowwidth/100; 
    windowonepercenty = windowheight/100; 


		/*
			Surface Dimensions
		*/
		

			
			//The Surfaces
			
			var the_center = $(".surface.center");
			var the_left = $(".surface.left");
			var the_right = $(".surface.right");
			var the_top = $(".surface.top");
			
			// Settings Inputs
			
			setting_width = parseInt($("#setting-width").val());
			setting_height = parseInt($("#setting-height").val());
			setting_depth = parseInt($("#setting-depth").val());
			setting_stage_width = parseInt($("#setting-stage-width").val());
			setting_stage_height = parseInt($("#setting-stage-height").val());

			//Stage Sizes
			$(".stage").width(setting_stage_width + 1);
			//$(".stage").height(setting_stage_height);			
			
			// Width fix (for pure numbers)
			//$(".stage").width(stage_width);
			
			// Findings
			
			var combined_width = setting_width + setting_depth * 2;
			var combined_height = setting_height + setting_depth; 
			var stage_onepercent_x = setting_stage_width/combined_width; 
			var stage_onepercent_y = setting_stage_height/combined_height; 
			
			
			// Set Width
			TweenMax.set($(".surface.center, .surface.top"), {width: setting_width * stage_onepercent_x});
			
			// Set Depth
			TweenMax.set($(".surface.left, .surface.right"), {width: setting_depth * stage_onepercent_x});
			TweenMax.set($(".surface.top"), {height: setting_depth * stage_onepercent_x, left: setting_depth * stage_onepercent_x});
			
			// Set Height
			TweenMax.set($(".surface.left, .surface.right, .surface.center"), {height: setting_height * stage_onepercent_x});
			
			// Show Specs
			
			$(".surface").each(function(){
				var this_specs = $(this).find(".specs .size");
				var this_width = $(this).width();
				var this_height = $(this).height();
				this_specs.text(this_width + "x" + this_height);
			});
			
	
		/*
			Build room
		*/
	   
	  var perspective_hovers = 200;  
	  var perspective_value = 2400;  
	    
		TweenMax.set("#box", {
		    perspective: perspective_value
		});
		TweenMax.to("#box", 0.1, {scale: 1.12});
		TweenMax.set(".box", {
		    transformStyle: "preserve-3d"
		});

		TweenMax.set(".box div.top", {
				transformStyle: "preserve-3d",
		    transformOrigin: depth_y,
		    transformPerspective: perspective_value
		});
		TweenMax.set(".box div.bottom", {
				transformStyle: "preserve-3d",
		    transformOrigin: depth_y,
		    transformPerspective: perspective_value
		});
		TweenMax.set(".box div.left", {
				transformStyle: "preserve-3d",
		    transformOrigin: depth_x,
		    transformPerspective: perspective_value
		});
		TweenMax.set(".box div.right", {
				transformStyle: "preserve-3d",
		    transformOrigin: depth_x,
		    transformPerspective: perspective_value
		});	
		TweenMax.set(".box div.back", {
				transformStyle: "preserve-3d",
		    transformOrigin: depth_back,
		    transformPerspective: perspective_value
		});	
		TweenMax.set(".back", {
		    rotationY: 180
		});
		TweenMax.set("#box .right", {
		    rotationY: 270
		});
		TweenMax.set("#box .left", {
		    rotationY: 90
		});
		TweenMax.set("#box .top", {
		    rotationX: 90
		});
		TweenMax.set("#box .bottom", {
		    rotationX: 270
		});

 
	};
	
	adjustStage();
	
	$(window).resize(adjustStage);	

	$('.stage-settings input').on("change keyup", adjustStage);


});


	

$(function () {
		






		/*
			STAGE
		*/
	

		var socket = io();
		
		var gamma, gammaadjust, gammaadjusted, beta, betaadjust, betaadjusted;
		
		window.addEventListener('deviceorientation', function(event) {
			 
			gamma = event.gamma;
			beta = event.beta;
				
		
			sencitivity = 60;
			
			gammaadjust = gamma * sencitivity + 160;
			betaadjust = beta * 2 * sencitivity - 200;			
		
			// Imitate cursor with gyro
			
			mouse.x = -gammaadjust;
			mouse.y = -betaadjust;	
			
			socket.emit('socket gyro', {socket_x: mouse.x, socket_y: mouse.y});
		
		}, true);
		
		
		socket.on('socket gyro', function(data){
			mouse.x = data.socket_x + 10;
			mouse.y = data.socket_y;
			
			
			dx = mouse.x - cx;
		  dy = mouse.y - cy;
		
		  tiltx = (dy / cy) * 0.05;
		  tilty = -(dx / cx) * 0.05;
		  radius = Math.sqrt(Math.pow(tiltx, 2) + Math.pow(tilty, 2));
		  degree = (radius * 10);	
		
		  TweenLite.to(".box", .5, { transform: 'rotate3d(' + -tiltx + ', ' + -tilty + ', 0, ' + degree + 'deg)', ease: Power2.easeOut});
		  
			
		});
	

		
		/*
			Buttomns
		*/
		
		$(".button").on('touch click', function(){
			$(".button").removeClass("active");
			$(this).addClass("active");
		});	
		
		
		/*
			Manage Content
		*/
		$('.button.controller').click(function(){
			
			var launch_mode = $(this).attr("id");
      
      socket.emit('launch mode', launch_mode);
      
      $('#current').text('');
      
      
      
      
      return false;
    });
    
    socket.on('launch mode', function(launch_mode){

      
      // Empty divs
      $(".box .inner, body.agenda").empty();
      $(".book").empty(); 
      $("body").css("opacity", "1");
      $(".box div").css("background-color", "");
      
      
      //Reset timelines
      tl_global_odd.pause(0);
      tl_global_even.pause(0);
      tl_asa.pause(0);
      
      var open_case = launch_mode;
      
      console.log(open_case);
      
      
      // Refresh
      if(open_case == "#open-reset") {
	       
	       //if (!$("body").hasClass(".controller")){
		     	location.reload();  
	       //}	
	       
      }
      
      // Custom cases
      
      if(open_case == "#open-default") {
	      
		    /*
					Default content
				*/
				
				//Box
				$(".box div").css("background-color", "");
				$(".box .top .inner").append('<div class="placeholder" style="background-color: #000000;"><div class="placeholder default" style="background-image: url(../img/buzz.gif); opacity: 0.5;"></div></div>');

				// Walls
				tl_global_odd.play();
				tl_global_even.play();
				
				//Toilet
				$("body.toilet").append('<div class="toilet_bg" style="background-image: url(../img/buzz.gif); opacity: 0.5"></div>');
				
				//Agenda
				$("body.agenda").append("<h1>SURROUND YOURSELF WITH WHATEVER YOU WANT</h1>"); 

				//Wall
				$(".wall.left .book.one").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');
				$(".wall.left .book.two").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');
				$(".wall.left .book.three").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');				
				$(".wall.left .book.four").append('<div class="cover spin_cover" style="background-image: url(../img/buzz.gif);"></div>');				
				$(".wall.left .book.five").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');

				$(".wall.right .book.one").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');
				$(".wall.right .book.two").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');
				$(".wall.right .book.three").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');
				$(".wall.right .book.four").append('<div class="cover spin_cover" style="background-image: url(../img/buzz.gif);background-color: black;"></div>');
				$(".wall.right .book.five").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');
				
				//spin_cover.play();
				//tl_colours.play();
	     
      } else if (open_case == "#open-romain") {
	      	      
		    /*
					Romain
				*/	
				
				$("body.agenda").append("<h1>Romain Tardy</h1>"); 
				
				$(".box .top .inner").append('<div class="placeholder"><div class="placeholder default" style="background-image: url(../img/buzz.gif); background-color: black; opacity: 0.5"></div></div>');    
				
				tl_global_odd.play();
				tl_global_even.play();
	      
	    } else if (open_case == "#open-christian") {
			    
		    /*
					Christian
				*/			 
				
				$("body.agenda").append("<h1>Christian Lunden</h1>");   
				
					$(".wall .book").append('<div class="cover" style="background-image: url(../img/buzz.gif);"></div>');
					
					$(".box .top .inner, .box .left .inner, .box .right .inner").append('<div class="placeholder"><div class="placeholder default" style="background-image: url(../img/buzz.gif); opacity: 0.5"></div></div>');				  
		    
		  } else if (open_case == "#open-asa") { 
			  
		    /*
					Asa
				*/			
				
					$("body.agenda").append("<h1>Åsa Moum</h1>"); 
				
					//Room

					$(".box .top .inner").append('<div class="placeholder"><div class="placeholder default" style="background-image: url(../img/asa/ceiling.jpg); opacity: .8"></div></div>');
					
					$(".box .left .inner").append('<div class="placeholder"><div class="placeholder default" style="background-image: url(../img/asa/left.jpg); opacity: .8"></div></div>');
					$(".box .right .inner").append('<div class="placeholder"><div class="placeholder default" style="background-image: url(../img/asa/right.jpg); opacity: .8"></div></div>');
					$(".box .back .inner").append('<div class="placeholder"><div class="placeholder default" style="background-image: url(../img/asa/center.jpg); opacity: 1"></div></div>');
					
					//Wall
					$(".wall .book").append('<div class="cover" style="background-image: url(../img/asa/ceiling.jpg);"></div>');			
	  
					//tl_asa.play();
					
			} else if (open_case == "#open-vitali") { 
				
		    /*
					Vitali
				*/	
				
				$("body.agenda").append("<h1>Vitali Poluzhnikov</h1>");  
				
				
				$(".box .top .inner, .box .left  .inner, .box .right .inner").append('<div class="placeholder"><div class="placeholder default" style="background-image: url(../img/buzz.gif); opacity: 0.2"></div></div>');
				$(".book").append('<div class="cover" style="background-image: url(../img/buzz.gif); opacity: 0.5"></div>');
				 			
				tl_global_odd.play();
				tl_global_even.play();
					
			} else if (open_case == "#open-nothing") { 
				
				$("body:not(.controller)").css("opacity", "0");		
					
			}	     
      
    });
	
});	






