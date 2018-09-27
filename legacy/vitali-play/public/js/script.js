var stage_width, stage_height, setting_width, setting_height, setting_depth, setting_stage_width, setting_stage_height, setting_stage_fit;


$(document).ready(function() {
	

	// Responsive Adaptation
	
	function adjustStage() {
	
		
		// Generate Dynamic Variables
		
		windowwidth = window.innerWidth;
		windowheight = window.innerHeight;
	

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
			setting_proj_width = parseInt($("#setting-proj-width").val());
			setting_proj_height = parseInt($("#setting-proj-height").val());
			
			
		
			
			// Findings			
			var combined_width = setting_width + setting_depth * 2;
			var combined_height = setting_height + setting_depth; 
			
			var stage_onepercent_x = setting_proj_width/combined_width; 
			var stage_onepercent_y = setting_proj_height/combined_height; 
			
			// Find Ratios
			var allowed_ratio = setting_proj_width/setting_proj_height;
			
			var set_ratio_center = setting_width/setting_height;
			var set_ratio_sides = setting_depth/setting_height;
			var set_ratio_top = setting_width/setting_depth;
			
			
			// Adjusted ratios to the center projector

			if((allowed_ratio > set_ratio_center) || (set_ratio_center < 1)) {
				
				// Unsafe
				var set_onepercent = setting_proj_width/setting_height/allowed_ratio; 
				var set_onepercent_z = setting_proj_width/setting_height/allowed_ratio; 
				
				// Output values
				var the_width = setting_width * set_onepercent;
				var the_height = setting_height * set_onepercent;
				var the_depth = setting_depth * set_onepercent;
			} else {

				// Safe
				var set_onepercent = setting_proj_height/setting_width*allowed_ratio; 
				var set_onepercent_z = setting_proj_height/setting_depth*allowed_ratio; 
				
				// Output values
				var the_width = setting_width * set_onepercent;
				var the_height = setting_height * set_onepercent;
				var the_depth = setting_depth * set_onepercent;								
			}
			
			
			
			//Stage Sizes - width fix (for pure numbers)
			$(".stage").width(the_width + the_depth * 2 + 3);
			
			// Set Width
			TweenMax.set($(".surface.center, .surface.top, .surface.y-panorama"), {width: the_width});

			// Set Height
			TweenMax.set($(".surface.left, .surface.right, .surface.center, .surface.x-panorama"), {height: the_height});
			
			// Set Depth
			TweenMax.set($(".surface.left, .surface.right"), {width: the_depth});
			TweenMax.set($(".surface.top"), {height: the_depth, left: the_depth});

			// Set X-Panorama
			TweenMax.set($(".surface.x-panorama"), {width: the_width + the_depth * 2, top: the_depth});
			
			// Set Y-Panorama Width
			TweenMax.set($(".surface.y-panorama"), {height: the_height + the_depth, left: the_depth});


			// Generate Specs	
	
			$(".surface").each(function(){
				var this_specs = $(this).find(".specs .size");
				var this_width = $(this).width();
				var this_height = $(this).height();
				this_specs.text(this_width + "x" + this_height);
			}); 
	};
	
	adjustStage();
	
	$(window).resize(adjustStage);	

	$('.stage-settings input').on("change keyup", adjustStage);

});



	

$(function () {
		

		/*
			Stage Settings
		*/
		
		$('#setting-show-guides').val($(this).is(':checked'));
		$('#setting-show-guides').change(function() {
        if(this.checked) {
					$(".stage").addClass("specs_on");
        } else {
	      	$(".stage").removeClass("specs_on");  
        }       
    });


		/*
			STAGE
		*/
	

		var socket = io();
		

		
		/*
			Manage Content – TEMP
		*/
		$('.button').click(function(){
			
			var launch_mode = $(this).attr("id");
      
      socket.emit('launch mode', launch_mode);
      
    });
    
    socket.on('launch mode', function(launch_mode){

      // Empty divs
      $(".box .inner, body.agenda").empty();
      $(".book").empty(); 
      $("body").css("opacity", "1");
      $(".box div").css("background-color", "");
      
      
      //Reset timelines
      var open_case = launch_mode;
      
  
      // Refresh
      if(open_case == "#open-reset") {

		     	location.reload();  

      }      
    });
    
    

});	






