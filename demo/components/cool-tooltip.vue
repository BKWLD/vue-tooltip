<!--  -->

<template lang='pug'>
vue-tooltip(
	transition='cool'
	:offset='25')

  //- Override what's inside .tooltip-btn
  template(#button) More info

  //- Passthru slot contents
  template(#default): slot

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
# export default
# 	components:
# 	props: []
# 	data: ->
# 	computed:
# 	watch:
# 	methods:
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>
.tooltip-btn
	background instructions-color
	text-shadow 0px 0px 2px rgba(black, 0.8)
	width auto
	padding 2px 8px
	transition background 100ms linear, transform 400ms ease-out-quint

	&:hover
		background darken(instructions-color, 10%)

	&.active
		background darken(instructions-color, 20%)

>>> .tooltip-panel
	z-index 10
	fluid-space padding, 'xs'
	basic-border-radius()
	background rgba(secondary-background, 1)
	color primary-color
	text-shadow none
	border 1px solid rgba(primary-color, 0.5)

>>>
	.cool-enter-active, .cool-leave-active
		transition opacity 100ms linear, transform 200ms ease-out-back
		transform-origin 50% 50%

	.cool-enter-to, .cool-leave // In state
		opacity 1

	.cool-enter, .cool-leave-to // Out state
		opacity 0
		transform scale(0.9)
		transform scale(0.9) translateX(-5px)

// Table
>>> .tooltip-panel
	line-height 1.4

	.title
		font-weight bold
		margin-bottom 6px

	table
		width 200px

	td:last-child
		text-align right

	.line
		height 8px
		border-bottom 1px solid rgba(primary-color, 0.5)

	.total td
		padding-top 8px
		font-weight bold


</style>
