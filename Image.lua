Image = Drawable:subclass "Image"
-- Drawable image type.

local loveNewImage = love.graphics.newImage
local loveDrawq = love.graphics.drawq

function Image:initialize(...)
	Drawable.initialize(self, loveNewImage(...))
end

function Image:drawq(quad, ...)
	if quad.object then
		quad = quad.object
	end
	loveDrawq(self.object, quad, ...)
end
