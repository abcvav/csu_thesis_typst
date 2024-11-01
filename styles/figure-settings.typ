#import "font-settings.typ": *

#let figure-settings(it) = {
  set text(font: font.Times + font.楷体, size: font-size.五号)
  set figure.caption(separator: [#"  "])
  if it.kind == image {
    it
  } else if it.kind == table {
    set figure.caption(position: top)
    it
  } else {
    it
  }
  par()[#text(size: 0em)[#h(0.0em)]]
}