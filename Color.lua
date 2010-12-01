Color = class "Color"

function Color:initialize(r, g, b, a)
	self.r = r
	self.g = g
	self.b = b
	self.a = a
end
function Color:set()
	local a = self.a or select(4, love.graphics.getColor())
	love.graphics.setColor(self.r, self.g, self.b, a)
end
function Color:setBackground()
	love.graphics.setBackgroundColor(self.r, self.g, self.b)
end
