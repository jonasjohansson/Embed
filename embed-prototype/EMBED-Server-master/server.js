const io = require('socket.io')(8080)
const mongoose = require('mongoose')
const serve = require('serve')
const path = require('path')
const delay = ms => new Promise(r => setTimeout(r, ms))

serve(path.join(__dirname, 'www'), { port: process.env.PORT || 5000 })

mongoose.connect(process.env.MONGODB_URI || 'mongodb://localhost/embed')
const Schema = mongoose.Schema({ key: String, value: mongoose.Schema.Types.Mixed })
const Model = mongoose.model('Schema', Schema);
const setDbValue = async (key, value) => Model.findOneAndUpdate(
	{ key },
	{ value },
	{
		upsert              : true,
		new                 : true,
		setDefaultsOnInsert : true
	}
)
const getDbValue = async key => {
	const doc = await Model.findOne({ key })
	if (doc) {
		return doc.value
	}
}
const connectionListeners = new Map()
const addConnectionListener = callback => {
	if (!connectionListeners.get(callback)) {
		connectionListeners.set(callback,callback)
	}
}
const removeConnectionListener = callback => {
	if (connectionListeners.get(callback)) {
		connectionListeners.delete(callback)
	}
}
io.on('connection', socket => connectionListeners.forEach(listener => listener(socket)))

addConnectionListener(socket => {
	console.log('connected')

	socket.on('get-data', async (key, resolve) => {
		const value = await getDbValue(key)
		console.log('get-data', key, value)
		resolve(value)
	})
	socket.on('set-data', (payload, resolve) => {
		const { key, value } = payload
		console.log('set-data', key, value)
		setDbValue(key, value)
		socket.broadcast.emit('change-data', payload)
		resolve(value)
	})

	// Remote control will fire this when it needs to change a content
	socket.on('change-content', async ({ url, room }) => {
		// add a lister to all new socket connections
		const clients = []
		const addClient = clientSocket => {
			const client = {
				ready  : false,
				socket : clientSocket
			}
			clients.push(client)
		}
		addConnectionListener(addClient)

		// Broad cast that the room needs to load new content
		setDbValue(`${room}.content.ready`, false )
		socket.broadcast.emit('change-data', {
			key   : `${room}.content.ready`,
			value : false
		})
		setDbValue(`${room}.content.url`, url )
		socket.broadcast.emit('change-data', {
			key   : `${room}.content.url`,
			value : url
		})

		// Wait a bit for the clients to register
		await delay(500)
		removeConnectionListener(addClient)

		// Wait each client to say they are ready
		clients.forEach(client => {
			client.socket.on(room, () => {
				client.ready = true
				// When all clients are ready, emit a "play"
				const ready = clients.reduce((ready, client) => ready && client.ready, true)
				if(ready) {
					clients.forEach(({ socket }) => socket.emit('play'))
					setDbValue(`${room}.content.ready`, true )
					socket.broadcast.emit('change-data', {
						key   : `${room}.content.ready`,
						value : true
					})
				}
			})
		})

	})
})
