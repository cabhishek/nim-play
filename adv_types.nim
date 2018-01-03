type
  Person = object
    name: string

proc create(T: typedesc): ref T = new(T)

when isMainModule:
  let p = create(Person) # ref type
  p.name = "john"
  assert p of Person
  assert p is ref Person
  var p_copy = p
  p_copy.name = "john_copy"

  echo p.name       # john_copy
  echo p_copy.name  # john_copy

  let p2 = Person(name: "adam") # not a ref type
  var p2_copy = p2

  p2_copy.name = "adam_copy"

  echo p2.name        # adam
  echo p2_copy.name   # adam_copy
  assert p2 is Person
  assert p2 of Person
