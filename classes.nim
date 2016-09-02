type
  MyClass = ref object of RootObj
    name: string
    age : int

proc Info(self: MyClass) =
  echo "My name: " & self.name
  echo "My age: " & $self.age #convert int to string

let myObject = MyClass(name: "SlimShady", age: 42)
myObject.Info()

assert(myObject of MyClass)

type
  MyAnotherClass = ref object of MyClass
    occupation: string

proc Info(self: MyAnotherClass) =
  Info(MyClass(self)) #super Info call
  echo "My occupation: " & self.occupation

let myAnotherObject = MyAnotherClass(name: "SlimShady",
                                     age: 42,
                                     occupation: "Rapper")
myAnotherObject.Info()

assert(myAnotherObject of MyClass)
assert(myAnotherObject of MyAnotherClass)

# Simple heterogenous composition of data in Nim
type
  MyTuple = tuple[name: string, age: int]

var
  person: MyTuple = (name: "SlimShady", age: 41)
