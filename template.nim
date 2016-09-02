#An untyped parameter means that symbol lookups and type resolution is not performed
#before the expression is passed to the template
template `mul` (a, b: untyped): untyped =
  a * b
echo mul(2.3, 3)

template printX = echo x

proc print[T](a: openArray[T]) =
  for x in a: printX #echo x is substituted here

print(@[1,2,3,4])
print(@["a","b","c","d"])

