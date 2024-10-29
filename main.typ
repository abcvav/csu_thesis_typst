#import "templates/csu-master-template.typ": csu-master-template

// 该信息会嵌入到pdf元信息中，但不会显示在pdf页面中

// 封面页信息
#let cover-info = (
  中图分类号: "",
  学校代码: "10533",
  UDC: "",
  学位类别: "学术学位",    // 学术学位 | 专业学位
  学位: "硕士",
  论文名称: "学位论文中文题名",
  论文英文名称: "English Name of the Thesis",
  作者姓名: "作者姓名",
  一级学科: "一级学科名称",
  二级学科: "二级学科名称",
  研究方向: "关键词组",
  二级培养单位: "计算机学院",
  指导教师: "导师姓名",
  副指导教师: "副导师姓名（必要时，限1名）",
  答辩日期: "",
  答辩委员会主席: "",
  年: "XXXX",
  月: "XX"
)

// 中文摘要
// TODO 还需要自动计算图的数量
#let abstract-zh-info = (
  keywords: ("关键词1", "关键词2", "关键词3", "关键词4"),
  classification: ("分类号1",),
  content: [
  #([在此处撰写摘要正文内容，在此处撰写摘要正文内容。] * 3)
  

  (1) #([第二段内容，第二段内容。] * 10)

  (2) #([第三段内容，第三段内容。] * 10)

  (3) #([第四段内容，第四段内容。] * 10)

  ]
)

// 英文摘要
#let abstract-en-info = (
  keywords: ("keyword1", "keyword2", "keyword3", "keyword4"),
  classification: ("cls1",),
  content: [
    #lorem(100)

    (1) #lorem(50)

    (2) #lorem(50)
  ]
)

// TODO 添加字体文件，解决 warning 问题
#show: csu-master-template.with(
  cover-info: cover-info,
  abstract-info: (abstract-zh-info, abstract-en-info)
)
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

== 本章小结

#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)


= 章标题
== 节标题

#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
== ...

= 例子

#show raw: rect.with(stroke: blue)



#let cat = (a: 2, "b": 3, attr: [123])
#for (key, val) in cat {
  [#key #val]
}

#text(fill: color.hsl(0deg, 21.05%, 77.65%, 0%))[]

#figure(
  table(columns: 2, align: center,
  [111],[2],
  [3],[4]),
  caption: [I'm here]
)


#lorem(400)

#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)

#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
) <label>

@label 表明... @he2016deep

文献 @impagliazzo2001problems

#bibliography("ref.bib", style: "gb-t-7714-2015-numeric.csl")

= 附录A 附录标题