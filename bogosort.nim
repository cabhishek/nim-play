import random
randomize()

proc shuffle[T](a: var openArray[T]) =
  for i in countdown(high(a), 0):
    let j = random(i+1)
    swap(a[i], a[j])

proc isSorted[T](a: openArray[T]): bool =
  for i in 1..<len(a):
    if a[i-1] > a[i]:
      return false
  return true

#Highly inefficient
proc bogoSort[T](a: var openarray[T]) =
  while not isSorted(a): shuffle(a)

var a = @[4, 65, 2, -31, 0, 99, 2, 83, 782]
bogoSort(a)

echo a
