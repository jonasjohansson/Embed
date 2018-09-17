var socket = io();

// const isMobile = isMobileDevice();

// document.body.classList.toggle('isMobile',isMobile);

socket.on('update', function (data) {
	// if (isMobile)
		display(data);
});

// fetch('http://localhost:3000/experiences.json')
// 	.then(function(response) {
// 		return response.json();
// 	})
// 	.then(function(data) {
// 		display(data);
// 	});

display = (experiences) => {
	for (let prop in experiences){
		let list = document.createElement('ul');
		let experience = experiences[prop];
		for (let prop in experience){
			let item = experience[prop];
			let listItem = document.createElement('li');
			listItem.innerHTML = item;
			list.appendChild(listItem);
		}
		let button = document.createElement('button');
		button.innerHTML = 'command-play-this';
		button.addEventListener('click', (event) => {
			socket.emit('selected',experience);
			load(experience);
		})
		list.appendChild(button);
		document.querySelector('#experiences').appendChild(list);
	}
}

load = (experience) => {
	document.body.classList.add('loading');
	console.log('Loading',experience.title)
	setTimeout(()=>{
		document.body.classList.remove('loading');
		console.log('Loading complete')
	},1000);
}

// function isMobileDevice() {
//     return (typeof window.orientation !== "undefined") || (navigator.userAgent.indexOf('IEMobile') !== -1);
// };