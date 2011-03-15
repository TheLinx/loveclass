local loveDraw = love.graphics.draw

-- Superclass for all things that can be drawn on screen. This is an abstract type that can't be created directly.
local Drawable = Class(function(self, object)
	self.object = object
end)

function Drawable:draw(...)
	loveDraw(self.object, ...)
end

local old = Drawable.__index
function Drawable:__index(name)
	if old[name] then return old[name] end
	if not self.object then return nil end
	local func = self.object[name]
	if func then
		return function(self, ...)
			return func(self.object, ...)
		end
	end
end

return Drawable
