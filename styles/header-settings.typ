#import "numbering.typ": appendix-numbering

#let first-heading = state("first-heading", (:))
#let last-heading = state("last-heading", (:))

#let append-state(cur-heading) = {
  let page-num = here().page()

  let heading-numbering = counter(heading).display()
  let final-header = if cur-heading.body != [参考文献] {
    [#heading-numbering#"  "#cur-heading.body]
  } else {
    cur-heading.body
  }

  last-heading.update(item => {
    item.insert(str(page-num), final-header)
    item
  })
  first-heading.update(item => {
    let k = str(page-num)
    if k  not in item {
      item.insert(k, final-header)
    }
    item
  })
  cur-heading
}

#let find-headings(headings, page-num) = if page-num > 0 {
  headings.at(str(page-num), default: find-headings(headings, page-num - 1))
}

#let display-header() = {
  let next-headings = query(selector(heading).after(here()))
  let next-heading-page = if next-headings.len() > 0 {
    next-headings.first().location().page()
  }

  let first-headings = first-heading.final()
  let page-num = here().page()

  let last-headings = last-heading.at(here())
  
  // 找当前页
  let cur-heading = first-headings.at(str(page-num), default: find-headings(last-headings, page-num))
  
  cur-heading
}