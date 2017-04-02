block outer:
  for i in 0..10:
    block inner:
      for j in 0..10:
        if j div 2 != 0: #numerator != 1
          echo "Value of j: " & $j
          break inner
    if i == 5:
      echo "Value of i: " & $i
      break outer

block outer:
  const
    name = "Slim Shady"
    city = "New York"
  var age = 41
  block inner:
    const name = "Luke Cage"
    age = 31
    echo name & city & $age

  echo name & city & $age

block:
  echo "block"

