#import "../styles/font-settings.typ": *

#let abstract-zh-page(keywords: none, classification: none, body) = [
  #set page(margin: (top: 90pt))
  #align(center)[
    #set text(font: font.黑体, size: font-size.三号, stroke: 0.1pt)
    学位论文中文题名
  ]

  #set text(font: global-font, size: font-size.四号, stroke: 0.1pt)
  #let header(body) = [#h(-2em)#text(font: font.黑体, body)]

#header("摘要：")#body

#""

#h(-2em)图X幅，表X个，参考文献X篇

#""

#let display-words(words) = {
  for word in words {
    if word == words.last() {
      [#word] 
    }
    else {
      [#word；]
    }
  }
}

#header("关键词：")#display-words(keywords)

#header("分类号：")#display-words(classification)

#pagebreak()
]

#let abstract-en-page() = [

]