type
  Parent = ref object of RootObj
      name: string
      
  Father = ref object of Parent
  Mother = ref object of Parent
      
  Student = object
      parent: Parent
      grade: string
      
method getName(self: Parent): string {.base.} = 
  quit("To override")

method getName(self: Father): string = 
  "Father's name: " & self.name

method getName(self: Mother): string = 
  "Mother's name: " & self.name    

let 
  student1 = Student(grade: "A", parent: Father(name: "Jim"))
  student2 = Student(grade: "C", parent: Mother(name: "Jane"))

echo student1.parent.getName() # Father's name: Jim
echo student2.parent.getName() # Mother's name: Jane