local E = {{"!","!x"}}
local invalidpattern = "x"

local gsub = string.gsub
local function match_plaintext_as_lua_re(plainpattern)
	local luaregexppattern = gsub(plainpattern, "([%^%$%(%)%%%.%[%]%*%+%-%?%)])", "%%%1")
	return luaregexppattern
end

local function add(t)
	for n=1,#t,2 do
		E[#E+1]={ t[n], E[1][1]..t[n+1] }
		invalidpattern = invalidpattern .. match_plaintext_as_lua_re(t[n+1])
	end
	invalidpattern = E[1][1].."[^"..invalidpattern.."]"
end

add{
	"io.stdin:read", "0",
	"io.stdout:write", "1",
	"io.stderr:write", "2",

	"local", "L",
	"function", "F",
	"if", "I",
	"then", ":",
	"then", "T",
	"do", "D",
	"do", "(",
	"end", ".",
	"end", ")",
	"else", "E",
	"return", "R",
	"while", "W",

	"print", "p",
	"require", "<",
}
assert( invalidpattern == "![^x012LFI:TD%(%.%)ERWp<]", "please debug the invalidpattern check :"..invalidpattern )

local function gsubstr(data, str1, str2)
	return gsub(data, match_plaintext_as_lua_re(str1), str2)
end
local function encode(data)
	for _i,kv in ipairs(E) do
		data = gsubstr(data, kv[1], kv[2])
	end
	return data
end
local function invalidluq(data)
	return string.find(data, invalidpattern)
end
local function decode(data)
	if invalidluq(data) then
		--return nil, "invalid luq format"
		error("invalid luq format")
	end
	for i=#E,1,-1 do
		local kv=E[i]
		data = gsubstr(data, kv[2], kv[1])
	end
	return data
end

return {encode = encode, decode = decode}
