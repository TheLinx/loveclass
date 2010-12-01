Drawable = class "Drawable"
-- Superclass for all things that can be drawn on screen. This is an abstract type that can't be created directly.

local loveDraw = love.graphics.draw

function Drawable:initialize(object)
	self.object = object
end

function Drawable:draw(...)
	loveDraw(self.object, ...)
end

function Drawable:index(name)
	if not self.object then return nil end
	local func = self.object[name]
	if func then
		return function(self, ...)
			return func(self.object, ...)
		end
	end
end
