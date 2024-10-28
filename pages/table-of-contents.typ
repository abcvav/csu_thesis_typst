#import "../utils/font-settings.typ": *

#let csu-outline() = [
  #set page(margin: (top: 113pt))

  #show outline.entry.where(level: 1): it => {
    set text(font: font.黑体)
    v(4.5pt)
    strong(it)
    v(-3pt, weak: true)
  }

  #outline(
    title: [
      #set text(font: font.黑体, size: font-size.三号)
      #h(1fr)目#"    "录#h(1fr)
      #v(37.5pt)
    ],
    indent: 1em
  )
]