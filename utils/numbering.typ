#let chinese-numbering(..nums) = {
  let args_arr = nums.pos()
  if args_arr.len() == 1 {
    [第 #args_arr.at(0) 章]
  } else {
    [#args_arr.map(str).join(".")]
  }
}


#let appendix-numbering(..nums) = {
  let int2letter(num) = str.from-unicode("A".to-unicode() + num - 1)
  let nums-arr = nums.pos()
  if nums-arr.len() == 1 {
    [附录#int2letter(nums-arr.at(0))#" "]
  } else {
    let first-num = int2letter(nums.at(0))
    let last-num = nums-arr.slice(1).map(str).join(".")
    [#(first-num).#(last-num)]
  }
}