#import "../pages/appendix.typ": appendix-page
#show: appendix-page


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

== 附录小节
== 附录小节

= 第二个附录
== 附录小节
== 附录小节

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
#figure(
  image("assets/example.png", width: 50%), // 50% / 1cm
  caption: [列车发车时刻],
)