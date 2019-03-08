var socket = io();

$volume_slider = document.querySelector('#volume-slider');

setup = () => {};
enter = () => {};
reset = () => {};

display = experiences => {
	$experiences = document.querySelector('#experiences');

	removeChildren($experiences);

	for (let prop in experiences) {
		if (prop === 'default' || prop === 'welcome') continue;

		let experience = experiences[prop];
		let $experience = document.createElement('div');

		$experience.classList.add('experience');
		$experience.setAttribute('data-slug', trim(experience.title));

		var description = experience.description || '…';
		var author = experience.author || '…';

		// $experience.setAttribute('data-title', experience.title);
		// $experience.setAttribute('data-flags', experience.flags);
		// $experience.setAttribute('data-format', experience.format);

		let cover = ($experience.innerHTML = `
			<div>
				<h2>${experience.title}</h2>
				<a href="${experience.author_url}">
					<span>${author}</span>
				</a>
				<p>${description}</p>
			</div>
			<div>
				<button data-action="play" data-data="${prop}">play</button>
				<button data-action="stop">stop</button>
			</div>
			<video poster="${experience.url}/cover.png" src="${experience.url}/cover.mp4" type="video/mp4">
			</video>`);

		$experiences.appendChild($experience);
	}
};

play = experience => {
	stop();
	document.querySelector(`[data-slug=${trim(experience.title)}]`).classList.add('playing');
};

stop = () => {
	for (let el of document.querySelectorAll('.playing')) el.classList.remove('playing');
};

socket.on('volume-initial', volume_initial => {
	$volume_slider.value = volume_initial;
});

$volume_slider.addEventListener('change', e => {
	var volume_new = e.target.value;
	socket.emit('volume-new', volume_new);
});
