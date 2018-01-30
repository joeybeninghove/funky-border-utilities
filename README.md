# Funky Border Utilities

This is just a quick little Ruby script to generate CSS utility classes for
doing some funky things with border radiuses.  It came about when I was playing
around with hand-drawn type borders in CSS.

The CSS utility class names are inspired by [Tailwind
CSS](https://tailwindcss.com) and I hope to build an actual
[PostCSS](http://postcss.org) plugin for it at some point.

I've included the generated CSS and a sample HTML file of its use in this
repository, but if you run the Ruby script they will get overwritten with what
you're generating.

## What Does It Generate?

This script generates CSS in the form of [cssnext](http://cssnext.io), so it
uses [custom properties and var calls](http://cssnext.io/features/#custom-properties-var).
The reason for this is because I built it to plug into my Webpack pipeline which
already uses PostCSS and cssnext to compile all of the CSS along with my
Tailwind styles.

## CSS Class Names

The class names that are generated follow the [Tailwind convention for border
radiuses](https://tailwindcss.com/docs/border-radius), but they add a `h` and
`v` dimension to them (horizontal and vertical, respectively).

Styling the top left border radius, you would use a class like `.rounded-tl-sm-lg`.
That would apply a `sm` border radius to the _horizontal_ axis of that corner
and a `lg` border radius to the _vertical_ axis.

## Usage

You can apply one or more of these utility classes to any element.

For example:

```html
<div class="rounded-tl-sm-lg rounded-br-xl-sm">
</div>
```

This would add a border radius to the "top left" corner with a `sm` radius to its
_horizontal_ axis and an `lg` radius to the _vertical_ axis.  At the same time
it would also add a border radius to the "bottom right" corner with an `xl`
radius to its _horizontal_ axis and a `sm` radius to the _vertical_ axis.

## Customizing The Config

The script has a default config for the various border radius sizes, but these can be
customized to whatever you want.

```css
:root {
  --h-xl-size: 155px;
  --v-xl-size: 155px;
  --h-lg-size: 100px;
  --v-lg-size: 100px;
  --h-md-size: 55px;
  --v-md-size: 55px;
  --h-sm-size: 35px;
  --v-sm-size: 35px;
}
```

## Questions or Ideas?

This is just a one-off script right now, but if you have any questions, you can
reach me on [my site](https://joey.io) or
[@joeybeninghove](https://twitter.com/joeybeninghove).
