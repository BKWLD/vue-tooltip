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
				'top', 'top-start', 'top-end'
				'bottom', 'bottom-start', 'bottom-end'
				'left', 'left-start', 'left-end'
				'right', 'right-start', 'right-end'
			]
		
		offset:
			type: [ Boolean, Number ]
			default: true
		
		transition:
			type: String
			default: 'panel'

		# Subscribe to scroll and resize events so we can
		# re-position the tooltip panel in viewport
		autoUpdate:
			type: Boolean
			default: true
		
		# Flip: Switch to fallback placements to keep panel in viewport
		# Pass `false` (to disable) or options object
		# https://floating-ui.com/docs/flip
		flip:
			type: [ Boolean, Object ]
			default: true

	data: -> 
		
		active: @openOnMount
		
		id: @getUid()

		# Default values.  We use these when a prop is 'true'
		defaults:
			offset: 10
			flip:
				fallbackPlacements: [
					'right-start', 'right-end'
					'top-start', 'top', 'top-end'
					'bottom-start', 'bottom', 'bottom-end'
				]

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

			# Middleware
			# If prop is true, use defaults, else pass the options object.
			middleware = []
			if @offset
				if @offset == true
					middleware.push offset(@defaults.offset) 
				else
					middleware.push offset(@offset)
			if @flip
				if @flip == true
					middleware.push flip(@defaults.flip) 
				else
					middleware.push flip(@flip)
	
			computePosition(@buttonElement, @panelElement, {
				placement: @placement,
				middleware: middleware
			}).then(@applyStyles)


	watch:

		# Use nextTick so our refs exist
		active: -> @$nextTick ->
			if @active
				@update()
				@cleanup = autoUpdate(@buttonElement, @panelElement, @update) if @autoUpdate
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
