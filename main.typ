#import "templates/csu-master-template.typ": csu-master-template
// FIXME 这里太别扭了，appendix居然不属于这个模板
#import "pages/appendix.typ": appendix-page

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
// TODO 调整附录和参考文献的段间距
// FIXME 页眉显示有bug
#show: csu-master-template.with(
  cover-info: cover-info,
  abstract-info: (abstract-zh-info, abstract-en-info)
)
#import "utils/chapter-info.typ": display-header

// #display-header()
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
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)
#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)

#figure(
  table(columns: 2, align: center,
  [111],[2],
  [3],[4]),
  caption: [I'm here]
)

#figure(
  image("example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
) <label>

@label 表明... @he2016deep

文献 @impagliazzo2001problems


#display-header()


#bibliography("ref.bib", style: "gb-t-7714-2015-numeric.csl")



// 附录写入一个文件中
#show: it => appendix-page(it)

= 附录标题

== 小节标题


= 附录标题

#import "styles/font-settings.typ": *
#let research-results(it) = {
  counter(heading).update(0)
  let other-numbering(..nums) = {
    let num-to-chinese = (
      "1": "一",
      "2": "二",
      "3": "三",
      "4": "四",
      "5": "五",
      "6": "六",
      "7": "七",
      "8": "八",
      "9": "九"
    )
    let nums-arr = nums.pos()
    if nums-arr.len() == 2 {
      [#num-to-chinese.at(str(nums-arr.at(1)))、]
    }
  }

  set heading(numbering: other-numbering)
  
  let heading-setting(it) = {
    if it.level == 2 {
      set text(font: font.黑体, weight: "bold")
      // it.fields()
      it
    } else {
      it
    }
  }
  show heading: it => heading-setting(it)

  it
}
#show: it => research-results(it)

= 攻读学位期间主要的研究成果

== 发表的学术论文

== 主持和参与的科研项目

= 致谢