#import "../utils/numbering.typ": appendix-numbering

#let appendix-page(it) = {
  counter(heading).update(0)
  set heading(numbering: appendix-numbering)
  it
}