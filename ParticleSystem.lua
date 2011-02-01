ParticleSystem = Drawable:subclass "ParticleSystem"
-- Used to create cool effects, like fire. The particle systems are created and drawn on the screen using functions in love.graphics. They also need to be updated in the update(dt) callback for you to see any changes in the particles emitted.

local loveNewParticleSystem = love.graphics.newParticleSystem

function ParticleSystem:initialize(...)
	Drawable.initialize(self, loveNewParticleSystem(...))
end
