import strutils, sequtils, future

proc multipleReturn(): tuple[name: string, age: int] =
  result = ("foo", 10)

let (name, age) = multipleReturn()
echo name & " " & $age

# update sum var
proc mutateInput(x, y: int, sum: var int) =
  sum = x + y

var sum : int
mutateInput(10, 12, sum)
assert sum == 22

#named args
proc address(city, country: string, zip: int) =
  echo "$1 $2 $3" % [city, country, $zip]

address(zip=20001, country="USA", city="DC")
