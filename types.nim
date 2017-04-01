import strutils, sequtils, tables

#Object
type
  Person = object
    name : string
    age: int

proc info(a: Person) =
  echo a.name & " " & " " & $a.age

let person1 = Person(name:"Luke Cage", age:31)
person1.info()

#tuple
type
  Address = tuple[street: string, city: string, zip: int]
var
  address: Address = (street: "Diamond", city: "San Francisco", zip: 94131)

proc `$`(address: Address): string =
  return address.street & " " & address.city & " " & $address.zip

echo $address

#set
type
  Charset = set[char]
var
  x: Charset = {'a'..'z', '1'..'9'}
echo 'a' in x and '1' in x

#varargs
proc join(args: varargs[string]): string =
  var seq = newSeq[string]()
  for arg in items(args): seq.add(arg)
  return join(seq, "-")

echo join("a", "b", "c")

#tables
var
  table = newTable[string, int]()
table["one"] = 1
table["two"] = 2

echo table

#openArray
proc openArraySize(oa: openArray[int]): int =
  oa.len
assert openArraySize(@[1,2,3,4]) == 4
