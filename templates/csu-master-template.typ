#import "../utils/lib.typ": *

#let csu-master-template(cover-info: none, doc) = {
  set document(author: cover-info.作者姓名, date: datetime.today())

  set page(
    paper: "a4", 
    margin: (
      top: 89pt,
      bottom: 88pt,
      left: 90pt,
      right: 90pt
    )
  )

  set text(
    font: global-font,
    lang: "zh",
    region: "cn",
    weight: "thin",
    size: font-size.小四,
    stroke: 0.1pt
  )

  // 封面信息填写
  master-cover(
    中图分类号: cover-info.中图分类号,
    学校代码: cover-info.学校代码,
    UDC: cover-info.UDC,
    学位: cover-info.学位,
    学位类别: cover-info.学位类别,
    论文名称: cover-info.论文名称,
    论文英文名称: cover-info.论文英文名称,
    作者姓名: cover-info.作者姓名, 
    一级学科: cover-info.一级学科,
    二级学科: cover-info.二级学科,
    研究方向: cover-info.研究方向,
    二级培养单位: cover-info.二级培养单位,
    指导教师: cover-info.指导教师,
    副指导教师: cover-info.副指导教师,
    答辩日期: cover-info.答辩日期, 
    答辩委员会主席: cover-info.答辩委员会主席, 
    年: cover-info.年, 
    月: cover-info.月
  )

  set par(
    justify: true,          // 两端对齐
    first-line-indent: 2em, // 段前顶格两字符
    leading: 1em,           // 行距 20 磅
    spacing: 1em            // 段间距
  )

  // 学位论文原创性声明、学位论文版权使用授权书
  statement-page()

  // 从摘要到目录页数单独计数
  counter(page).update(1)
  set page (
    footer: context [
      #set align(center)
      #set text(font: font.Times, size: font-size.小五)
      #counter(page).display("1")
    ]
  )
  // TODO 从 abstract 到符号说明，采用罗马字母编号
  // 中文摘要
  abstract-zh-page(
    keywords: ("关键词1", "关键词2", "关键词3"),
    classification: ("分类号1", "分类号2", ),
  )[摘要正文

  (1) 第一点

  (2) 第二点

  + 第一点
  + 第一点

  ]

  // 英文摘要
  abstract-en-page()

  // 目录页
  csu-outline()

  counter(page).update(1)
  set page(
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

  let chinese-numbering(..nums) = {
    let args_arr = nums.pos()
    if args_arr.len() == 1 {
      [第 #args_arr.at(0) 章]
    } else {
      [#args_arr.map(str).join(".")]
    }
  }
  set heading(numbering: chinese-numbering)
  show heading: it => heading-setting(it)
  doc
}