const get = variable => {
	const query = window.location.search.substring(1)
	const vars = query.split("&")
	for (let i = 0; i < vars.length; i++) {
		const pair = vars[i].split("=")
		if (pair[0] === variable){
			return decodeURIComponent(pair[1])
		}
	}
}

const projector = get('p') || 'TEMP_PROJECTOR'
const room = get('r') || 'TEMP_ROOM'
const server = get('s') || 'http://localhost:8080'
const playlist = get('pl') || 'playlist_calibration'

export default { get, projector, room, server, playlist }
