#import "../utils/font-settings.typ": font-size

#let _bold-title(body, font: "Heiti SC", size: font-size.小二, stroke: 0.6pt) = {
  return align(center)[
    #text(
      font: font,
      size: size,
      stroke: stroke,
      body
    )
  ]
}

#let _paper-info(key, val, key-align: left, val-align: center, key-width: auto) = [
  #set text(
        font: "Songti SC",
        size: font-size.四号,
        weight: "thin",
        bottom-edge: "descender",
      )
  #box(
    width: key-width,
    inset: 1pt,
    align(key-align)[#key]
  )
  #box(
    width: 1fr,
    stroke: (bottom: black),
    inset: 1pt,
    align(val-align)[#val]
  )
]
  
#let _student-info-table(
  作者姓名, 
  一级学科,
  二级学科,
  研究方向,
  二级培养单位,
  指导教师,
  副指导教师
) = [
  #set text(
    font: "Songti SC", 
    size: font-size.三号, 
    weight: "thin"
  )

  #align(center)[
    #table(
      columns: 2,
      inset: 0.9em,
      stroke: none,
      [作 者 姓 名],
      [#作者姓名],
      [一 级 学 科],
      [#一级学科],
      [二 级 学 科],
      [#二级学科],
      [研 究 方 向], 
      [#研究方向],
      [二 级 培 养 单 位], 
      [#二级培养单位],
      [指 导 教 师],
      [#指导教师],
      [副指导教师], 
      [#副指导教师]
    )
  ]
]

#let _date-info(year, month) = [
  #align(center)[
    #text(spacing: 200%)[#year 年 #month 月]
  ]
]

#let master-cover(
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
) = [

  #_paper-info("中图分类号", 中图分类号, key-width: 17%)
  #h(2.5fr)
  #_paper-info("学校代码", 学校代码, key-align: right) \ 
  #_paper-info("UDC", UDC, key-width: 17%)
  #h(2.5fr)
  #_paper-info("学位类别", 学位类别, key-align: right)

  #v(font-size.二号, weak: true)
  #_bold-title[#(学位类别)学位论文]
  #v(2em)
  #_bold-title(size: font-size.二号)[#论文名称]
  #v(1em, weak: true)
  #_bold-title(font: "Times")[#title]
  #v(font-size.四号 * 2, weak: false)

  #_student-info-table(
    作者姓名,
    一级学科,
    二级学科,
    研究方向,
    二级培养单位,
    指导教师,
    副指导教师,
  )
  #v(font-size.四号 * 2, weak: true)
  
  #_paper-info("论文答辩日期", 答辩日期, key-align: right)
  #h(1fr)
  #_paper-info("答辩委员会主席", 答辩委员会主席, key-align: right)

  #v(font-size.四号 * 5, weak: true)
  #set text(font: ("Times", "Songti SC"), size: font-size.小三, weight: "thin")
  #align(center)[#text(spacing: 450%, "中 南 大 学")]
  #_date-info(年, 月)

  #pagebreak()
  #pagebreak()
]