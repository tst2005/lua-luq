local function hello(who)
	return ("hello "..(who or "world").."!")
end

print(hello())
