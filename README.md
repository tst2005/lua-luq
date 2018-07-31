# lua luq

Lua quick

Substitue most used lua keywords to a quick shortcut.
Lua almost never use the `!` character, then it is use!

## shortcut convention

I use upper case for lua reserved word and lower case for usual function name.

# Samples

## Hello world

In `lua` :
```lua

local function hello()
	print("hello world!")
end
hello()
```

In `luq` :
```lua

!L !F hello()
	!p("hello world!")
!.
hello()
```

## more sample

The [test.luq.lua](test.luq.lua)

In luq
```lua
#!x /usr/bin/env lua

!L luq = !<"luq"

!L data = io.stdin:read("*a")
!L qata = luq.encode(data)
!p(qata)
assert(data == luq.decode(qata))
!L delta = (#data-#qata)
!p("OK")
!p(math.floor(-delta/#data*100).."% ("..#data.." - "..#qata.." = "..delta..")")
```

## list of substitutions

* `local` <-> `!L`
* `function` <-> `!F`
* `return ` <-> `!R`
* `if` `then` `else` `end` <-> `!I` `!:` `!E` `!.`
* `while` `do` `end` <-> `!W` `!D` `!.`
* `print` <-> `!p`
* `require` <-> `!<`
* `!` -> `!x`

There is some decode alternatives
* `!T` -> `then`
* `!(` -> `do`
* `!)` -> `end`

So we can have
* `!I` `!T` `!E` `!.` -> `if` `then` `else` `end`
* `!W` `!(` `!)` -> `while` `do` `end`

For the exact list take a look at https://github.com/tst2005/lua-luq/blob/master/luq.lua#L19-L33

