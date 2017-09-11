type Vector = tuple[x, y: int]

proc add(a, b: Vector): Vector =
  (a.x + b.x, a.y + b.y)

let
  v1 = (x: -1, y: 4)
  v2 = (x: 5, y: -2)

  v3 = add(v1, v2) # (x: 4, y: 2)
  v4 = v1.add(v2) # (x: 4, y: 2)
  v5 = v1.add(v2).add(v1) # (x: 3, y: 6)

