Framebuffer = Drawable:subclass "Framebuffer"
-- A Framebuffer is used for off-screen rendering. Think of it as an invisible screen that you can draw to, but that will not be visible until you draw it to the actual visible screen. It is also known as "render to texture".

local loveNewFramebuffer = love.graphics.newFramebuffer

function Framebuffer:initialize(...)
	Drawable.initialize(self, loveNewFramebuffer(...))
end
