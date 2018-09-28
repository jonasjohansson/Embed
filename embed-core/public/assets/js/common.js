var experiences;
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

    if (action === 'play' && selectedExperience !== undefined) {
        let slug = selectedExperience.slug;
        if (slug !== 'default' && slug !== 'welcome') {
            if (!confirm('You will loose your current progress, OK?')) return;
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

socket.on('start', data => {
    setState('experiences', true);
});

socket.on('update', data => {
    experiences = data;
    display(experiences);
    setState('welcome', true);
});

socket.on('restart', data => {
    setState('welcome', true);
});

socket.on('error', data => {
    socket.emit('state-update', { name: 'error', state: true });
});

socket.on('play', id => {
    selectedExperience = experiences[id];
    play(selectedExperience);
    console.log('Experience:', selectedExperience.title, 'is loading…');
});

socket.on('state-update', data => setState(data.name, data.state));
