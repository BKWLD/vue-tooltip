<template lang='pug'>

.demo-card

	p :open-on-mount='false'
		vue-tooltip(:open-on-mount='false') I'm a tooltip

	p :open-on-mount='true'
		vue-tooltip(:open-on-mount='true') I'm a tooltip

	p.fade You may need to refresh the page to see its initial state if you've already clicked once on this page.

</template>
