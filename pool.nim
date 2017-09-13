import threadpool

var msg = "hello, world"

proc display(param: string) =
  for i in 0..<10:
    echo $i, param

spawn display(msg)
spawn display(msg)

sync()
