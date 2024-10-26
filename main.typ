#import "@preview/a2c-nums:0.0.1": int-to-cn-num
#import "pages/master-cover.typ": master-cover
#import "utils/font-settings.typ": font-size, font

// 该信息会嵌入到pdf元信息中，但不会显示在pdf页面中
#set document(author: "作者姓名", date: datetime.today())

#set page(
  paper: "a4", 
  margin: (
    top: 75pt,
    bottom: 75pt,
    left: 90pt,
    right: 90pt
  )
)

#master-cover(
  中图分类号: "",
  学校代码: "10533",
  UDC: "",
  学位类别: "硕士",
  论文名称: "学位论文中文题名",
  title: "English name of the thesis",
  作者姓名: "XXX", 
  一级学科: "一级学科名称",
  二级学科: "二级学科名称",
  研究方向: "关键词组",
  二级培养单位: "XXX",
  指导教师: "导师姓名",
  副指导教师: "副导师姓名（必要时，限 1 名）",
  答辩日期: "", 
  答辩委员会主席: "", 
  年: "XXXX", 
  月: "XX"
)

#counter(page).update(1)
#set page(
  header: [
    #set text(font: font.宋体, size: font-size.五号, stroke: 0.1pt)
    #box(
      width: 100%,
      stroke: (bottom: black),
      inset: (bottom: 6pt, left: 1.5pt, right: 1.5pt),
      [中南大学博（硕）士学位论文 #h(1fr) 标题]
    )
  ],
  footer: context [
    #set align(center)
    #set text(font: font.Times, size: font-size.小五)
    #counter(page).display("1")
  ]
)

#set par(
  justify: true,          // 两端对齐
  first-line-indent: 2em, // 段前顶格两字符
  leading: 1em,          // 行距 20 磅
  spacing: 1em

)

#let global-font = font.Times + font.宋体
#set text(
  font: global-font,
  lang: "zh",
  region: "cn",
  weight: "thin",
  size: font-size.小四  // 小四号 = 12pt
)

#set heading(numbering: "1.1")
#let heading-setting(it) = {
    if it.level == 1 {
      set align(center)
      set text(
        size: font-size.三号, 
        stroke: 0.2pt, 
        font: global-font
      )
      // pagebreak()
      // v(0pt)
      "第" + counter(heading).display("1") + "章  "
      it.body
      // v(0pt)
    } else if it.level == 2{
      set text(
        size: font-size.四号, 
        weight: "thin", 
        font: global-font
      )
      it
    } else {
      set text(
        size: font-size.小四, 
        weight: "thin", 
        font: global-font
      )
      it
    }
    par()[#text(size:0.5em)[#h(0.0em)]]
}

#show heading: it => heading-setting(it)


= 章标题

正文采用中文小四号宋体，英文小四号Times New Roman，标准字间距，章节名及正文的固定值行距为20磅。

第一章一般为绪论，应包括研究的目的和意义，问题的提出，选题的背景， 文献综述，研究方法，论文结构安排等。

== 节标题
示例...


== 研究背景

=== 小节
文字

== 研究目的及意义


== 国内外研究现状


= 例子

#show raw: rect.with(stroke: blue)

#let word-count(it) = {
  return it.text.len();
}

#word-count([word])

#let f(a, b, c) = [#a, #b, #c]
#let b = text.with(fill: blue)

#rect([hello])

#let matrix-fmt(..args) = [
  #let a = args.pos()
  #a.len()
  #table(columns: a.len(), [#a.at(0)])
]
#matrix-fmt((1,2,3),(4,5,6),(7,8,9))

#let cat = (a: 2, "b": 3, attr: [123])
#for (key, val) in cat {
  [#key #val]
}

#text(fill: color.hsl(0deg, 21.05%, 77.65%, 0%))[你好]

#table(columns: 2, align: center,[111],[2],[3],[4])

#text(lorem(100), fill: red)


#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
) <label>

@label 表明...

文献 @impagliazzo2001problems

#bibliography("ref.bib", style: "gb-t-7714-2015-numeric.csl")