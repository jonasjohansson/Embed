var socket = io();

// const isMobile = isMobileDevice();

// document.body.classList.toggle('isMobile',isMobile);

// fetch('http://localhost:3000/experiences.json')
// 	.then(function(response) {
// 		return response.json();
// 	})
// 	.then(function(data) {
// 		display(data);
// 	});

socket.on('update', function (data) {
	display(data);
});

socket.on('load', function (data) {
	load(data);
});

display = (experiences) => {
	let ol = document.querySelector('#experiences');
	for (let prop in experiences){
		let experience = experiences[prop];
		let li = document.createElement('li');
		li.innerHTML = experience.title;
		li.addEventListener('click', (event) => {
			load(experience);
			socket.emit('selected', experience);
		})
		ol.appendChild(li);
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