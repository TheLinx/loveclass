assert(Object and class, "You need to require MiddleClass before including the LOVE classes")
assert(Stateful, "You need to require Stateful before including the LOVE classes")

local includes = {
	"Vector", "Circle", "Color", -- pseudo-classes
	"Drawable", "Image", "ParticleSystem", "Framebuffer", -- drawables
	"SuperFont", "Font", "ImageFont", -- fonts
	"SoundEffect", "Music", -- sound stuff
	"Quad", -- other objects
	"StringExtensions", -- other includes
}

local updatefuncs = {}
function addUpdateFunc(func)
	table.insert(updatefuncs, func)
end

function loveclassindex(t,k)
 --[[ local self_it = rawget(t,k)
  if self_it then return self_it end
  local self_obj = rawget(t, "__oldindex")[k]
  if self_obj then return self_obj end
  local obj_func = rawget(t, "object")[k]
  if obj_func then
    return function(self, ...)
      return obj_func(self.object, ...)
    end
  end
  return nil]]
	print(rawget(t, k), rawget(t, "__oldindex"), rawget(t, "object"))
	return rawget(t,k)
	 or rawget(t, "__oldindex")[k]
	 or (rawget(t, "object")[k] and
	  function(self, ...)
			return rawget(t, "object")[k](self.object, ...)
		end
	 )
end

local s = ({...})[1]:gsub(".init", "").."."
for _,n in pairs(includes) do
	require(s..n)
end

addUpdateFunc = nil
loveclassindex = nil

loveclass = {}
function loveclass.update(dt)
	for i, func in ipairs(updatefuncs) do
		func(dt)
	end
end
