import sequtils
# basic
iterator chars(a: string): char =
  var i = 0
  while i < len(a):
    yield a[i]
    inc(i)

for x in chars("iterator"): echo x

iterator flatten[T](coll: seq[seq[T]]): T =
  for subcoll in coll:
    for item in subcoll:
      yield item

echo toSeq(flatten(@[@[1,2,3], @[4,5,6]]))

# operator overload
iterator `->`(fr, to: int): int =
  var i = fr
  while i < to:
    yield i
    inc(i)

for x in 0->5: echo x

# iter setup
proc range[T](start: T, till: T, step: T = 1): iterator(): T =
  result = iterator(): T {.closure.} =
    var x = start
    while x < till:
      yield  x
      x += step

proc len[T](iter: iterator(): T): int =
  result=0
  discard iter() # kick start iter
  while not finished(iter):
    inc(result)
    discard iter() # discard value

proc invoke(iter: iterator(): int {.closure.}) =
  for x in iter(): echo x

invoke(range(1, 10, step=2)) # without closure pragma this wont compile

# util procs
proc first[T](iter: iterator(): T): T =
  result = iter()
  if finished(iter):
    raise newException(ValueError, "No first item to get")

assert first(range(10, 20)) == 10

proc last[T](iter: iterator(): T): T =
  var x = iter()
  if finished(iter):
    raise newException(ValueError, "No last item to get")
  while not finished(iter):
    result = x
    x = iter()

echo last(range(10, 20)) == 19

proc peek[T](iter: iterator(): T): T =
  var iterCopied: iterator(): T
  deepcopy(iterCopied, iter)
  result = iterCopied()
  if finished(iterCopied):
      raise newException(ValueError, "No first item to peek")

let iter = range(0, 10)

assert peek(iter) == 0
assert len(iter) == 10

proc take[T](iter: iterator(): T, n: int): iterator(): T =
  result = iterator(): T {.closure.}=
    var i = 0
    while i < n:
      i += 1
      var r = iter()
      if finished(iter):
        break
      yield r

var take3 = take(range(1, 10), 3)
for x in take3(): echo x
