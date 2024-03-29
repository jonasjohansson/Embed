var experiences;
var rooms;
var selectedExperience;

document.addEventListener('click', e => {
    if (e.target.parentNode === document) return;

    var node = null;
    if (e.target.hasAttribute('data-action')) {
        node = e.target;
    } else if (e.target.parentNode.hasAttribute('data-action')) {
        node = e.target.parentNode;
    } else return;

    const action = node.getAttribute('data-action');
    const data = node.getAttribute('data-data') || '';

    if (selectedExperience !== undefined && selectedExperience !== null) {
        if (action === 'play') {
            let slug = selectedExperience.slug;
            if (slug !== 'default' && slug !== 'welcome') {
                if (!confirm('You will loose your current progress, OK?')) return;
            }
        }
    }

    console.log(e.target.nodeName, action, 'was clicked!');

    socket.emit(action, data);
});

setState = (name, state) => {
    console.log(name, state);
    document.documentElement.className = state ? name : '';
    // document.documentElement.classList.toggle(name, state);
};

trim = str => {
    return str.replace(/\s+/g, '-').toLowerCase();
};

removeChildren = el => {
    while (el.firstChild) {
        el.removeChild(el.firstChild);
    }
};

/* triggered when system is initiated */

socket.on('update', data => {
    console.log(`Experiences: ${data.experiences}`);
    console.log(`Rooms: ${data.rooms}`);
    experiences = data.experiences;
    rooms = data.rooms;
    display(experiences);
});

socket.on('reset', data => {
    setup();
    setState('welcome', true);
});

/* enter the experience */

socket.on('enter', data => {
    enter();
    socket.emit('stop');
    setState('experiences', true);
});

socket.on('error', data => {
    socket.emit('state-update', { name: 'error', state: true });
});

socket.on('play', id => {
    selectedExperience = experiences[id];
    play(selectedExperience);
    console.log('Experience:', selectedExperience.title, 'is loading…');
});

socket.on('stop', data => {
    stop();
    selectedExperience = undefined;
});

socket.on('state-update', data => setState(data.name, data.state));


// Interactive
socket.on('arrow-right', data => {
	console.log("arrow-right");
});
socket.on('arrow-left', data => {
	console.log("arrow-left");
});
socket.on('arrow-up', data => {
	console.log("arrow-up");
});
socket.on('arrow-down', data => {
	console.log("arrow-down");
});