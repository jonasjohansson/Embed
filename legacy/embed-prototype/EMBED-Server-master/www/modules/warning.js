const el = document.getElementById('warning')
const show = message => {
	el.classList.add('show')
	el.innerHTML = message
}
const hide = message => {
	el.classList.remove('show')
	el.innerHTML = ''
}

export default { show, hide }
