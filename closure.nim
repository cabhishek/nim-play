import sequtils
import algorithm

var cities = @["Frankfurt", "Tokyo", "New York"]

cities.sort(proc (x,y: string): int = cmp(len(x), len(y)))
echo(cities)

cities = cities.map do (x: string) -> string:
  "City of " & x
echo(cities)
