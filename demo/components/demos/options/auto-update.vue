<template lang='pug'>

.demo-card

	p :auto-update='true'
		vue-tooltip(:auto-update='true') I'm a tooltip

	p :auto-update='false'
		vue-tooltip(:auto-update='false') I'm a tooltip

	p.fade Open the tooltips and scroll off the viewport to see the behavior.

</template>
