proc search(a: openArray[int], key: int): bool =
  # type inferred
  var
    low = 0
    high = len(a) - 1

  while low <= high:
    let mid: int = (low + high) div 2 # integer division
    if key < a[mid]:
      high = mid - 1
    elif key > a[mid]:
      low = mid + 1
    else:
      return true
  return false

echo search(@[2,3,4,5,6,7,8], 5) # true
