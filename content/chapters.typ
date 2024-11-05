#import "../styles/numbering.typ": main-text-numbering
#import "../styles/heading-settings.typ": main-text-heading
#set heading(numbering: main-text-numbering)
#show heading: main-text-heading

= 章标题 

== 表格

表格语法：#link("https://typst.app/docs/guides/table-guide/", text(fill: blue, "Table-Guide"))


#figure(
  table(
    columns: 3, 
    align: center,
    table.hline(),
    table.header([表头1], [表头2], [表头3]),
    table.hline(),
    [表项1],[表项2], [表项3],
    [表项4],[表项5], [表项6],
    table.hline(),
  ),
  caption: [普通表]
) <mytable>

引用表格：`@mytable`。引用结果：@mytable

#figure(
  table(
    columns: (4cm, auto, auto),
    align: center + horizon,
    [你好], [你好], [你好],
    table.cell(rowspan: 2)[跨行表项, 指定 `align: horizon` 垂直居中], [表头], [表项], 
    [表项], [表项]
  ),
  caption: [跨行表]
)

#figure(
  table(
    columns: (3cm, 3cm, 5cm), 
    align: center,
    table.hline(),
    table.header([设定columns的长度后], [表头标题超过该长度], [就会自动换行]),
    table.hline(),
    [表项1],[表项2], [表项3],
    [表项4], table.cell(colspan: 2)[使用 `table.cell(colspan: 2)` 跨2列],
    table.hline(),
  ),
  caption: [跨列表]
)

#figure(
  table(
    columns: 3, 
    align: center,
    stroke: none,
    table.hline(),
    table.header([*加粗表头1*], [*加粗表头2*], [*加粗表头3*]),
    table.hline(),
    table.cell(rowspan: 2)[跨行表项1],[表项2], [表项3],
    [表项5], [表项6],
    table.hline(),
  ),
  caption: [三线表]
)

行间公式： $ sum_(k=1)^n k = (n(n+1)) / 2 $

行内公式：$sum_(k=1)^n k = (n(n+1)) / 2$


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
  caption: [图标题],
)


= 章标题
行间公式： $ sum_(k=1)^n k = (n(n+1)) / 2 $

$ sum_(k=1)^n k = (n(n+1)) / 2 $

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

@label 表明... @he2016deep

文献 @impagliazzo2001problems

