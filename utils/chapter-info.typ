#import "numbering.typ": chinese-numbering, appendix-numbering


#let display-header(numbering: chinese-numbering) = context {
  let main-heading = query(heading.where(level: 1, numbering: numbering))

  // 可能为空
  let appendix-heading = query(heading.where(level: 1, numbering: appendix-numbering))
  let appendix-page = appendix-heading.map(item => item.location().page())
  let appendix-page-start = 0x7fffffffffffffff

  if appendix-heading.len() != 0 {
    appendix-page-start = appendix-page.at(0)
  }

  let reference-page-start = 0x7ffffffffffffff0
  let reference-heading = query(heading.where(body: [参考文献]))
  if reference-heading.len() != 0 {
    reference-page-start = reference-heading.at(0).location().page()
  }

  // 大章标题对应的页码
  let cur-page = here().page()

  let main-heading-page = main-heading.map(item => item.location().page())
  let main-heading-name = main-heading.map(item => item.body)
  
  // [#main-heading-page #cur-page #" "]
  // [#appendix-heading]

  if cur-page in main-heading-page {
    let chapter-num = main-heading-page.position(item => (item == cur-page)) + 1
    [第 #chapter-num 章#"  "#main-heading-name.at(chapter-num - 1)]
  } else if cur-page > main-heading-page.last() and cur-page < reference-page-start {
    let chapter-num = main-heading-page.len()
    [第 #chapter-num 章#"  "#main-heading-name.at(chapter-num - 1)]
  } else if cur-page >= reference-page-start and cur-page < appendix-page-start{
    [参考文献]
  } else {
    // let chapter-num = appendix-page
    [附录 ]
  }
}