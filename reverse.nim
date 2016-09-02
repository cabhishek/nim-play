proc reverse(a: string): string =
  result = a #result is an implict variable which is returned automatically
  var
    first = low(a)
    last = high(a)

  while last > first:
    swap(result[first], result[last])
    dec(last)
    inc(first)

echo reverse("SlimShady")

