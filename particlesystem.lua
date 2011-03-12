Drawable = require(({...})[1]:gsub("particlesystem$", "drawable"))

local loveNewParticleSystem = love.graphics.newParticleSystem

-- Used to create cool effects, like fire. The particle systems are created and drawn on the screen using functions in love.graphics. They also need to be updated in the update(dt) callback for you to see any changes in the particles emitted.
local ParticleSystem = Class(function(self, ...)
	Drawable.initialize(self, loveNewParticleSystem(...))
end)
ParticleSystem:inherit(Drawable)

return ParticleSystem
