Class = require 'hump.class'
SuperFont = require 'loveclass.superfont'

local loveNewFont = love.graphics.newFont

-- Can be used to draw text on screen.
local Font = Class(function(...)
	SuperFont.construct(self, loveNewFont(...))
end)
Font:inherit(SuperFont)

return Font
