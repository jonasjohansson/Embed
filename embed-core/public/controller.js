var socket = io();

display = (experiences) => {

	$experiences = document.querySelector('#experiences');

	while ($experiences.firstChild) {
	    $experiences.removeChild($experiences.firstChild);
	}

	for (let prop in experiences){
		let experience = experiences[prop];

		var $experience = document.createElement('div');

		$experience.setAttribute('data-title', experience.title);
		$experience.setAttribute('data-flags', experience.flags);
		$experience.setAttribute('data-format', experience.format);

		$experience.innerHTML = `
			<video poster="${experience.cover_image}" style="height: 100px;">
				<source src="${experience.cover_video}" type="video/mp4">
			</video>
			<h2>${experience.title}</h2>
			<span class="description">${experience.description}</span>
			<a href="${experience.author_url}"><span class="author">${experience.author}</span></a>`;

		$button = document.createElement('button');
		$button.innerHTML = 'command-play';

		$button.addEventListener('click', (event) => {
			socket.emit('play',experience);
		})

		$experience.appendChild($button);

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