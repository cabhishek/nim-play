import os, strutils, json, asyncdispatch, httpclient

const BASE_URL = "http://jsonplaceholder.typicode.com"

proc doRequest(url: string): Future[string] =
  echo "Fetching contents from $1" % url
  result = newAsyncHttpClient().getContent(url)

proc main() {.async.} =
  var requests: seq[Future[string]] = @[]
  for resource in @["posts", "comments", "albums"]:
    requests.add(doRequest(BASE_URL / resource))

  echo await all(requests)

waitFor main()

