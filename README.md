# lua luq

Lua quick

Substitue most used lua keywords to a quick shortcut.
Lua almost never use the `!` character, then it is use!

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

For the exact list take a look at https://github.com/tst2005/lua-luq/blob/master/luq.lua#L11-L25

