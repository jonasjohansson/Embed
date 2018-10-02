var socket = io();

$volume_slider = document.querySelector('#volume-slider');

setup = () => {};
enter = () => {};

display = experiences => {
	$experiences = document.querySelector('#experiences');

	removeChildren($experiences);

	for (let prop in experiences) {
		if (prop === 'default' || prop === 'welcome') continue;

		let experience = experiences[prop];
		let $experience = document.createElement('div');

		$experience.setAttribute('data-slug', experience.slug);
		// $experience.setAttribute('data-title', experience.title);
		// $experience.setAttribute('data-flags', experience.flags);
		// $experience.setAttribute('data-format', experience.format);

		$experience.innerHTML = `
			<video poster="${experience.cover_image}">
				<source src="${experience.cover_video}" type="video/mp4">
			</video>
			<h2>${experience.title}</h2>
			<div>
				<a href="${experience.author_url}">
					<span>${experience.author}</span>
				</a>
			</div>
			<p>${experience.description}</p>
			<button data-action="play" data-data="${prop}">play</button>
			<button data-action="stop">stop</button>`;

		$experiences.appendChild($experience);
	}
};

play = experience => {
	for (let el of document.querySelectorAll('.selected'))
		el.classList.remove('selected');
	document
		.querySelector(`[data-slug=${experience.slug}]`)
		.classList.add('selected');
};

stop = () => {
	document.querySelector('.selected').classList.remove('selected');
};

socket.on('volume-initial', volume_initial => {
	$volume_slider.value = volume_initial;
});

$volume_slider.addEventListener('change', e => {
	var volume_new = e.target.value;
	socket.emit('volume-new', volume_new);
});
