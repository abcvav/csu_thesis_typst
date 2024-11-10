#let equation-setting(it) = {
  if it.block == true {
    it
    par()[#text(size: 0em)[#h(0.0em)]]
  } else {
    it
  }
}