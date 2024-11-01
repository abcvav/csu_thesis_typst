#let main-text-numbering(..nums) = {
  let args_arr = nums.pos()
  if args_arr.len() == 1 {
    numbering("第1章 ", ..nums)
  } else {
    numbering("1.1", ..nums)
  }
}

#let appendix-numbering(..nums) = {
  let nums-arr = nums.pos()
  if nums-arr.len() == 1 {
    numbering("附录A ", ..nums)
  } else {
    numbering("A.1", ..nums)
  }
}

// 统计每个图像是这一章第几次出现
#let prev-chapter-counter-img = counter("chap-counter-img")
#let prev-img-counter = counter("img-counter")
#let image-numbering(..nums) = {
  let heading-counter = counter(heading)
  let cur-chap = int(heading-counter.get().at(0))
  
  let prev-chap = int(prev-chapter-counter-img.display())
  let cur-img = int(counter(figure.where(kind: image)).get().at(0))
  // 之前章节的最后一幅图像的编号
  let prev-img = int(prev-img-counter.display())

  // 当前章节和最后记录的章节不匹配，说明切换到了新的章节
  // 所以章节的 counter 重新计数
  if cur-chap != prev-chap {
    prev-chapter-counter-img.update(cur-chap)
    prev-img-counter.update(cur-img - 1)
    prev-img = cur-img - 1
  }

  let img-num = (cur-img - prev-img)
  if counter(heading.where(level: 1)).display().starts-with("附录") {
    [#heading-counter.display("A").at(0)-#img-num]
  } else {
    [#(cur-chap)-#img-num]
  }
}

#let prev-chapter-counter-tbl = counter("chap-counter-tbl")
#let prev-tbl-counter = counter("tbl-counter")
#let table-numbering(..nums) = {
  let heading-counter = counter(heading)
  let cur-chap = int(heading-counter.get().at(0))
  let prev-chap= int(prev-chapter-counter-tbl.display())
  let cur-tbl = int(counter(figure.where(kind: table)).get().at(0))
  let prev-tbl = int(prev-tbl-counter.display())

  if cur-chap != prev-chap {
    prev-chapter-counter-tbl.update(cur-chap)
    prev-tbl-counter.update(cur-tbl - 1)
    prev-tbl = cur-tbl - 1
  }

  let tbl-num = (cur-tbl - prev-tbl)
  if counter(heading.where(level: 1)).display().starts-with("附录") {
    [#heading-counter.display("A").at(0)-#tbl-num]
  } else {
    [#(cur-chap)-#tbl-num]
  }

}