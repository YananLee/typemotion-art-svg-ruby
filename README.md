# TypeMotion.Art SVG for Ruby

A dependency-free Ruby gem that makes a basic animated text SVG. It runs locally. For the visual editor and video export, use [TypeMotion.Art](https://www.typemotion.art/).

## Install

```sh
gem install typemotion_art_svg
```

## Use

```ruby
require "typemotion_art_svg"

svg = TypeMotionArtSvg.render("Hello world", text_color: "#ffffff")
File.write("title.svg", svg)
```

Options: `width`, `height`, `font_size`, `text_color`, `background`, and `duration`. The output is a self-contained animated SVG for web embeds. SVG animation support varies outside browsers.

## License

MIT.
