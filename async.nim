import os, strutils, asyncdispatch, httpclient

const baseUrl = "http://jsonplaceholder.typicode.com"

proc doRequest(url: string): Future[string] =
  echo "Fetching contents from $1" % url
  result = newAsyncHttpClient().getContent(url)

proc main() {.async.} =
  var requests: seq[Future[string]] = @[]
  for resource in @["posts", "comments", "albums"]:
    requests.add(doRequest(baseUrl / resource))

  echo await all(requests)

waitFor main()

