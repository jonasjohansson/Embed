var socket = io();

var iframeObjects;

display = () => {};

setup = () => {
	// iframeObjects['a'].iframe.width = '100';
	// iframeObjects['b'].iframe.width = '100';
	// iframeObjects['c'].iframe.width = '100';
	// iframeObjects['d'].iframe.width = '100';
	play(experiences['welcome']);
};

enter = () => {
	play(experiences['default']);
};

reset = () => {
	setup();
};

stop = () => {
	enter();
};

play = experience => {
	var w = rooms['001'].w;
	var h = rooms['001'].h;
	var d = rooms['001'].d;
	gui.__folders.a.__controllers[0].setValue(`${experience.url}?w=${w}&h=${h}&d=${d}`);
	gui.__folders.a.__controllers[1].setValue(true);
};

viewer = () => {
	iframeObjects = createFrames();
	createGui(iframeObjects);
};

createFrames = () => {
	const obj = {};
	for (id of ['a', 'b', 'c', 'd']) {
		let el = document.createElement('iframe');
		el.id = id;
		document.body.appendChild(el);
		obj[id] = {
			url: 'about:blank',
			left: false,
			center: false,
			right: false,
			top: false,
			index: 0,
			iframe: el
		};
	}
	return obj;
};


createGui = obj => {
	gui = new dat.GUI();
	let len = Object.keys(obj).length;

	for (let prop in obj) {
		const folder = gui.addFolder(prop);
		let iframeObject = obj[prop];
		let iframe = iframeObject.iframe;
		folder
			.add(iframeObject, 'url')
			.listen()
			.onChange(val => {
				iframe.src = val;
			});
		folder
			.add(iframeObject, 'left')
			.listen()
			.onChange(val => {
				iframe.classList.toggle('left', val);
			});
		folder
			.add(iframeObject, 'center')
			.listen()
			.onChange(val => {
				iframe.classList.toggle('center', val);
			});
		folder
			.add(iframeObject, 'right')
			.listen()
			.onChange(val => {
				iframe.classList.toggle('right', val);
			});
		folder
			.add(iframeObject, 'top')
			.listen()
			.onChange(val => {
				iframe.classList.toggle('top', val);
			});
		folder
			.add(iframeObject, 'index', 0, len, 1)
			.listen()
			.onChange(val => {
				iframe.style.zIndex = val;
			});
		iframe.src = iframeObject.url;
		iframe.classList.toggle('left', iframeObject.left);
		iframe.classList.toggle('center', iframeObject.center);
		iframe.classList.toggle('right', iframeObject.right);
		iframe.classList.toggle('top', iframeObject.top);
		iframe.style.zIndex = iframeObject.index;
		// folder.open();
		if (prop === 'a') folder.open();
	}
};

viewer();

// Interactive




socket.on('arrow-right', data => {
  	var current_iframe_button = $("iframe").contents().find("#remote_right").click();
});
socket.on('arrow-up', data => {
  	var current_iframe_button = $("iframe").contents().find("#remote_up").click();
});
