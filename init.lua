assert(Object and class, "You need to require MiddleClass before including the LOVE classes")
assert(Indexable, "You need to require MiddleClass-Extras before including the LOVE classes")

local includes = {
	"Vector", "Circle", "Color", -- pseudo-classes
	"Drawable", "Image", "ParticleSystem", "Framebuffer", -- drawables
	"SuperFont", "Font", "ImageFont", -- fonts
	"SoundEffect", "Music", -- sound stuff
	"Quad", -- other objects
	"StringExtensions", -- other includes
}

local updatefuncs = {}
local olde = addUpdateFunc -- in case this exists
function addUpdateFunc(func)
	table.insert(updatefuncs, func)
end

local s = ({...})[1]:gsub(".init", "").."."
for _,n in pairs(includes) do
	require(s..n)
end

addUpdateFunc = olde -- restore it. if it didn't exist in the first place, it'll go nil.

loveclass = {}
function loveclass.update(dt)
	for i, func in ipairs(updatefuncs) do
		func(dt)
	end
end
