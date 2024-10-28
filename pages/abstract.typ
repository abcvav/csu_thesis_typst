#import "../styles/font-settings.typ": font, font-size, global-font

#let _display-words(words, semicolon: "；") = {
  for word in words {
    if word == words.last() {
      [#word] 
    }
    else {
      [#word#semicolon ]
    }
  }
}

#let _header(font: font.黑体, body) = [#h(-2em)#text(font: font, weight: "bold", body)]

#let abstract-zh-page(title: none, keywords: none, classification: none, body) = [
  #set page(margin: (top: 114pt))
  #align(center)[
    #set text(font: font.Times + font.黑体, size: font-size.三号, weight: "bold")
    #title
  ]

  #v(26pt)

  #set text(font: global-font, size: font-size.四号, stroke: 0.1pt)

  #_header("摘要：")#body

  #""

  #h(-2em)图X幅，表X个，参考文献X篇

  #""

  #_header("关键词：")#_display-words(keywords)

  #_header("分类号：")#_display-words(classification)

  #pagebreak()
]

#let abstract-en-page(title: none, keywords: none, classification: none, body) = [
  #set page(margin: (top: 114pt))

  // FIXME 如何才能不要两端对齐？
  #align(center)[
    #set text(font: font.Times, size: font-size.三号, weight: "bold")
    #title
  ]

  #v(26pt)

  #let en_header = _header.with(font: font.Times)

  #set text(font: global-font, size: font-size.四号, stroke: 0.1pt)

  #set par(leading: 11.5pt)

  #en_header("Abstract:")#body

  #""

  #en_header("Keywords: ")#_display-words(keywords, semicolon: ";")

  #en_header("Classification: ")#_display-words(classification)

  #pagebreak()
]