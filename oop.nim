type
  Person = ref object of RootObj
    name* : string
    age   : int

  Student = ref object of Person
    id : int
var
  student : Student
  person : Person

proc getID(x: Person): int =
  Student(x).id

assert(student of Student)
student = Student(name: "Slim shady", age: 41, id:2)

echo student[]
echo student.getID()

person = Person(name:"a", age: 2) #Create a Person object
echo(person.name)

type
  Socket* = ref object of RootObj
    host: int

proc `host=`*(s: var Socket, value: int) {.inline.} =
  s.host = value # setter

proc host*(s: Socket): int {.inline.} =
  s.host # getter

var s:Socket
new(s)
s.host=34 # set value

echo(s.host) # get value
