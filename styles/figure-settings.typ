#import "font-settings.typ": *

// 统计每个图像是这一章第几次出现
#let prev-chapter-counter-img = counter("chap-counter-img")
#let prev-chapter-counter-tbl = counter("chap-counter-tbl")
#let prev-img-counter = counter("img-counter")
#let prev-tbl-counter = counter("tbl-counter")


#let figure-settings(it) = context {
  let cur-chap = int(counter(heading).get().at(0))
  if it.kind == image {
    set text(font: font.Times + font.楷体, size: font-size.五号)
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
    [#it.body #it.supplement #(cur-chap)-#(img-num) #" " #it.caption.body]
  } else if it.kind == table {
    set text(font: font.Times + font.楷体, size: font-size.五号)

    let prev-chap = int(prev-chapter-counter-tbl.display())
    let cur-tbl = int(counter(figure.where(kind: table)).get().at(0))
    let prev-tbl = int(prev-tbl-counter.display())

    if cur-chap != prev-chap {
      prev-chapter-counter-tbl.update(cur-tbl)
      prev-tbl-counter.update(cur-tbl - 1)
      prev-tbl = cur-tbl - 1
    }

    let tbl-num = (cur-tbl - prev-tbl)

    [#it.supplement #(cur-chap)-#(tbl-num) #" " #it.caption.body #it.body]
  } else {
    it
  }
  par()[#text(size: 0em)[#h(0.0em)]]
}