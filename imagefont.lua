SuperFont = require(({...})[1]:gsub("imagefont$", "superfont"))

local loveNewImageFont = love.graphics.newImageFont

-- Can be used to draw text on screen.
local ImageFont = Class(function(self, ...)
	SuperFont.construct(self, loveNewImageFont(...))
end)
ImageFont:inherit(SuperFont)

return ImageFont
