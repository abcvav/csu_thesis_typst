#import "../styles/numbering.typ": main-text-numbering
#import "../styles/heading-settings.typ": main-text-heading
#set heading(numbering: main-text-numbering)
#show heading: main-text-heading


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
  image("assets/example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("assets/example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("assets/example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)


= 章标题
== 节标题

#figure(
  image("assets/example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("assets/example.png", width: 50%), // 50% / 1cm
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

#figure(
  table(columns: 2, align: center,
  [111],[2],
  [3],[4]),
  caption: [I'm here]
)
#figure(
  table(columns: 2, align: center,
  [111],[2],
  [3],[4]),
  caption: [I'm here]
)

#lorem(400)

#figure(
  image("assets/example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("assets/example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)

#figure(
  table(columns: 2, align: center,
  [111],[2],
  [3],[4]),
  caption: [I'm here]
)

#figure(
  image("assets/example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
) <label>

// FIXME 图片引用的编号有问题
@label 表明... @he2016deep

文献 @impagliazzo2001problems

