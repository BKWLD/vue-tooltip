<!-- A little logo for the demo -->

<template lang='pug'>

.layout-logo
	a(:href='logo.url') {{ logo.label }}

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default
# 	components:
	props: logo: Object
# 	data: ->
# 	computed:
# 	watch:
# 	methods:
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped>

.layout-logo
	font-weight 600
	text-shadow 0 0 7px primary-color,
		0 0 10px primary-color,
		0 0 20px rgba(primary-color, 0.5)

</style>
