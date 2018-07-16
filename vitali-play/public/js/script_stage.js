$(function () {
  var socket = io();
  $('form').submit(function(){
    socket.emit('chat message', $('#m').val());
    $('#m').val('');
    return false;
  });
  socket.on('chat message', function(msg){
    $('#messages').append($('<li>').text(msg));
  });
  
  
	/*
		Gyroscope Values
	*/	
	
	if(window.DeviceOrientationEvent) {
		
	
		var cursor = { x: 0, y: 0 };
		
		var gamma, beta;
		
		window.addEventListener('deviceorientation', function(event) {
			 
			var gamma_output = event.gamma;
			var beta_output = event.beta;
			
			// send data over the socket
			socket.emit('acceleration', {'s_gama':gamma_output, 's_beta':beta_output});

		
	
		}, true);
	
				
	} 		    
  
  
});

function lenticularEffects() {
  
  var max_opacity = 1;
  
  /* 
    Run 3D Tilting
  */  
  
  socket.on('acceleration', function(data){
		gamma = event.gamma;
		beta = event.beta;
		dx = mouse.x - cx;
		dy = mouse.y - cy;
  });		  
  
  //dx = mouse.x - cx;
  //dy = mouse.y - cy;
  
	if(($("body").hasClass("page-id-127")) || ($("body").hasClass("page-id-140"))) {
		var intensity_x = 1;
		var intensity_y = 5;	
	} else {
		var intensity_x = 0.15;
		var intensity_y = 0.15;	
	}
	
  tiltx = (dy / cy) * intensity_y;
  tilty = -(dx / cx) * intensity_x;
  radius = Math.sqrt(Math.pow(tiltx, 2) + Math.pow(tilty, 2));
  degree = (radius * 10);
	
	//if($("body").hasClass("home")) {
	  if ($(window).scrollTop() < cy){
	  	//TweenLite.to(".box", .5, { transform: 'rotate3d(' + -tiltx + ', ' + -tilty + ', 0, ' + degree + 'deg)', ease: Power2.easeOut});
	  }
  //} 
  //TweenLite.to("#box", 1, {x: -xpercent,y: -ypercent,ease: Power2.easeOut});  

}

		  
		  
		  