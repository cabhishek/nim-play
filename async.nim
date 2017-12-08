import os, strutils, asyncdispatch, httpclient, times

const baseUrl = "http://jsonplaceholder.typicode.com"

proc doRequest(url: string): Future[string] {.async.} =
  echo "Fetching: $1" % url
  var t = epochTime()
  result = await newAsyncHttpClient().getContent(url)
  echo "Took: $1s" % $(epochTime() - t)

proc main() {.async.} =
  var requests: seq[Future[string]] = @[]
  for resource in @["posts", "comments", "albums"]:
    requests.add(doRequest(baseUrl / resource))

  echo await all(requests)

waitFor main()

