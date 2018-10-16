func add(x, y: int): int = x + y
assert add(1, 2) == 3

func mutate(x: var int) = x.inc
var x = 1
mutate(x)
assert x == 2

# var globalVar = 10
# func invalid(): int = globalVar += 10 # Error: 'invalid' can have side effects

