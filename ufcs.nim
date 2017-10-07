import sequtils

proc multiply(arr: seq[int], by: int): seq[int] = arr.mapIt(it * by) 
proc divide(arr: seq[int], by:int): seq[int] = arr.mapIt(it div by) 
proc evens(arr: seq[int]): seq[int] = arr.filterIt(it mod 2 == 0) 

let values = toSeq(0..10)

echo evens(divide(multiply(values, 5), 2))
# vs
echo values.multiply(5).divide(2).evens