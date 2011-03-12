local loveNewQuad = love.graphics.newQuad

-- A quadrilateral with texture coordinate information.
function Quad:initialize(self, ...)
	self.object = loveNewQuad(...)
end

function Quad:__index(name)
  if not self.object then return nil end
  local func = self.object[name]
  if func then
    return function(self, ...)
      return func(self.object, ...)
    end
  end
end

return Quad
