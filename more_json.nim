import json

let
  small_json = """{"one": 1, "two": 2, "three": {"value": 3}}"""
  jobj = parseJson(small_json)

assert (jobj.kind == JObject)
echo jobj["three"]["value"]

jobj["four"] = %* {"value": 4} #add new key
echo jobj.pretty

for k, v in pairs(jobj): echo k, v

var j = %* [{"one":1}, {"two": 2}]
echo j[0]["one"]
