var JsonDB = require('node-json-db');

var db = new JsonDB('rooms', true, true);
 
var rooms = db.getData('/');

console.log(rooms.length);
