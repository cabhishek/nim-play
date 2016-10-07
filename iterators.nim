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

for x in flatten(@[@[1,2,3], @[4,5,6]]): echo x

iterator `->`(fr, to: int): int =
  var i = fr
  while i < to:
    yield i
    inc(i)

for x in 0->5: echo x

iterator count2(): int {.closure.} =
  var x = 1
  yield x
  inc(x)
  yield x

proc invoke(iter: iterator(): int {.closure.}) =
  for x in iter(): echo x

invoke(count2) # without closure pragma this wont compile
