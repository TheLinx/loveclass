Music = class("Music"):include(Indexable)

local loveNewSource = love.audio.newSource
local nowplaying

function Music:initialize(...)
	self.object = loveNewSource(...)
end

function Music:play()
	if nowplaying then
		love.audio.stop(nowplaying)
	end
	self.object:play()
	nowplaying = self.object
end

function Music.stop()
	if nowplaying then
		love.audio.stop(nowplaying)
	end
	nowplaying = nil
end

function Music:index(name)
  if not self.object then return nil end
  local func = self.object[name]
  if func then
    return function(self, ...)
      return func(self.object, ...)
    end
  end
end
