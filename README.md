# Vue Tooltip

A component that renders a `button.tooltip-btn`.  Clicking the button reveals a floating `.tooltip-panel` with the slotted contents positioned with [Floating UI](https://floating-ui.com/).

## Props

* `placement`: Tooltip panel's placement relative to the tooltip button.  Can be "top", "bottom", "left", "right".  Optionally append any value with "-start" or "-end".  Default: "right-start"
* [offset](https://floating-ui.com/docs/autoUpdate): Number.  Pixel distance between .tooltip-btn and .tooltip-panel.  Default: 10. 
* `ariaLabel`: Determines .tooltip-btn's aria-label attribute.  Default: "More Information"
* `openOnMount`: When true, tooltip is open on mount. Default: false. 
* `transition`: String.  Override the `.tooltip-panel` vue transition. Default: "panel".
* [autoUpdate](https://floating-ui.com/docs/autoUpdate): Boolean.  Adds scroll and resize listeners that will attempt to re-position the tooltip panel so that it doesn't go off the viewport edges.  Default: `true`.
* [flip](https://floating-ui.com/docs/flip): True, false, or options object. 

## Usage (Simple)

Import the component and styles:
```coffee
import '@bkwld/vue-tooltip/index.css'
import VueTooltip from '@bkwld/vue-tooltip'
export default
	components: { VueTooltip }
```

Add the tooltip:
```pug
# Renders a "?" tooltip button after the text
h2 Under construction
  vue-tooltip New website coming soon

# With a bigger tooltip panel
h2 Under Construction
  vue-tooltip
    .title Construction timeline
    .body We'll be done soon
    nuxt-link(to='/timeline') Learn More
```

## Usage (Skinned)

One way to skin VueTooltip is to wrap it in a custom component:

welcome-tooltip.vue
```pug
vue-tooltip(:offset='25')

  //- Override what's inside .tooltip-btn
  template(#button) {{ buttonText }}

  //- Passthru slot contents
  template(#default) slot

//- Add custom styles
//- .tooltip-btn
//- >>> .tooltip-panel
//- ...
```

Then use it:
```pug
# Renders a "Why?" tooltip button after the text
h2 Under construction
  welcome-tooltip(button-text='Why?') To serve you better
```

## Usage (CSS overrides)

You can also just add style overrides:

defaults.styl
```styl
.tooltip-btn
  // ...

.tooltip-btn-icon
  // ...

.tooltip-panel
  // ...
```