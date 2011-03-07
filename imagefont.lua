Class = require 'hump.class'
SuperFont = require 'loveclass.superfont'

local loveNewImageFont = love.graphics.newImageFont

-- Can be used to draw text on screen.
local ImageFont = Class(function(...)
	SuperFont.construct(self, loveNewImageFont(...))
end)
ImageFont:inherit(SuperFont)

return ImageFont
