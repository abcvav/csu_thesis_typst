#import "global-counters.typ": eq-counter

#let equation-setting(it) = {
  if it.block {
    eq-counter.step()
    it
    par()[#text(size: 0em)[#h(0.0em)]]
  } else {
    it
  }
}