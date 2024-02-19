# Presto/HTTPClient library HTTP 204 bug

This is reproduction repository for bug which happens for nim-presto and the Nim's HTTPClient.

It happens when the server returns HTTP 204 empty response (that is correctly received etc.),
but the **next GET request** will fail with `Connection was closed before full request has been made`

### To reproduce

```bash
$ nimble server

# in different terminal
$ nimble test

[Suite] http 204 request/response
  [OK] ping-pong
    Unhandled exception: Connection was closed before full request has been made [ProtocolError]
  [FAILED] 204
```


