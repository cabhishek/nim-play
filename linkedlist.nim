type Node[T] = ref object
  next: Node[T]
  data: T

proc newNode[T](data: T): Node[T] =
  Node[T](data: data)

var a = newNode(12)
var b = newNode(13)
var c = newNode(14)

proc insert(a, n: var Node) =
  n.next = a.next
  a.next = n

a.insert(b)
b.insert(c)

iterator items(a: Node): Node =
  var x = a
  while x != nil:
    yield x
    x = x.next

for item in a:
  echo item.data
