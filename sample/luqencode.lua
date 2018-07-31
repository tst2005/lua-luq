#! /usr/bin/env lua
io.stdout:write(require"luq".encode(io.stdin:read("*a")))
