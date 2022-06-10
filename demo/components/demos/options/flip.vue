<template lang='pug'>

.demo-card

	p :flip='true'
		vue-tooltip(:flip='true') I'm a tooltip

	p :flip='false'
		vue-tooltip(:flip='false') I'm a tooltip

	p placement='bottom' :flip='{ fallbackPlacements: ["left-end", "top-end"] }'
		vue-tooltip(placement='bottom' :flip='{ fallbackPlacements: ["left-end", "top-end"] }') I'm a tooltip

	p.fade Open the tooltips and scroll off the viewport to see the behavior.

</template>
