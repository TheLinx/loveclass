Vector = class "Vector"
function Vector:initialize(x, y)
	if tonumber(x) then
		self.x = x
		self.y = y
	else
		self.x = x[1] or x.x
		self.y = x[2] or x.y
	end
end

function Vector:round()
	return math.floor(self.x+0.5), math.floor(self.y+0.5)
end

function Vector:reverse()
	return self.y, self.x
end

function Vector:length()
	return math.sqrt(self.x^2 + self.y^2)
end

function Vector:normalize()
	local length = self:length()
	return Vector(self.x/length, self.y/length)
end

function Vector:rotate(angle, around)
	local vec = self
	if around then
		vec = vec - around
	end
	vec = Vector(vec.x * math.cos(angle) - vec.y * math.sin(angle),
	             vec.x * math.sin(angle) + vec.y * math.cos(angle))
	if around then
		return vec + around
	end
	return vec
end

function Vector:distance(other)
	return (self - other):length()
end

-- metamethods
function Vector:__tostring()
	return "(" .. tostring(self.x) .. ", " .. tostring(self.y) .. ")"
end
function Vector:__add(other)
	if type(other) == "number" or type(other) == "string" then -- assume other as x and y
		return Vector(self.x + other, self.y + other)
	else -- adding two Vectors
		return Vector(self.x + other.x, self.y + other.y)
	end
end
function Vector:__sub(other)
	return Vector(self.x - other.x, self.y - other.y)
end
function Vector:__mul(by)
	if type(by) == "number" or type(by) == "string" then -- scalar
		return Vector(self.x * by, self.y * by)
	else -- dot product
		return self.x * by.x + self.y * by.y
	end
end
function Vector:__eq(other)
	if type(other) ~= "table" then return false end
	if not other.x or not other.y then return false end
	return (self.x == other.x) and (self.y == other.y)
end
function Vector:__lt(other)
	return self.x < other.x and self.y < other.y
end
function Vector:__gt(other)
	return self.x > other.x and self.y > other.y
end
function Vector:__unm()
	return Vector(-self.x, -self.y)
end
