var socket = io();

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
		button.innerHTML = 'command-play';
		button.addEventListener('click', (event) => {
			socket.emit('play',experience);
		})
		list.appendChild(button);
		document.querySelector('#experiences').appendChild(list);
	}
}

play = (experience) => {
	socket.emit('state-update',{state:'loading',val:true});
	setTimeout(()=>{
		socket.emit('state-update',{state:'loading',val:false});
		socket.emit('state-update',{state:'playing',val:true});
	},3000);
}