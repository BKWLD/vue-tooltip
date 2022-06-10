---
title: 'Introduction'
---

A component that renders a tooltip button.  Clicking the button reveals a floating tooltip panel positioned using [Floating UI](https://floating-ui.com/).

## Usage (Simple)

Click to show the tooltip panel, then scroll to see how it re-positions itself.

With its default options, the tooltip panel will position itself to the right.  If it can't fit it will fallback to the top, then the bottom, using Floating UI [flip](https://floating-ui.com/docs/flip) middleware.

<demos-intro></demos-intro>

```pug
p Welcome to our website.
  | vue-tooltip I'm a tooltip
```

## Usage (Custom Component)

You can skin the tooltip by wrapping it in a custom component.

<demos-intro-skinned></demos-intro-skinned>

```pug
p Basic tooltip.
  cool-tooltip I'm a tooltip

p.align-right Tooltip when the button is on the right edge.
  cool-tooltip I'm a tooltip

p Big tooltip
  cool-tooltip
    .title Average Temperatures
    table
      tr: <td>January</td><td>42.1°</td>
      tr: <td>February</td><td>43.9°</td>
      tr: <td>March</td><td>42.1°</td>
      tr.line
      tr.total: <td>Average</td><td>42.1°</td>
```

cool-tooltip.vue
```pug
vue-tooltip(
  transition='cool'
  :offset='25')

  //- Override what's inside .tooltip-btn
  template(#button) More info

  //- Passthru slot contents
  template(#default): slot

<style>
  .tooltip-btn
    ...
  >>> .tooltip-panel
    ...
```
