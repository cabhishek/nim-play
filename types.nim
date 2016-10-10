type
  Person = object
    name : string
    age: int

proc info(a: Person) =
  echo a.name & " " & " " & $a.age

let person1 = Person(name:"Luke Cage", age:31)
person1.info()

