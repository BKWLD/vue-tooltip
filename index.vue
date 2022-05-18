<template lang='pug'>

button.tooltip-btn(
	:aria-label='ariaLabel'
	:aria-expanded='active'
	:aria-described-by='`tooltip-${id}`'
	@click.prevent='onClick'
	:class='classes'
	ref='button'
)
	slot(name='button'): .tooltip-btn-icon ?

	transition(:name='transition')
		.tooltip-panel(
			ref='panel' 
			v-if='active'
			role='tooltip'
			:id='`tooltip-${id}`'
			v-click-outside='onClickOutside'
		): slot

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
import { computePosition, flip, shift, offset, autoUpdate } from '@floating-ui/dom'
import vClickOutside from 'v-click-outside'

export default

	name: 'VueTooltip'

	directives: clickOutside: vClickOutside.directive

	props:
		
		# Tooltip button aria-label
		ariaLabel:
			type: String
			default: 'More Information'

		openOnMount:
			type: Boolean
			default: false
		
		placement:
			type: String
			default: 'right-start'
			validator: (val) -> val in [
				'top'
				'top-start'
				'top-end'
				'bottom'
				'bottom-start'
				'bottom-end'
				'left'
				'right'
				'right-start'
			]
		
		offset:
			type: Number
			default: 10
		
		transition:
			type: String
			default: 'panel'

		# Subscribe to scroll and resize events so we can
		# re-position the tooltip panel in viewport
		autoUpdate:
			type: Boolean
			default: true

	data: -> 
		active: @openOnMount
		id: @getUid()

	computed:
		classes: -> [ 'active' if @active ]

	mounted: -> @update()

	beforeDestroy: -> @cleanup?()

	methods:
		
		onClick: -> @active = !@active

		onClickOutside: -> @active = false

		applyStyles: ({x, y, strategy} = {x: 0, y: 0, strategy: 'absolute'}) ->

			Object.assign @panelElement.style, {
				left: "#{x}px"
				top: "#{y}px"
			}

		# Generate a unique string comprised of numbers and lowercase letters.
		getUid: (strLength=8) -> Math.random().toString(36).substr(2, strLength)

		update: ->
			# Elements
			return unless @buttonElement = @$refs.button
			return unless @panelElement = @$refs.panel
	
			computePosition(@buttonElement, @panelElement, {
				placement: @placement,
				middleware: [
					offset(@offset)
					flip()
					shift()
				]
			}).then(@applyStyles)


	watch:

		# Use nextTick so our refs exist
		active: -> @$nextTick ->
			if @active
				@update()
				@cleanup = autoUpdate @buttonElement, @panelElement, @update
			else
				@cleanup?()

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus'>
@import '~bukwild-stylus-library/index.styl'

.tooltip-btn
	// Make a "?" centered inside a circle
	display flex
	align-items center
	justify-content center	
	border-radius 20px
	width 20px
	height @width
	font-size 14px
	background black
	color white

.tooltip-btn-icon
	// Most fonts position the "?" too low
	position relative
	top -.06em

.tooltip-panel
	// Required by floating-ui
	position absolute

.panel-enter-active, .panel-leave-active
	transition opacity .2s, transform .3s ease-out

.panel-enter-to, .panel-leave // In state
	opacity 1

.panel-enter, .panel-leave-to // Out state
	opacity 0
	transform translateY(5px)

</style>
