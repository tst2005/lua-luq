
local G = _G
if not G.package.searchpath or not G.package.searchers then
	print("use uniformapi")
	-- for lua 5.1 (for package.searchers, package.searchpath, load)
	G = require "uniformapi"(G)
end
local package = assert(G.package)
local load = assert(G.load)
local io_open = assert(G.io.open)
local searchers = assert(G.package.searchers)

local decode = assert(require "luq".decode)

-- luq to lua
local function get(fd)
	return decode(fd:read("*a"))
end

local function myloader(name)
	-- use package.luqpath or convert package.path to use .luq files instead of .lua ones
	local path = package.luqpath or (package.path..";"):gsub("%.lua;",".luq;"):sub(1,-2)

	-- Usage: package.searchpath (name, path [, sep [, rep]])
	local found, err = package.searchpath(name, path)
	if not found then
		return nil, err
	end
	local fd = io_open(found, "r")
	local luacode = get(fd)
	fd:close()
	local f = assert(load(luacode))
	return f
end

assert( type(searchers)=="table" )
table.insert(searchers, myloader)
return {}
