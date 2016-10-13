import sequtils
# simple stuff from sequtils package

var numbers = @[1,2,3,4]

#Mutate numbers
map(numbers, proc(x: var int) = x *= 2)
echo numbers

# Returns a new sequence
echo map(numbers, proc(x: int): int = x*2)
# or use mapit
echo mapit(numbers, it*2)

let
  colors = @["red", "yellow", "black"]

echo filter(colors, proc(color: string): bool = color in ["foo", "black"])  # ["black"]
# Alternately use
echo filterit(colors, it in ["foo", "black"]) # ["black"]

proc greaterThan (threshold: int): proc(x: int): bool =
  return proc(x: int): bool = return x > threshold

assert any(numbers, greaterThan(4)) == true
assert all(numbers, greaterThan(0)) == true

let zipped = zip(@[1,2,3,4], @["one", "two", "three", "four"])
# named fields a and b for convenience
assert zipped[0].a == 1 and zipped[0].b == "one"
# Alternately
let (a, b) = zipped[0]
assert a == 1 and b == "one"

echo foldl(numbers, a+b)

numbers.keepItIf(it > 5)
echo numbers

echo deduplicate(@[1,2,3,3])
