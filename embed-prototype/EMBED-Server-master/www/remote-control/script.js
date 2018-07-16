import settings from '/modules/settings.js'
import server from '/modules/server.js'

const load = (room, playlist, index) => {
	const { title, author, url } = playlist[index]
	const number = `${index + 1}/${playlist.length}`

	const titleEl = document.getElementById('title')
	titleEl.innerHTML = title

	const authorEl = document.getElementById('author')
	authorEl.innerHTML = author

	const numberEl = document.getElementById('number')
	numberEl.innerHTML = number

	server.emit('change-content', { room, url })
}
const init = async () => {
	console.log(settings)
	await server.init(settings.server)
	const playlist = await server.get(settings.playlist)
	let index = 0
	load(settings.room, playlist, index)

	const previous = document.getElementById('previous')
	previous.addEventListener('click', () => {
		index--
		if (index < 0) {
			index = playlist.length - 1
		}
		load(settings.room, playlist, index)
	})
	const next = document.getElementById('next')
	next.addEventListener('click', () => {
		index++
		if (index > playlist.length - 1) {
			index = 0
		}
		load(settings.room, playlist, index)
	})
}
init()
