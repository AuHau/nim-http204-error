# Package

version       = "0.0.1"
author        = "nim-serde authors"
description   = "Easy-to-use serialization capabilities (currently json only), with a drop-in replacement for std/json."
license       = "MIT"
skipDirs      = @["tests"]


# Dependencies
requires "nim >= 1.6.14"
requires "presto"


task test, "Run the test":
  exec "nimble install -d -y"
  exec "nim c -r test"

task server, "Run the server":
  exec "nimble install -d -y"
  exec "nim c -r server"
