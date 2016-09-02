template trySwap =
  if a[i] < a[i-1]:
    swap(a[i], a[i-1])
    done = false

proc cocktailSort(a: var openarray[int]) =
  var done = false
  var size = len(a) - 1
  while not done:
    done = true
    for i in countup(1, size): trySwap
    if done: break
    for i in countdown(size, 1): trySwap

var a = @[9, 4, 65, 2, -31, 0, 99, 2, 83, 782]
cocktailSort(a)
echo(a)
