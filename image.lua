Drawable = require(({...})[1]:gsub("image$", "drawable"))

local loveNewImage = love.graphics.newImage
local loveDrawq = love.graphics.drawq

-- Drawable image type.
local Image = Class(function(self, ...)
	Drawable.construct(self, loveNewImage(...))
end)
Image:inherit(Drawable)

function Image:drawq(quad, ...)
	if quad.object then
		quad = quad.object
	end
	loveDrawq(self.object, quad, ...)
end

return Image
