(function ($, root, undefined) {

	$(function() {
		
		
		
		$(window).on('beforeunload', function() {
		    //$(window).scrollTop(0);
		});		
		
		$(document).ready(function() {
			
			// Fix sticky hovers
			
			var baseurl = "/danielblom/portfolio"
			
			//Enable Scrolling
				$("body").addClass("overflow_on");			
				
			/* Scroll Hack */
			
				var body = document.body, timer;
				
				window.addEventListener('scroll', function() {
				  clearTimeout(timer);
				  if(!body.classList.contains('disable-hover')) {
				    body.classList.add('disable-hover')
				  }
				  
				  timer = setTimeout(function(){
				    body.classList.remove('disable-hover')
				  },50);
				}, false);			
				
				
			
		
			//$("body").addClass("overflow_on");

			/*
				The Main Scroll Controller
			*/				
				
				var aqua_controller = new ScrollMagic.Controller({container: "body"});


			
			/*
				Generate dynamic window values
			*/
			
				var windowheight, windowwidth;
				var docHeight;
				var aboutwidth;
				var ismobile = false;
				
				function get_sizes(){				
					docHeight = $(document).height();
					windowheight = window.innerHeight;
					windowwidth = window.innerWidth;;
					aboutwidth = $(".about-overlay").width();
				}

				function check_scrollmagic(){				
					if(windowwidth < 640) {
						ismobile = true;			
					} else {
						console.log("desktop");
						ismobile = false;					
					}
					aqua_controller.update(true);
					console.log(ismobile);
				}				
				
				$(window).resize(function() {
					get_sizes();
					check_scrollmagic();
					$container.isotope('layout');
				});	
				get_sizes();
				check_scrollmagic();
				
				
				
				


			/*
				Menu Interactions
			*/					
	
				var menu_trigger = $(".menu-trigger");
				var menu_open = menu_trigger.find(".open");
				var menu_text = menu_trigger.find("span");
		
				var menu_underlay = $(".menu-underlay");
				var menu_menu =  menu_underlay.find(".menu");
				var menu_close = menu_underlay.find(".close");
		
				menu_trigger.on("mouseover touchstart", function(){
					TweenMax.to(menu_open, .3, {scale: 1.03});	
				});
				menu_trigger.on("mouseout touchend", function(){
					TweenMax.to(menu_open, .3, {scale: 1});	
				}); 
				
				menu_close.on("mouseover touchstart", function(){
					TweenMax.to($(this), .3, {scale: 1.03});	
				});
				menu_close.on("mouseout touchend", function(){
					TweenMax.to($(this), .3, {scale: 1});	
				}); 	
							
				menu_trigger.on("click tap", function(){					
					menu_underlay.addClass("menu-open");
					TweenMax.fromTo(menu_underlay, .3, {opacity: 0}, {opacity: 1, display: "block"});
				});	
					
				function closemenu(){
					TweenMax.to(menu_underlay, 0, {opacity: 0, display: "none"});
					menu_underlay.removeClass("menu-open");				
				}
				
				menu_close.on("click", function(){					
					closemenu();
				});				



			/*
				Welcome
			*/
			

				/* Twister */
				var twister_animation = new TimelineMax({repeat: -1});
				twister_animation.to($(".twister .wrapper"), .3, {y: -96, delay: 1.7})
				.to($(".twister .wrapper"), .3, {y: 0, delay: 1.7});
				//twister_animation.play();

				/* Scroller */
				var scroller_animation = new TimelineMax({repeat: -1});
				
				scroller_animation.to($(".scroller span"), 1, {y: 48})
				.to($(".scroller span"), 2, {y: 0});
				
				

			
			
			/*
				Scroller Click
			*/
				
				$(".scroller").on("click", function(){
					//TweenLite.to(window, 3, {scrollTo:{y:800}});		
				});
				
			
			
			
			/*
				Logo Scale
			*/
			
			
				$(window).scroll(function(){
				    var scrollPos = $(document).scrollTop();
				    
				    //Pin Logo
				    			    
					    if(scrollPos > (windowheight/2 - 35)) {
						    if((!$("header").hasClass("afterlock")) && (!$(".toggle-about").hasClass("active")) ){	
						    	$("header, .toggle-about").addClass("pinned");
						    }
					    } else {
						    if((!$("header").hasClass("afterlock")) && (!$(".toggle-about").hasClass("active")) ){	
								$("header, .toggle-about").removeClass("pinned");  
							}  
					    }
				    

					//Intro
					if(scrollPos > 10) {
						
						twister_animation.seek(0);
						twister_animation.pause();
						
						// hide scroller
						TweenMax.to(".scroller", .3, {y: 240, opacity: 0, display: "none"});
						scroller_animation.seek(0);
						scroller_animation.pause();
						
						$(".intro-gallery ").css("opacity", "1");
					
					} else {

						twister_animation.seek(0);
						twister_animation.play();
						
						// hide scroller
						TweenMax.to(".scroller", 1, {y: 0, opacity: 1, display: "block"});
						scroller_animation.seek(0);
						scroller_animation.play();
						
						$(".intro-gallery ").css("opacity", "0");
					}
				    
				    
				});
							

			


			/*
				Intro Gallery
				
			*/
			
				function getNonZeroRandomNumber(){
					var random = Math.round(Math.random()*198) - 99;
				    if(random==0) return getNonZeroRandomNumber();
				    return random;
				
				}
				
				var intro_animation;
				var intro_index = 1;
				$(".intro-gallery .wrap").each(function(intro_index){
					
					intro_index++;
					var this_wrap = $(this);
					var this_image = this_wrap.find("img");

					var random_x = 0;
					var random_y = 0;	
					var x_out = 0;
					var y_out = 0;	
					
					var speed_x = windowwidth;
					var speed_y = windowwidth/2;
					

					if(intro_index%4 == 1) {
						random_x = -speed_x;
						random_y = speed_y;	
						x_out = speed_x;
						y_out = -speed_y;					
					}
					
									
					if(intro_index%4 == 2) {
						random_x = speed_x;
						random_y = speed_y;
						x_out = -speed_x;
						y_out = -speed_y;						
					}	
						
					if(intro_index%4 == 3) {
						random_x = speed_x;
						random_y = -speed_y;	
						x_out = -speed_x;
						y_out = speed_y;														
					}
					
					if(intro_index%4 == 0) {
						random_x = -speed_x;
						random_y = -speed_y;
						x_out = speed_x;
						y_out = speed_y;						
					}	
					

					//Tween In
					var tween_in = new TimelineMax();
					tween_in.from(this_image, .3, {x: random_x, y: random_y, ease:Linear.easeNone})
					.to(this_image, .3, {x: x_out, y: y_out, ease:Linear.easeNone, zIndex: "=+20"});
					
					intro_animation = new ScrollMagic.Scene({triggerElement: this, triggerHook: 0.5, offset: -400, duration: 800})	
					.setTween(tween_in).addTo(aqua_controller);	

				});
				
				

		
			/*
				Pin Sections
			*/	
			

				// Filter	
				
				//var pin_filter = TweenMax.to(".filter", 0.5, {scale: 0.5, y: -40, transformOrigin: "50% 0%"});			
				
				if( ($("body.single .filters").length) ){

					var pin_filter = new ScrollMagic.Scene({
						triggerElement: ".filters",
						triggerHook: 0,
						offset: -69
					}).setPin(".filters").addTo(aqua_controller);	
	
					pin_filter.on("enter", function (event) {
						$(".home .colours").addClass("active");
						$("header").addClass("portfolio-mode");

					});
					
					pin_filter.on("leave", function (event) {
						$(".home .colours").removeClass("active");	
						$("header").removeClass("portfolio-mode");
					});
				}			

			/*
				Stop Scroll Hack
			*/


				
				    var scrollElement = $("body");

				    var stop_scroll_yes = function(){
		
						scrollElement.addClass("lock-screen");
						window.scrollTo(0,0);
						
						setTimeout(function() {
							scrollElement.removeClass("lock-screen");
							//window.scrollTo(0,0);
						}, 10);				        
				        	    
				    }
				    



			/*
				Welcome Leave
			*/
							
				if( $("#welcome-section").length ){
					var scale_logo = TweenMax.to(".twister", 0.5, {scale: 0.43, transformOrigin: "50% 50%", force3D:false});			
					
					var logo_zoom = new ScrollMagic.Scene({triggerElement: "#welcome-section", duration: "40%", triggerHook: 0})
					.setTween(scale_logo)
					.addTo(aqua_controller);
					
					
					// Hide Entire Welcome					
					var hide_intro = function() {
						$(".intro-gallery, .welcome").hide();
						$(".feed").addClass("cleared");
					
						$("header").addClass("super-pinned");
						$("header").addClass("afterlock");
						$(".filters").addClass("portfolio-page");
						
						TweenMax.fromTo($(".link-portfolio"), .3, 
							{display: "none", x: -8, opacity: 0, delay: 1},
							{x: 0, opacity: 1, display: "inline-block"}
						);	
						kill_intro.remove();	
						logo_zoom.remove();	
						intro_animation.remove();
						
						
						stop_scroll_yes();	
								
					}			
					
					var kill_intro = new ScrollMagic.Scene({triggerElement: "#filters-section", triggerHook: 0, offset: -70})
					.setTween(hide_intro)
					.addTo(aqua_controller);
											
				}	
				




			/*
				Portfolio – Filters
			*/	
			
			

				// Set Up Grid
				var $container = $('#isotope-list'); //The ID for the list with all the blog posts
				$container.isotope({ //Isotope options, 'item' matches the class in the PHP
					itemSelector : '.item', 
					percentPosition: true,
					//stagger: 100,
					transitionDuration: 300,
					masonry: {
						columnWidth: '.grid-sizer'
					}				
				});
				$container.isotope('layout');
				 
				

				// Custom Hide Reveal
				
				var active_category = $(".breadcrumb.active-category");
				var active_category_link = active_category.find("a");
				
				$.fn.hideReveal = function( options ) {
				  options = $.extend({
				    filter: '*',
				    scroll: 'yes'
				  }, options );
				  this.each( function() {
				    var $items = $(this).children();
				    var $visible = $items.filter( options.filter );
				    var $hidden = $items.not( options.filter );
				    		   
				    
				    // SHOW
				    $visible.removeClass("blurred");
				   
				    // HIDE
				    $hidden.addClass("blurred");
				    
					
					// SCROLL TO
					var scroll_action = options.scroll;
				
					if(scroll_action != "no") {
					    $container.find('.first').removeClass('first');
					    var the_first = $visible.first();			    
					    var first_offset = the_first.offset().top;    
					    
					    if(options.filter != "*") {
						    if(ismobile = false) {
					    		TweenLite.to(window, 1, {scrollTo:{y:first_offset - 236}});
					    	}
					    }
				    }
				    
				    $container.isotope('layout');
		   
				  });
				};

		 
				 
				//Add the class selected to the item that is clicked, and remove from the others
				var $optionSets = $('#filters'), $optionLinks = $optionSets.find('a');
	 
				$optionLinks.on("click tap", function(){
					var $this = $(this);
					

					//Get parameters
					var selector = $(this).attr('data-filter');
					var selector_name = $(this).attr('data-name');
					var selector_raw = $(this).attr('data-raw');
					var selector_type = $(this).attr('data-type');
					
					
					/*
						Top-Level Functions
					*/	
					
						function $classic_reset() {
							$container.isotope({ filter: '*'});
								
							// Hide Blurs
							$(".blur-filters").removeClass('relevant');		

							$category_reset();		
						}
						
						function $classic_filter() {
							$clear_all();	
							$container.isotope({ filter: selector });
							$this.addClass('selected');					

							//Add Breadcrumb
						
							// BREAD
							category_hash = false;
							bread_one = selector_raw;						
							$bread();	
							
							// HASH		
							location.hash = selector_raw;																
						}						

					
					/*
						Category-Level Functions
					*/		
									
						function $category_reset() {
							$container.isotope({ filter: '*'});
							$container.hideReveal({ filter: '*', scroll: "no"});		

							$this.removeClass('selected');	
							//$(".filters li a").removeClass('selected'); 
							$("#still-filter-trigger").removeClass("selected");	
							$("#films-filter-trigger").removeClass("selected");				
						}
					
									
						function $category_filter() {
							$clear_all();
							$container.isotope({ filter: '.stills'});
							$container.hideReveal({ filter: selector });	
							console.log("Filter – Blur");	
							$this.addClass('selected');	
							$("#still-filter-trigger").addClass("selected");
							
							// BREAD
							category_hash = true;
							bread_one = "Stills";
							bread_two = selector_raw;						
							$bread();	
							
							// HASH		
							location.hash = "stills+"+selector_raw;								
						}
										
	
	
					/*
						De-select Functions
					*/		
						
						var $optionSet = $this.parents('#filters');
						
						function $clear_all() {
							$optionSets.find('.selected').removeClass('selected');	
							//active_category.hide();	 
							//$("#still-filter-trigger").removeClass("selected");
							$(".filters li a").removeClass('selected'); 
							$bread_clear();	 		
						}
						function $clear_categories() {
							$optionSets.find('.categories.selected').removeClass('selected');
							$("#still-filter-trigger").removeClass("selected");	
							$("#films-filter-trigger").removeClass("selected");		
							$bread_clear();	 	
						}						


					
					/*
						Trigger – IF already selected
					*/	
					
						if ( $this.hasClass('selected') ) {
							
							// Check if it's classic or a blur type
							if(selector_type == "classic") {				
								$classic_reset();	
							} else {
								$category_reset();
								$clear_categories();
							}	
							
							return false;
						}
					
					
					/*
						Trigger – Fresh Select
					*/						

						// Check if it's classic or a blur type
						
						if(selector_type == "classic") {
							$clear_all();	
							$classic_reset();							
							$classic_filter();
							
							if(selector_raw == "stills") {
								$(".blur-filters").addClass('relevant');
							} else {
								$(".blur-filters").removeClass('relevant');
							}
														
						} else {
							$clear_categories();
							$category_filter();							
						}	

						
					return false;
				});		
				
				
				// Filter Hovers
				
				$("#still-filter-trigger").on("mouseenter touchstart", function(){
					//$(".blur-filters").show();	
					
					TweenMax.fromTo($(".blur-filters"), .3,
						{y: 70}, {display: "block", y: 0, opacity: 1}
					);
					TweenMax.to($(".filters"), .3,{height: 120});					

				});
					
				$(".filters").on("mouseleave", function(){
					TweenMax.to($(".blur-filters"), 0.3,{display: "none", y: 0});
					TweenMax.to($(".filters"), .3,{height: 70});
				});	
				
				$("#films-filter-trigger").on("mouseenter touchstart", function(){
					TweenMax.to($(".blur-filters"), 0.3,{display: "none", y: 0});
					TweenMax.to($(".filters"), .3,{height: 70});	
				});						
				
					
				
				//Click anywhere hack
				
				$('html').on("click", function(e) {                    
					if ( $('#filters a.categories').hasClass('selected') ) {
						
						$container.hideReveal({ filter: '*' });
						$(".filters li a.categories").removeClass('selected'); 
						
						$bread_clear();
							 
					}
				});
				

			/*
				THE BREAD APP
			*/	
				
				var bread_element = $(".bread-app");
				var bread_one, bread_two, bread_one_url, bread_two_url, bread_one_string, bread_two_string; 
				var category_hash = false;
				
				
				var $bread_clear = function(){
					bread_element.hide();
					bread_element.html(""); bread_element.attr("href","");	
					history.replaceState(null, null, ' '); 
				}
				
				var $bread = function(){
					//Clear
					
					bread_element.hide();
					bread_element.html(""); bread_element.attr("href","");
					
					
					if(ismobile == true) {
						return false;
					}
					
					
					
					//Check type
					
					if(category_hash == false) {
						
						//Simple Bread
						
						bread_one_string = '&nbsp;<span>→</span>&nbsp;';
						bread_one_string += '<a href="'+baseurl+'/#'+bread_one+'">';
						bread_one_string += bread_one;
						bread_one_string += '</a>';
						
						bread_element.append(bread_one_string);
						
					} else {
						
						//Double Bread	
						
						bread_one_string = '&nbsp;<span>→</span>&nbsp;';
						bread_one_string += '<a href="'+baseurl+'/#'+bread_one+'">';
						bread_one_string += bread_one;
						bread_one_string += '</a>';

						bread_two_string = '&nbsp;<span>→</span>&nbsp;';
						bread_two_string += '<a href="'+baseurl+'/#'+bread_one+'+'+bread_two+'">';
						bread_two_string += bread_two;
						bread_two_string += '</a>';
						
						bread_element.append(bread_one_string + bread_two_string);
					}
					
					//Show it
					bread_element.show();
					
					TweenMax.staggerFromTo(bread_element.find("a, span"), .3, {x: -8, opacity: 0}, {x: 0, opacity: 1, delay: .1}, 0.3);
					
				}
				
				
			/*
				Expand BC
			*/
			
				$(".single header p").on("mouseenter", function(){
					$(".expand-bc").css("display", "none");
					$(".expand-bc").css("opacity", "0");
					TweenMax.set($(".collapsed-info"), {opacity: 1});
					TweenMax.to($(".collapsed-info"), 1, {width: "auto", display: "inline-block"});
					TweenMax.staggerFromTo($(".collapsed-info").find("a, span"), .3, {opacity: 0}, {opacity: 1}, 0.1);
				});	
				$(".single header p").on("mouseleave", function(){
					TweenMax.set($(".collapsed-info"), {opacity: 0});
					TweenMax.to($(".collapsed-info"), .5, {width: 0, display: "none"});
					TweenMax.staggerTo($(".collapsed-info").find("a, span"), .3, {opacity: 0}, 0.1);
					$(".expand-bc").css("display", "inline-block");
					setTimeout(function(){
					  $(".expand-bc").css("opacity", "1");
					}, 700);						
					
				});					
				
				
			/*
				Filters Hash + Same Category Parameter
			*/	
			
			
				var hash;
				
				if(window.location.hash) {
					
					
			    	hash = window.location.hash.substring(1); //Puts hash in variable, and removes the # character
					
					var hash_one, hash_two;
					
					if(hash.includes("+")) {
						category_hash = true;
						hash_one = hash.toString().split("+")[0];
						hash_two = hash.toString().split("+")[1];						
					} else {
						category_hash = false;
						hash_one = hash;	
					}
					
					if(category_hash == true) {
						
						$container.hideReveal({ filter: "."+hash_two, scroll: "no"});
						var hash_selector_two = $('a[data-raw="'+hash_two+'"]');
						hash_selector_two.addClass('selected');	
						
						// BREAD
						bread_one = hash_one;
						bread_two = hash_two;
						$bread();
						
					} else {
						
						$container.isotope({ filter: "."+hash_one });		
						var hash_selector = $('a[data-filter=".'+hash_one+'"]');
						hash_selector.addClass('selected');	

						// BREAD
						bread_one = hash_one;
						$bread();		
						
														
					}
	
				}
				

			/*
				Pre-load filters on single pages
			*/	
			
			if($("body").hasClass("single")) {
				var this_single_type = $("header").attr("single-type");
				var this_single_cat = $("header").attr("single-category");
				
				if(this_single_type.length ){
					
					// Select
					$container.isotope({ filter: "."+this_single_type });
					$("#filters a[data-raw='"+this_single_type+"']").addClass("selected");
					
					
					if(this_single_cat.length ){

						$container.hideReveal({ filter: "."+this_single_cat, scroll: "no"});	
						$("#filters a[data-raw='"+this_single_cat+"']").addClass("selected");
						
						// BREAD
						category_hash = true;
						bread_one = this_single_type;
						bread_two = this_single_cat;						
						$bread();	
						
						// HASH		
						if(history.pushState) {
							history.pushState(null, null, "#stills+"+this_single_cat);
						} else {
						    location.hash = "stills+"+this_single_cat;
						}						
						
												
					} else {

						// BREAD
						category_hash = false;
						bread_one = this_single_type;						
						$bread();	
						
						// HASH		
						location.hash = this_single_type;
													
					}	
					

										
				}	
				
					
				
			}

			


			/*
				Colour Picker
			*/	
				
				
				$(".colours .option").on("mouseenter", function(){
					var this_hex = $(this).attr("data-colour");
					TweenMax.to($("body, .welcome, .single-project, section.feed"), 1, {backgroundColor: this_hex});			
				});


				
			/*
				Portfolio – Zoom-in effect
			*/				
			
										
				$("#isotope-list .item").each(function(){
					
					var this_wrap = $(this);	
					var this_image = this_wrap.find("img");	
					var this_ratio = this_wrap.find(".ratio-loader");	
					
					
					var this_video = this_wrap.find("video");
					
					//Cal height
					//var image_height = this_image.height(); 	
					
					// Get php height
					var this_height = this_ratio.outerHeight(); 
					
					var this_scale_ratio = (this_height-112)/this_height; 
				
					
					//Cal height
					var this_video_height = this_video.height(); 	
					var this_video_scale_ratio = (this_video_height-112)/this_video_height+0.02; 						

					//Update vars
					$(window).resize(function() {
						this_height = this_ratio.outerHeight(); 
						this_scale_ratio = (this_height-112)/this_height; 
						
						this_video_height = this_video.height(); 	
						this_video_scale_ratio = (this_video_height-112)/this_video_height+0.02; 							
					});		
					
					//Tween In
					//var tween_in = new TimelineMax().from(this_wrap, 0.1, {opacity: 0}).set(this_image, {opacity: 1}).from(this_wrap, .7, {y: 140});
					var tween_in = new TimelineMax().set(this_image, {opacity: 1}).fromTo(this_wrap, .7, {y: 140, opacity: 0}, {y: 0, opacity: 1});
					
					new ScrollMagic.Scene({triggerElement: this, triggerHook: 0.75, reverse:false})	
					.setTween(tween_in).addTo(aqua_controller);	
					
					
					// Hover effect
					var this_zoom = this_wrap.find(".hover-plus");
					
					if(ismobile == false) {
						
						if(this_image.length ){
							if(this_image.hasClass("zoomable")) {			
								this_image.on("mouseenter", function(){
									TweenMax.to(this_image, 0.3, {scale: this_scale_ratio});				
								});
							}
						}
							
						if(this_video.length ){
							this_video.on("mouseenter", function(){
								TweenMax.to(this_video, 0.3, {scale: this_video_scale_ratio});
								setTimeout(function(){
								  this_video.get(0).play();	
								}, 10);													
							});	
						}				
						this_wrap.on("mouseleave", function(){
							//this_zoom.hide();	
							if(this_image.hasClass("zoomable")) {
								TweenMax.to(this_image, .3, {scale: 1});
							}
							if(this_video.length ){
								TweenMax.to(this_video, .3, {scale: 1});
								this_video.get(0).pause();
							}	
						});	
						
						
					}	
					

										
											
					
				});	
				

			/*
				Portfolio Items
			*/

				$("#isotope-list-single .item").each(function(){
					
					var this_wrap = $(this);
					var this_image = this_wrap.find("img");	
					
					
					//this prev
					var this_prev = this_wrap.prev();
					if(
						(this_prev.hasClass("grid-size-m") && this_wrap.hasClass("grid-size-l")) ||
						(this_prev.hasClass("grid-size-l") && this_wrap.hasClass("grid-size-l")) ||
						(this_prev.hasClass("grid-size-l") && this_wrap.hasClass("grid-size-m"))
					) {
						this_wrap.css("margin-top", "0");	
					}
					
					//Tween In
					var tween_in = new TimelineMax().set(this_image, {opacity: 1}).fromTo(this_wrap, .7, {y: 140, opacity: 0}, {y: 0, opacity: 1});
					
					new ScrollMagic.Scene({triggerElement: this, triggerHook: 0.75, reverse:true})	
					.setTween(tween_in).addTo(aqua_controller);	

				});						
				



			/*
				Toggle About
			*/				
							
				
			$(".toggle-about").on("click tap", function(){
				var toggler = $(this);
				var spinner = toggler.find(".wrap");
				var about_module = $(".about-overlay");
				var about_inner = about_module.find(".maxwidth");
			
				
				if(toggler.hasClass("active")) {

					$("body").addClass("overflow_on");
					
					TweenMax.to(spinner, 0.3, {rotation: 0});
					
					
					TweenMax.to(about_module, .5, {y: -windowheight, display: "none"});

					toggler.removeClass("active");


				} else {
					toggler.addClass("active");
					$("body").removeClass("overflow_on");
					TweenMax.to(spinner, 0.3, {rotation: 45});
					TweenMax.fromTo(about_module, .5, {y: -windowheight}, {y: 0, display: "block"});

				}
			});				
				
				
				
			/*
				footer logo
			*/	
			
				if( $(".logo-footer").length ){
				
					var foooter_out = TweenMax.fromTo(".logo-footer", 0.5, {scale: 1, opacity: 0}, {scale: 0.5, opacity: 1});			
					new ScrollMagic.Scene({
						triggerElement: "#footer-section",
						triggerHook: 1,
						offset: 120
					}).setTween(foooter_out).addTo(aqua_controller);	
				}


				
			/*
				Player
			*/	
			
			
			
				$(".video-id").each(function(){
					
					var this_player = $(this);
					var this_plyr = this_player.find(".js-player");
					var this_parent = this_player.parent();
					var this_controls = this_player.find(".video-controls");
					var this_id = this_player.attr("id");
					
					// Cover only
					var this_info = this_player.siblings(".info-wrap");
					
					
					// Set up player api
					var plyr_object = new Plyr(this_plyr, {
						controls: [],	
						fullscreen: {
						    enabled: true,
						    fallback: true,
						    iosNative: true
						}					
					});
					
					//Find preview
					var this_preview = this_player.find(".video-preview");
					
					
					//Find dynamic controls
					var this_play = this_player.find(".play-button");
					var this_pause = this_player.find(".pause-button");
					var this_replay = this_player.find(".replay-button");
					var this_full = this_player.find(".fullscreen-button");
					var this_full_close = this_player.find(".fullscreen-close");
					
					
					var hasBeenPaused = false;
					var is_playing = false;	
					
					//Play
					
					
					function $play() {
						plyr_object.play();
						this_preview.hide();
						
						this_play.hide();	
						this_pause.show();
						this_full.show();	
						console.log("playing");
						
						this_info.hide();	
						
						is_playing = true;					
					}
					
					// Mousemove
					
					 $(function() {
					    var timer;
					    var fadeInBuffer = false;
					    $(document).mousemove(function() {
					        if (!fadeInBuffer) {
					            if (timer) {
					                console.log("clearTimer");
					                clearTimeout(timer);
					                timer = 0;
					            }
					
					            console.log("fadeIn");
					            $('html').css({
					                cursor: ''
					            });
					        } else {
					            this_player.css({
					                cursor: 'default'
					            });
					            this_controls.show();
					            fadeInBuffer = false;
					        }
					
					
					        timer = setTimeout(function() {
					            console.log("fadeout");
					            
					            if(is_playing == true) {
						            this_player.css({cursor: 'none'});
						            this_controls.hide();	
								}
					            fadeInBuffer = true;
					        }, 1000)
					    });
					    this_player.css({ cursor: 'default'});
					    this_controls.show();
					});					


													
					
					this_play.on("click tap", function(){
						$play();
						hasBeenPaused = false;
						this_pause.css("opacity", "1");
					});
					
					//Full
					this_full.on("click tap", function(){
						
						console.log("go fs");
						plyr_object.fullscreen.enter();
						//this_preview.hide();
						
						//this_full.hide();	
						//this_full_close.show();	
					});					
					
					//Pause
					
					function $pause() {
						plyr_object.pause();
						this_info.show();
						this_pause.hide();	
						this_play.show();
						this_full.hide();	
						is_playing = false;			
					}	
					
								
					this_pause.on("click tap", function(){
						$pause();
						hasBeenPaused = true;
					});					
					
					//Ended
					plyr_object.on('ended', function(event) {
						this_pause.hide();
						this_replay.show();
						this_preview.show();	
						this_info.show();
						this_full.hide();
						is_playing = false;	
					});	
					
					//Replay
					this_replay.on("click tap", function(){
						plyr_object.restart();
						plyr_object.play();
						this_preview.hide();
						
						this_replay.hide();
						this_play.hide();	
						this_pause.show();
						this_info.hide();
						this_full.show();
						is_playing = true;	
					});		
					
					
					//Show-hide Controls
					this_parent.on("mouseenter", function(){
						this_controls.show();	
					});	
					this_parent.on("mouseleave", function(){
						this_controls.hide();	
					});	
					
				
					// Play/Pause main video on scroll
					var hasBeenTrigged = false;
					plyr_object.on('playing', event => {
						if(this_id == "video-main") {
	
							$(function(){
							    
							    $(window).on('scroll', function() {
							        if ($(this).scrollTop() >= 100 && !hasBeenTrigged) {
										$pause();   
																	        
							            hasBeenTrigged = true;
							        } 	
							        if ($(this).scrollTop() <= 99 && hasBeenTrigged) {
										if (!hasBeenPaused) {
											$play();
										}
							            
							            hasBeenTrigged = false;
							        } 							        			        
							    });
							});
												
						}
						console.log(hasBeenPaused);
					});
			
				});	
		

				
				
				
			/*
				Window ready for scrolling
			*/
			
				$(window).on('load', function () {
					TweenMax.to(".intro-header", 1, {opacity: 1, y: 0, delay: 0.1});
					$container.isotope('layout');
					get_sizes();
					check_scrollmagic();				
		
					// Show Scroller
					$(".scroller").show();
					scroller_animation.play();
					twister_animation.play();

					//Enable Scrolling
					$("body").addClass("overflow_on");
					
				});
							
							
		});
		
	});
	              
})(jQuery, this);



