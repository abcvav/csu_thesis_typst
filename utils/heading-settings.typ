#import "font-settings.typ": *

#let heading-setting(it) = {
  if it.level == 1 {
    set align(center)
    set text(
      size: font-size.三号, 
      stroke: 0.2pt, 
      font: font.Times + font.黑体
    )
    pagebreak(weak: true)
    // v(0pt)
    if it.body != [参考文献] {
      "第" + counter(heading).display("1") + "章  "
    }
    it.body
    // v(0pt)
  } else if it.level == 2{
    set text(
      size: font-size.四号, 
      weight: "thin", 
      font: global-font
    )
    it
  } else {
    set text(
      size: font-size.小四, 
      weight: "thin", 
      font: global-font
    )
    it
  }
  par()[#text(size:0.5em)[#h(0.0em)]]
}