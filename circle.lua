Class = require 'hump.class'

-- A circle.
local Circle = Class(function(position, radius)
	self.position = position
	self.radius = radius
end)

function Circle:colliding(other)
	return self.position:distance(other.position) < self.radius + other.radius
end

return Circle
