Drawable = require(({...})[1]:gsub("framebuffer$", "drawable"))

local loveNewFramebuffer = love.graphics.newFramebuffer

-- A Framebuffer is used for off-screen rendering. Think of it as an invisible screen that you can draw to, but that will not be visible until you draw it to the actual visible screen. It is also known as "render to texture".
local Framebuffer = Class(function(self, ...)
	Drawable.construct(self, loveNewFramebuffer(...))
end)
Framebuffer:inherit(Drawable)

return Framebuffer
