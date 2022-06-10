# Use Cloak to make boilerplate
{ mergeConfig, makeBoilerplate, isDev, isGenerating } = require '@bkwld/cloak'
boilerplate = makeBoilerplate
	siteName: 'vue-tooltip'
	cms: '@nuxt/content'
	srcsetWidths: [ 1920, 1440, 1024, 768, 425, 210 ]

# Nuxt config
module.exports = mergeConfig boilerplate,

	modules: [
		'@nuxt/content'
		'vue-unorphan/nuxt/module'
		'vue-balance-text/nuxt/module'
	]

	plugins: [
		{ src: 'plugins/components' }
	]

	# Enable crawler to find dynamic pages
	generate:
		crawler: true
		routes: -> ['/']

	# Customize component autoloading
	components: [
		...boilerplate.components
		'~/components/pages' # Don't require "pages" prefix
	]

	# Add production internal URL
	anchorParser:
		internalUrls: [
			# /^https?:\/\/(www\.)?domain\.com/
		]

	# @nuxt/content
	content:
		liveEdit: false
		markdown: prism: theme: 'prism-themes/themes/prism-atom-dark.css'

	# Enable dev tools in prod
	vue: config:
		productionTip: false
		devtools: true
