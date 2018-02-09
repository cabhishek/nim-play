import future

# -> Syntax sugar for procedure types.
# => Syntax sugar for anonymous procedures.
proc add(x, y: float): float = x + y
proc exec(fn: (float, float) -> float): float = fn(2, 2)

echo exec(add) #4.0
echo exec((x, y) => x + y) #4.0