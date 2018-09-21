var socket = io();

socket.on('update', function (data) {
	display(data);
});

socket.on('state-update', function (data) {
	setState(data.state, data.val);
});

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
	socket.emit('state-update',{state:'loading',val:true});
	setTimeout(()=>{
		socket.emit('state-update',{state:'loading',val:false});
		console.log('Loading complete')
	},1000);
}

setState = (state, val) => {
	document.body.classList.toggle(state, val);
}