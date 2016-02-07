template `mul` (a, b: untyped): untyped =
    a * b

template declareInt(x, y: untyped) =
  var x, y: int

declareInt(a, b) # create var
(a, b) = (5, 3)

echo mul(a, b)

template htmlTag(tag: expr) {.immediate.} =
  proc tag(): string = "<" & astToStr(tag) & ">"

htmlTag(br)
htmlTag(html)

echo html(), br()
