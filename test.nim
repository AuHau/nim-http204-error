import unittest
import httpclient


suite "http 204 request/response":
  test "ping-pong":
    let client = newHttpClient()
    let response = client.get("http://127.0.0.1:8000/ping")
    check response.status == "200 OK"
    check response.body == "pong"
  test "204":
    let client = newHttpClient()
    let patchResponse = client.patch("http://127.0.0.1:8000/patch")
    check patchResponse.status == "204 No Content"

    let response = client.get("http://127.0.0.1:8000/ping")
    check response.status == "200 OK"
    check response.body == "pong"
