proc `<`[T](a, b: openarray[T]): bool =
  for i in 0 .. <min(a.len, b.len):
    if a[i] < b[i]: return true
    if a[i] > b[i]: return false
  return a.len < b.len

echo([1,2,3] < [1,2,3,4])
