var socket = io();

const sources = {}
for (id of ['a','b','c','d']){
    let el = document.createElement('iframe');
    el.id = id;
    document.body.appendChild(el);
    sources[id] = {
        url:    'about:blank',
        left:   false,
        center: false,
        right:  false,
        top:    false,
        index:  0,
        iframe: el,
    };
}

const iframes = document.querySelectorAll('iframe');

var gui = new dat.GUI();
let size = Object.keys(sources).length;

for (let prop in sources){
    const folder = gui.addFolder(prop);
    let source = sources[prop];
    let iframe = source.iframe;
    folder.add(source, 'url').listen().onChange((val)=>{
        iframe.src = val;
    });
    folder.add(source, 'left').listen().onChange((val)=>{
        iframe.classList.toggle('left',val);
    });
    folder.add(source, 'center').listen().onChange((val)=>{
        iframe.classList.toggle('center',val);
    });
    folder.add(source, 'right').listen().onChange((val)=>{
        iframe.classList.toggle('right',val);
    });
    folder.add(source, 'top').listen().onChange((val)=>{
        iframe.classList.toggle('top',val);
    });
    folder.add(source, 'index',0,size,1).listen().onChange((val)=>{
        iframe.style.zIndex = val;
    });
    iframe.src = source.url;
    iframe.classList.toggle('left',source.left);
    iframe.classList.toggle('center',source.center);
    iframe.classList.toggle('right',source.right);
    iframe.classList.toggle('top',source.top);
    iframe.style.zIndex = source.index;
    // folder.open();
    if (prop === 'a') folder.open();
}

socket.on('state-update', function (data) {
    setState(data.state, data.val);
});

socket.on('load', function (data) {
    load(data);
});

setState = (state, val) => {
    document.body.classList.toggle(state, val);
}

load = (experience) => {
    let format = experience.format;
    switch (format) {
        case 'panorama':
            console.log(gui.__folders.a.__controllers[0].setValue(experience.url+'?render=normal'));
            console.log(gui.__folders.a.__controllers[1].setValue(true));
            console.log(gui.__folders.a.__controllers[2].setValue(false));
            console.log(gui.__folders.a.__controllers[3].setValue(false));
            console.log(gui.__folders.a.__controllers[4].setValue(false));
        break;
    }
    console.log(gui.__folders.a.__controllers[0].setValue(experience.url));
    document.body.classList.add('loading');
    console.log('Loading',experience.title)
    setTimeout(()=>{
        document.body.classList.remove('loading');
        console.log('Loading complete');
        
        // Update system status ...
        /*
        	$("#system-status").html('Now Playing...' + experience.title);
        */
    },1000);
}