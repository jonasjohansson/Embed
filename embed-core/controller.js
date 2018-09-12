window.onload = () => {

	var socket = io();
	
	socket.on('init', function (data) {
		fetch('./experiences.json').then(response => {
			return response.json();
		}).then(data => {
			display(data);
		}).catch(err => {
			console.error(err);
		});
	});

	display = (experiences) => {
		for (let prop in experiences){
			let experience = experiences[prop];
			console.log(experience);
		}
	}

	socket.emit('load', { data: 'hello world' });
}