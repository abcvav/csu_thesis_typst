#import "../pages/appendix.typ": appendix-page
#show: appendix-page

// FIXME 测试附录图片的编号不对

= 第一个附录

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

// == 附录小节
// == 附录小节

// = 第二个附录
// == 附录小节
// == 附录小节
