import threadpool, locks

var lock: Lock
initLock(lock)

var counter {.guard: lock.} = 0

proc increment(x: int) = 
  for i in 0.. <x:
    withLock lock:
      inc(counter)

spawn increment(10_000)
spawn increment(10_000)

sync()
echo counter # 20000