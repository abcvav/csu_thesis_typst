#import "../styles/font-settings.typ": *

#let csu-outline() = [
  #set page(margin: (top: 113pt))

  #show outline.entry.where(level: 1): it => {
    set text(font: font.黑体)
    v(4.5pt)
    it
    v(-3pt, weak: true)
  }
  #show outline.entry.where(level: 2): it => {
    it
    v(-7.5pt, weak: true)
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