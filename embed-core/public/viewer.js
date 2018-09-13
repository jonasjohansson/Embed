window.onload = () => {

	var socket = io('/viewer');

	socket.on('load', (data)=>{
		document.body.classList.add('loading');
		setTimeout(()=>{
			document.body.classList.remove('loading');
		},2000);

	});
}