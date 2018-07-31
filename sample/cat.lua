local function process(x)
	io.stdout:write(x.."\n")
end
while true do
	local line = io.stdin:read("*l")
	if not line then break end
	process(line)
end
