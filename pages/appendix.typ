#import "../styles/numbering.typ": appendix-numbering
#import "../styles/header-settings.typ": figure-tbl-counter, figure-img-counter, eq-counter

#let appendix-page(it) = {
  counter(heading).update(0)
  set heading(numbering: appendix-numbering)

  set math.equation(numbering: it => {
    let loc = here()
    let chapter-counter = counter(heading).display("A")
    [(#chapter-counter#""-#eq-counter.at(loc).at(0))]
  })

  show figure.where(kind: image): set figure(numbering: it => {
    let loc = here()
    let chapter-counter = counter(heading).display("A")
    [#chapter-counter#""-#figure-img-counter.at(loc).at(0)]
  })

  show figure.where(kind: table): set figure(numbering: it => {
    let loc = here()
    let chapter-counter = counter(heading).display("A")
    [#chapter-counter#""-#figure-tbl-counter.at(loc).at(0)]
  })
  it
}