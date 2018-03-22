# Front-End Components

The front-end setup is reasonably simple. All assets are compiled by webpacker.

## Basic Styles

Basic global styles live in `frontend/styles` – the structure should be onvius from the code.

### Standard Components

Standard componants live in `frontend/components`. Each has it's own folder containing an ERB file, a CSS file and a JavaScript file.

To generate a new component, use:

```shell
bin/rails g component widget
```

This will generate:

```
components
| - widget
  |- _widget.html.erb
  |- widget.css
  `- widget.js
```

The `widget.js` file must import the CSS file with:

```css
import "./widget.css";
```

Once you've added the ERB, CSS and JS for your component, you can use it (either in another component or in a view), like this:

```erb
<%= c('widget', foo: 'Bar') %>
```

It'd common to include a `yield` in components that wrap content. In this case, they can take a block:

```erb
<%= c('modal') do %>
  <p>Modal Contents</p>
<% end %>
```

### Images

If you need to include images you have two options. For images particular to a component.

```
components
| - widget
  |- _widget.html.erb
  |- widget.css
  |- widget.js
  `-static
    `- image.png
```

This needs to be imported the JS file:

```css
import "./widget.css";
import "./static/image.png";
```

and can be acces with (ERB)

```erb
<%= image_tag asset_pack_path('components/widget/static/image.png') %>
```

or (CSS)

```css
background-image: url("./static/image.png");
```

Alternatively, you can put them in `frontend/images` and access them through:

```erb
<%= image_tag asset_pack_path 'images/logo.svg' %>
```

## React Components

It is also possible to create React components. This works more-or-less as expected. Create a component in `components/react`. Each component must have at leas one high-level `js` or `jsx` file in this directory, which must export the component.

You can then use the components elsewhere like so:

```erb
<%= react_component('ExampleGreeting', { greeting: 'Welcome to Jimmy' }) %>
```
