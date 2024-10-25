#import "@preview/a2c-nums:0.0.1": int-to-cn-num
#import "pages/master-cover.typ": master-cover

#set page(
  paper: "a4", 
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,
    right: 3cm
  )
)

#master-cover(
  中图分类号: "",
  学校代码: "10533",
  UDC: "",
  学位类别: "硕士",
  论文名称: "学位论文中文题名",
  title: "学位论文英文题名",
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

// #set heading(numbering: "第1.1章")
#set text(
  font: ("Times New Roman", "Songti SC"),
  lang: "zh",
  region: "cn",
  size: 12pt  // 小四号 = 12pt
)

#set par(
  justify: true,          // 两端对齐
  first-line-indent: 2em  // 段前顶格两字符
) 

#let chinese-numbering(
  ..nums,
  location: none,
  in-appendix: false,
  brackets: false,
) = locate(loc => {
  // let actual_loc = if location == none { loc } else { location }
  if not in-appendix {
    if nums.pos().len() == 1 {
      // "第" + int-to-cn-num(nums.pos().first()) + "章"
      "第" + str(nums.pos().first()) + "章"
      h(0.5em)
    } else {
      numbering(
        if brackets {
          "(1.1)"
        } else {
          "1.1 "
        },
        ..nums,
      )
    }
  } else {
    if nums.pos().len() == 1 {
      "附录 " + numbering("A.1", ..nums)
    } else {
      numbering(
        if brackets {
          "(A.1)"
        } else {
          "A.1"
        },
        ..nums,
      )
    }
  }
})

#set heading(numbering: chinese-numbering)

#show heading: it =>  {
    if it.level == 1 {
      set align(center)
      set text(weight: 700)
      it
    } else {
      it
    }
    par()[#text(size:0.5em)[#h(0.0em)]]
    // fakepar
}




= 绪论

== 研究背景



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