import macros

macro print(stmtList): typed =

  expectKind(stmtList, nnkStmtList)
  expectLen(stmtList, 3)
  result = newNimNode(nnkStmtList)

  for s in stmtList:
    result.add(newCall(ident("echo"), s))

print:
  3 * 2
  4 div 2
  "hello, world"
