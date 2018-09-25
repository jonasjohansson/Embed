var socket = io();

display = (experiences) => {
	for (let prop in experiences){
		let experience = experiences[prop];

		var $experience = document.createElement('li');

		$experience.setAttribute('data-title', experience.title);
		$experience.setAttribute('data-flags', experience.flags);
		$experience.setAttribute('data-format', experience.format);	


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

				
		var $experience_details = document.createElement('div');
		
		$experience_details.setAttribute("class", "experience_details");					
		$experience_details.innerHTML = `<a href="${experience.author_url}"><span class="author">${experience.author}</span></a>`;


		$experience.appendChild($experience_details);
		
		$button = document.createElement('button');
		$button.innerHTML = 'command-play';
		
		$button.addEventListener('click', (event) => {
			socket.emit('play',experience);
		})
				
		$experience_details.appendChild($button);
		document.querySelector('#experiences').appendChild($experience);
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