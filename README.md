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

