ImageFont = SuperFont:subclass "ImageFont"
-- Can be used to draw text on screen.

local loveNewImageFont = love.graphics.newImageFont

function ImageFont:initialize(...)
	super.initialize(self, loveNewImageFont(...))
end
