proc binarySearch(a: openArray[int], element: int): bool =
  # type inferred
  var
    low = 0
    high = len(a) - 1

  while low <= high:
    let mid: int = (low + high) div 2 # computes the integer division
    if element < a[mid]:
      high = mid - 1
    elif element > a[mid]:
      low = mid + 1
    else:
      return true

  return false

echo binarySearch(@[2,3,4,5,6,7,8], 5)
