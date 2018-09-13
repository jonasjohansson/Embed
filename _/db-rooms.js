
var JsonDB = require('node-json-db');

var db = new JsonDB('rooms', true, true);
 

var data = db.getData("/");
console.log(data);