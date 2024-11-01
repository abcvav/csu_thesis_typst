#import "../utils/lib.typ": *

// 设置正文前面的部分
#let front-matter(cover-info: none, abstract-info: none, doc) = {
  set document(author: cover-info.作者姓名, date: datetime.today())

  set page(
    paper: "a4", 
    margin: (
      top: 91pt,
      bottom: 85pt,
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
    footer: [
      #set align(center)
      #set text(font: font.Times, size: font-size.小五)
      #v(1pt)
      #counter(page).display("I")
    ]
  )

  // 中文摘要
  let (abstract-zh-info, abstract-en-info) = abstract-info
  // TODO 还需要测试两行的标题间距
  abstract-zh-page(
    title: cover-info.论文名称, 
    keywords: abstract-zh-info.keywords,
    classification: abstract-zh-info.classification,
    abstract-zh-info.content
  )

  // 英文摘要
  abstract-en-page(
    title: cover-info.论文英文名称, 
    keywords: abstract-en-info.keywords,
    classification: abstract-en-info.classification,
    abstract-en-info.content,
  )

  // 目录页
  csu-outline()

  counter(page).update(1)
  set page(
    header: [
      #set text(size: font-size.五号)
      #box(
        width: 100%,
        stroke: (bottom: black),
        inset: (bottom: 6pt, left: 1.5pt, right: 1.5pt),
      )[中南大学博（硕）士学位论文 #h(1fr) #context display-header()]
    ],
    footer: [
      #set align(center)
      #set text(font: font.Times, size: font-size.小五)
      #context counter(page).display("1")
    ]
  )

  // set figure(numbering: fig-numbering)
  show figure: figure-settings
  show heading.where(level: 1): append-state
  doc
}