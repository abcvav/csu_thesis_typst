#import "font-settings.typ": *

#let heading-setting(it) = {
  if it.level == 1 {
    set align(center)
    set text(
      size: font-size.三号, 
      stroke: 0.1pt, 
      font: font.Times + font.黑体
    )
    pagebreak(weak: true)
    v(4pt)
    it
    v(3.5pt)
  } else if it.level == 2{
    set text(
      size: font-size.四号, 
      weight: "thin", 
      font: global-font,
      stroke: 0.1pt
    )
    v(2.5pt)
    it
    v(-0.5pt)
  } else {
    set text(
      size: font-size.小四, 
      weight: "thin", 
      font: global-font,
      stroke: 0.1pt
    )
    it
  }
  par()[#text(size: 0em)[#h(0.0em)]]
}