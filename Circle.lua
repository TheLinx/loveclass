Circle = class "Circle"
-- A circle.

function Circle:initialize(position, radius)
	self.position = position
	self.radius = radius
end

function Circle:colliding(other)
	return self.position:distance(other.position) < self.radius + other.radius
end
