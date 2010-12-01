Quad = class "Quad"
-- A quadrilateral with texture coordinate information.

local loveNewQuad = love.graphics.newQuad

function Quad:initialize(...)
	self.object = loveNewQuad(...)
end

function SuperFont:index(name)
  if not self.object then return nil end
  local func = self.object[name]
  if func then
    return function(self, ...)
      return func(self.object, ...)
    end
  end
end
