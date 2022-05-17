# Vue Tooltip
A component that renders a tooltip with slotted content.


## Props

* `ariaLabel`: String. Default `More Information`.  Attribute for `.tooltip-btn`
* `openOnMount`: Boolean.  Default `false`. 
* `placement`: String. Default `right-start`.  `top`, `bottom`, `left`, `right`.  Optionally appended with `-start` or `-end`.
* `offset`: Number.  Default `10`. Pixel distance between `.tooltip-btn` and `.tooltip-panel`.
* `transition`: String.  Default `panel`.  Override the `.tooltip-panel` vue transition.
* `autoUpdate`: Boolean.  Default `true`. Subscribe to scroll and resize events so we can re-position the tooltip panel in viewport.

## Usage

```javascript
import '@bkwld/vue-tooltip/index.css'
import VueTooltip from '@bkwld/vue-tooltip'

export default {
	components: { VueTooltip }
}
```

```pug
# Simple
vue-tooltip I'm a tooltip

# Bigger
vue-tooltip
  .title Bigger tooltip
  btn Learn More
```