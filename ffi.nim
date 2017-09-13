proc printf(format: cstring):cint {. importc, varargs, header: "stdio.h", discardable .}

printf("My name is %s and I am %d years old!\n", "Ben", 30)

