type
  Point = object
    x,y: int
    z: string not nil

proc move(p: var Point) =
  p.x += 2
  p.y += 4

var point: Point # Cannot prove that 'point' is initialized. This will become a compile time error in the future. [ProveInit]

point = Point(x: 10, y:12) # Compiler Error: fields not initialized: z.

move(point)

echo point.z & "test" # SIGSEGV: Illegal storage access. (Attempt to read from nil?)


