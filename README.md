# lua luq

Lua quick

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

Take a look at https://github.com/tst2005/lua-luq/blob/master/luq.lua#L11-L23

There is some decode alternatives
* `!T` -> `then`
* `!(` -> `do`
* `!)` -> `end`
