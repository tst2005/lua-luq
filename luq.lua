

local E = {{"!","!x"}}
local function add(t)
	for n=1,#t,2 do
		E[#E+1]={ t[n], E[1][1]..t[n+1] }
	end
end

add{
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
	"while ", "W",

	"print", "p",
	"require", "<",
}

local gsub = string.gsub
local function gsubstr(data, str1, str2)
	return gsub(data, gsub(str1, "([%^%$%(%)%%%.%[%]%*%+%-%?%)])", "%%%1"), str2)
end
local function encode(data)
	for _i,kv in ipairs(E) do
		data = gsubstr(data, kv[1], kv[2])
	end
	return data
end
local function decode(data)
	for i=#E,1,-1 do
		local kv=E[i]
		data = gsubstr(data, kv[2], kv[1])
	end
	return data
end

return {encode = encode, decode = decode}
