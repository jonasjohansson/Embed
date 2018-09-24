socket.on('update', function (data) {
    display(data);
});

socket.on('state-update', function (data) {
    setState(data.state, data.val);
});

socket.on('play', function (data) {
    play(data);
});

socket.on('stop', function (data) {
    stop(data);
});

const buttons = document.querySelectorAll('button');

for (let button of buttons){
    button.addEventListener('click', (event) => {
        switch (button.id){
            case 'command-stop':
                socket.emit('stop');
            break;
        }
    });
}

stop = () => {
    socket.emit('state-update',{state:'playing',val:false});
}

setState = (state, val) => {
    document.body.classList.toggle(state, val);
    console.log(state,val);
}