import json, strutils

let
  small_json = """{"one": 1, "two": 2, "three": {"value": 3}, "four": {}}"""
  jobj = parseJson(small_json)

assert jobj.kind == JObject
echo jobj["three"]["value"]

#check key
assert jobj.hasKey("one") == true

#check if empty
assert jobj["four"].len == 0

#non existing key
assert jobj{"foo"}.isNil == true

# non existing key default val
assert jobj{"foo"}.getStr("default") == "default"

#add new key
jobj["five"] = %* {"value": 5}
echo jobj.pretty

# create new json
var j = %* [{"one":1}, {"two": 2}]
echo j[0]["one"]

# loop
for k, v in pairs(jobj): echo k, v

echo repeat("=", 20)

