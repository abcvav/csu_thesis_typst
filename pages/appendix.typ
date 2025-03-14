#import "../styles/numbering.typ": appendix-numbering

#let appendix-page(it) = {
  counter(heading).update(0)
  set heading(numbering: appendix-numbering)
  let equation-numbering = super => numbering("(A-1)", counter(heading).get().first(), super)
  show math.equation: set math.equation(numbering: equation-numbering)

  let figure-numbering = super => numbering("A-1", counter(heading).get().first(), super)
  show figure: set figure(numbering: figure-numbering)
  it
}