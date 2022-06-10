---
title: 'Options'
---

## Placement

Lets you define the tooltip panel's placement relative to the tooltip button.

```pug
//- Default is 'right-start'
vue-tooltip(placement='right-start')
```

<demos-options-placement></demos-options-placement>

## Offset

Pixel distance between the tooltip button and the tooltip panel.  Uses [floating-ui](https://floating-ui.com/docs/offset).

```pug
//- Default is 10
vue-tooltip(:offset='10')
```

<demos-options-offset></demos-options-offset>

## Aria-Label

Determines the tooltip button's `aria-label` attribute.

```pug
//- Default is 'More Information'
vue-tooltip(aria-label='More Information')
```

<demos-options-aria-label></demos-options-aria-label>

## Open on Mount

When true, the tooltip panel is open on mount.

```pug
//- Default is false
vue-tooltip(:open-on-mount='false')
```

<demos-options-open-on-mount></demos-options-open-on-mount>

## Transition

Lets you specify your own Vue transition for the tooltip panel.

```pug
//- Default is 'panel'
vue-tooltip(transition='panel')
```

<demos-options-transition></demos-options-transition>

## Auto Update

When true, adds scroll and resize listeners that will attempt to re-position the tooltip panel so that it doesn't go off the viewport edges.  Uses [floating-ui](https://floating-ui.com/docs/autoUpdate).

```pug
//- Default is true
vue-tooltip(:auto-update='true')
```

<demos-options-auto-update></demos-options-auto-update>

## Flip

Determines the sequence of fallback placements if (and only if) the main `placement` prop doesn't fit.  Uses [floating-ui](https://floating-ui.com/docs/flip).

```pug
//- Default is true
vue-tooltip(:flip='true')
vue-tooltip(:flip='{ fallbackPlacements: ["left", "top-start", "bottom-start", "right"] }')
```

<demos-options-flip></demos-options-flip>

