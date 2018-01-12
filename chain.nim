type
  Number* = object
    a*: int

# `var` param and return type
# since we need to mutate it in the chained call
proc add*(self: var Number; x: int): var Number =
  self.a += x
  return self

proc mul*(self: var Number; x: int): var Number =
  self.a *= x
  return self

proc val*(self: Number): int =
  return self.a

when isMainModule:
  var num = Number(a: 9)
  echo num.add(10).mul(2).val() #38
