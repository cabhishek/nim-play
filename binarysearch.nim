proc search(a: openArray[int], element: int): bool =
  var low = 0
  var high = len(a) - 1

  while low <= high:
    let mid = (low + high) div 2
    if element < a[mid]:
      high = mid - 1
    elif element > a[mid]:
      low = mid + 1
    else:
      return true

  return false

echo(search(@[2,3,4,5,6,7,8], 5))
