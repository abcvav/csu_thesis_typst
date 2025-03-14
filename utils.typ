#import "@preview/subpar:0.2.1"
#import "styles/header-settings.typ": algo-counter
#import "styles/font-settings.typ": font, font-size

#let algo(..children) = {
   align(center, grid(
    stroke: (left: none, right: none, bottom: black, top: black), 
    inset: 5pt,
    [#set align(left) 
    #set text(size: 11pt)
    #let algo-num = context algo-counter.display("1")
    #let chap-num = context counter(heading).get().at(0)
    *算法 #(chap-num)-#algo-num* #children.at(0)],
    [#set align(left)
    #set text(size: 9pt)
    #children.pos().slice(1).join()],
   ))
   algo-counter.step()
}

#let _subfig = subpar.grid.with(
  numbering: super => numbering("1-1", counter(heading).get().first(), super),
  numbering-sub-ref: (super, sub) => {
    numbering("1-1a", counter(heading).get().first(), super, sub)
  },
)

#let subfig(..args) = {
  set text(size: font-size.五号, font: font.Times + font.楷体)
  _subfig(..args)
}