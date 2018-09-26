var socket = io();

display = (experiences) => {

	$experiences = document.querySelector('#experiences');

	while ($experiences.firstChild) {
	    $experiences.removeChild($experiences.firstChild);
	}

	for (let prop in experiences){
		let experience = experiences[prop];

		var $experience = document.createElement('li');

		$experience.setAttribute('data-title', experience.title);
		$experience.setAttribute('data-flags', experience.flags);
		$experience.setAttribute('data-format', experience.format);	

		// Overview
		var $experience_overview = document.createElement('div');
		
		$experience_overview.setAttribute("class", "experience_overview");			
		$experience_overview.innerHTML = `
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
				
			</div>`;
		
		$experience.appendChild($experience_overview);	

		// Details	
		var $experience_details = document.createElement('div');		
		$experience_details.setAttribute("class", "experience_details");					
		$experience_details.innerHTML = `
			<div class="inner">
				<h3>Credits</h3>
				<a href="${experience.author_url}">
					<span class="author">${experience.author}</span>
				</a>
			</div>`;
		
		$experience.appendChild($experience_details);	
		
		// Experience controls
		var $experience_controls = document.createElement('div');		
		$experience_controls.setAttribute("class", "nav-bottom");					


		$experience_details.appendChild($experience_controls);
		
		
		// Button
		$button = document.createElement('button');
		//$button.outerHTML = `<div class="nav-bottom"></div>`;
		$button.innerHTML = `<i class="icon-play"></i><span>Play</span>`;
		$button.setAttribute('class', "large align-middle");
		$button.setAttribute('data-action', "command-play-this");


		$button.addEventListener('click', (event) => {
			socket.emit('play',experience);
		})
		
		$experience_controls.appendChild($button);
		
		// Wrap them all up
		$experiences.appendChild($experience);
	}
}

play = (experience) => {
	socket.emit('state-update',{state:'loading',val:true});
	setTimeout(()=>{
		socket.emit('state-update',{state:'loading',val:false});
		socket.emit('state-update',{state:'playing',val:true});
	},3000);
}

createExperience = (experience) => {
}