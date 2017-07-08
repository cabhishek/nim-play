import os, locks

var
  threads: array[0..4, Thread[int]]
  channel: Channel[string]
  counter: int
  lock: Lock

proc worker(interval: int) {.thread.} =
  while true:
    var data = channel.tryRecv()
    if data.dataAvailable:
      echo "> Got msg: " & data.msg
      echo "> Doing work"
      acquire(lock)
      counter += 1 #shared data
      release(lock)
      sleep(interval) # long running work
      echo "> Done with work"
      break
    else:
      # slow the channel poll
      sleep(interval)
      echo "> Waiting for work"

when isMainModule:
  initLock(lock)
  channel.open()
  defer: channel.close()

  for i in 0..high(threads):
    createThread(threads[i], worker, 200)

  for i in 0..high(threads):
    sleep(50) # delay to start work
    channel.send("Start work") # signal

  joinThreads(threads) # wait for completion

  echo "Counter value: " & $counter
