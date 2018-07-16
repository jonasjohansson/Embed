let socket
const init = server => new Promise((resolve, reject) => {
	socket = io(server)

	const event = 'connect'
	const timer = setTimeout(() => {
		socket.off(event, callback)
		reject(new Error('Timeout connecting to server.'))
	}, 2000)
	const callback = () => {
		clearTimeout(timer)
		socket.off(event, callback)
		resolve(socket)
	}
	socket.on(event, callback)
})

const get = key => new Promise((resolve, reject) => {
	const event = 'get-data'
	const timer = setTimeout(() => {
		socket.off(event, callback)
		reject(new Error('Timeout getting data from server.'))
	}, 2000)
	const callback = value => {
		clearTimeout(timer)
		socket.off(event, callback)
		resolve(value)
	}
	socket.emit(event, key, callback)
})
const set = (key, value) => new Promise((resolve, reject) => {
	const event = 'set-data'
	const timer = setTimeout(() => {
		socket.off(event, callback)
		reject(new Error('Timeout setting data on server.'))
	}, 2000)
	const callback = value => {
		clearTimeout(timer)
		socket.off(event, callback)
		resolve(value)
	}
	socket.emit(event, { key, value }, callback)
})

const on = (event, callback) => socket.on(event, callback)
const off = (event, callback) => socket.off(event, callback)
const emit = (event, value, callback) => socket.emit(event, value, callback)


export default { init, get, set, on, off, emit }
