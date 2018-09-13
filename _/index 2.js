var JsonDB = require('node-json-db');
var db_rooms = new JsonDB('rooms', true, true);
var db_experiences = new JsonDB('http://localhost/embed/experiences/experiences', true, true);

addRoom = (options) => {

	// get rooms
	let rooms = db_experiences.getData('/');

	// count number of rooms and increment
	let id = Object.size(rooms) + 1;
	options.id = id;

	// create unique room
	let name = '/room'+id;

	// push new room
	db_experiences.push(name,options);
}

removeRoom = (id) => {
	db_rooms.delete('/room'+id)
}

addExperience = (options) => {

	// get rooms
	let rooms = db_experiences.getData('/');

	// count number of rooms and increment
	let id = Object.size(rooms) + 1;
	options.id = id;

	// create unique room
	let name = '/room'+id;

	// push new room
	db_experiences.push(name,options);
}

removeExperience = (id) => {
	db_rooms.delete('/room'+id)
}

Object.size = function(obj) {
	var size = 0, key;
	for (key in obj) {
		if (obj.hasOwnProperty(key)) size++;
	}
	return size;
};

addRoom({
	name:'standard',
	author: 'jonas johansson',
	author_url: 'https://jonasjohansson.se/',
	description: 'a standard piece of art',
	type: 'video',
	url: 'https://github.com/embed/experiences/standard/',
	flags: 'motion touch voice camera',
	format: 'panorama'
});

removeRoom(1);