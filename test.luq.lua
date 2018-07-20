#! /usr/bin/env lua

local luq = require"luq"

local data = io.stdin:read("*a")
local qata = luq.encode(data)
print(qata)
assert(data == luq.decode(qata))
local delta = (#data-#qata)
print("OK")
print(math.floor(-delta/#data*100).."% ("..#data.." - "..#qata.." = "..delta..")")

