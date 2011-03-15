SuperFont = require(({...})[1]:gsub("font$", "superfont"))

local loveNewFont = love.graphics.newFont

-- Can be used to draw text on screen.
local Font = Class(function(self, ...)
	SuperFont.construct(self, loveNewFont(...))
end)
Font:inherit(SuperFont)

return Font
