Font = SuperFont:subclass "Font"
-- Can be used to draw text on screen.

local loveNewFont = love.graphics.newFont

function Font:initialize(...)
	super.initialize(self, loveNewFont(...))
end
