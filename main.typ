#import "@preview/a2c-nums:0.0.1": int-to-cn-num
#import "pages/master-cover.typ": master-cover
#import "pages/statement.typ": statement-page
#import "pages/abstract-zh.typ": abstract-zh-page
#import "pages/abstract-en.typ": abstract-en-page
#import "utils/font-settings.typ": *
#import "utils/heading-settings.typ": heading-setting

// 该信息会嵌入到pdf元信息中，但不会显示在pdf页面中
#set document(author: "作者姓名", date: datetime.today())

#set page(
  paper: "a4", 
  margin: (
    top: 89pt,
    bottom: 75pt,
    left: 90pt,
    right: 90pt
  )
)

#set text(
  font: global-font,
  lang: "zh",
  region: "cn",
  weight: "thin",
  size: font-size.小四,
  stroke: 0.1pt
)

// 需要有个全局的函数注入有关的变量
#let title = "学位论文中文名"
#let title-en = "English Name"

#master-cover(
  中图分类号: "",
  学校代码: "10533",
  UDC: "",
  学位: "硕士",
  学位类别: "学术学位",
  论文名称: title,
  论文英文名称: title-en,
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

#set par(
  justify: true,          // 两端对齐
  first-line-indent: 2em, // 段前顶格两字符
  leading: 1em,          // 行距 20 磅
  spacing: 1em
)

// 学位论文原创性声明、学位论文版权使用授权书
#statement-page()

// TODO 从 abstract 到符号说明，采用罗马字母编号

#abstract-zh-page(
  关键词: (1, 2),
  分类号: (3, 4),
)
#abstract-en-page()
#outline(
  title: [
    #set text(font: font.黑体, size: font-size.三号)
    #h(1fr)目#"    "录#h(1fr)
  ],
  indent: 1em
)

#counter(page).update(1)
#set page(
  header: context [
    #set text(size: font-size.五号)
    #box(
      width: 100%,
      stroke: (bottom: black),
      inset: (bottom: 6pt, left: 1.5pt, right: 1.5pt),
    )[中南大学博（硕）士学位论文 #h(1fr) #{
        let items = query(heading.where(level: 1))
        let cur-chapter-num = counter(heading).get().at(0) + 1
        // 顶多就遍历几十页，直接顺序搜索
        for item in items {
          if item.location().page() == here().page() {
            // FIXME 这里有问题，应该不止参考文献，而是除了章标题以外的所有内容
            if item.body not in ([参考文献], [致谢], [攻读学位期间主要的研究成果]) {
              [第 #cur-chapter-num 章]
            }
            [#" " #item.body]
            break
          }
        }
      }
    ]
  ],
  footer: context [
    #set align(center)
    #set text(font: font.Times, size: font-size.小五)
    #counter(page).display("1")
  ]
)

#let chinese-numbering(..nums) = {
  let args_arr = nums.pos()
  if args_arr.len() == 1 {
    [第 #args_arr.at(0) 章]
  } else {
    [#args_arr.map(str).join(".")]
  }
}

#set heading(numbering: chinese-numbering)
#show heading: it => heading-setting(it)

= 章标题

正文采用中文小四号宋体，英文小四号Times New Roman，标准字间距，章节名及正文的固定值行距为20磅。

第一章一般为绪论，应包括研究的目的和意义，问题的提出，选题的背景， 文献综述，研究方法，论文结构安排等。

== 节标题
示例...
== 节标题
示例...

=== 小节标题
示例...

== 节标题
本文的研究思路如图


== 研究目的及意义


== 国内外研究现状


= 例子

#show raw: rect.with(stroke: blue)



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