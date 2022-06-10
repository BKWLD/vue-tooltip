<template lang='pug'>

.demo-card

	p transition='panel'
		vue-tooltip(transition='panel') I'm a tooltip

	p transition='slow-fade'
		vue-tooltip(transition='slow-fade') I'm a tooltip

	p transition='ridiculous'
		vue-tooltip(transition='ridiculous') I'm a tooltip

</template>

<style lang='stylus' scoped>

>>>
	.slow-fade-enter-active, .slow-fade-leave-active
		transition opacity 2s

	.slow-fade-enter-to, .slow-fade-leave // In state
		opacity 1

	.slow-fade-enter, .slow-fade-leave-to // Out state
		opacity 0

	.ridiculous-enter-active, .ridiculous-leave-active
		transition opacity 1s linear, transform 1s ease-out-back

	.ridiculous-enter-to, .ridiculous-leave // In state
		opacity 1
		transform scale(1) rotate(0turn)

	.ridiculous-enter, .ridiculous-leave-to // Out state
		opacity 0
		transform scale(0.1) rotate(1turn)

</style>
