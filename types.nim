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

echo table.hasKey("one")

#openArray
proc openArraySize(oa: openArray[int]): int =
  oa.len
assert openArraySize(@[1,2,3,4]) == 4

#string
var
  str1 = newString(1)
  #or
  str2: string = "nim lang."
str1 = "nim lang."
echo str1[0..^1] #len-1
echo str2[0..^1]

#rangetype
type
  Subrange = range[0..5]
var
  sub: Subrange = 2
echo sub
#var
  #sub2: Subrange = 6 #compiler error
