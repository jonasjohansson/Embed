window.onload = () => {

	var socket = io('/controller');

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
	
	display = (experiences) => {
		let ol = document.createElement('ol');
		document.body.appendChild(ol);
		for (let prop in experiences){
			let experience = experiences[prop];
			let li = document.createElement('li');
			li.innerHTML = experience.title;
			li.addEventListener('click', (event) => {
				console.log(experience);
				socket.emit('load', experience);
			})
			ol.appendChild(li);
		}
	}

}