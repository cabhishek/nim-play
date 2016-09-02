proc insertionSort[T](a: var openArray[T]) =
  for i in 1..<len(a):
    let value = a[i]
    var j = i
    while j > 0 and value < a[j-1]:
      swap(a[j], a[j-1])
      dec(j)

    a[j] = value

var a = @[4,2,5,6,8,9,1,23]
insertionSort(a)
echo(a)
