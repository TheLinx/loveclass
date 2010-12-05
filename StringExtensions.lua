local string_mt = getmetatable ""

string_mt.__index.print = love.graphics.print
string_mt.__index.printf = love.graphics.printf

function string_mt.__index.explode(str, div)
  assert(type(str) == "string" and type(div) == "string", "invalid arguments")
  local o = {}
  while true do
    local pos1,pos2 = str:find(div)
    if not pos1 then
      o[#o+1] = str
      break
    end
    o[#o+1],str = str:sub(1,pos1-1),str:sub(pos2+1)
  end
  return o
end

function string_mt.__add(a, b)
	return a..b
end
function string_mt.__sub(a, b)
	return a:gsub(b, "")
end
function string_mt.__mul(a, b)
	return a:rep(b)
end
function string_mt.__div(a, b)
	return a:explode(b)
end
function string_mt.__index(str, id)
	if type(id) ~= "number" then
		return string[id]
	end
	return str:sub(id, id)
end
