#import "@preview/a2c-nums:0.0.1": int-to-cn-num

#set page(
  paper: "a4", 
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,
    right: 3cm
  )
)

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
      set text(weight: "extrabold")
      it
    } else {
      it
    }
    par()[#text(size:0.5em)[#h(0.0em)]]
}


// 16pt对应的是三号字体
// 15pt对应的是小三号字体
// 14pt对应的是四号字体
// 12pt对应的是小四号字体
// 10.5pt对应的是五号字体


// #set heading(numbering: "第1.1章")

= 绪论

== 研究背景
#calc.pow(4, 3)

#let t(q, a) = strong(q) + parbreak() + a
#highlight(fill: orange)[高亮]



== 研究目的及意义


== 国内外研究现状


= 例子

#lorem(100)



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