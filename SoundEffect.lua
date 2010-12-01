SoundEffect = class "SoundEffect"
-- This is a loveclass exclusive object. It implements soundmanager functionality.

local queue = {}

function SoundEffect:initialize(...)
	self.object = love.sound.newSoundData(...)
	self.looping = false
	self.pitch = 1
	self.volume = 1
end

function SoundEffect:play()
	local src = love.audio.newSource(self.object, "static")
	src:setLooping(self.looping)
	src:setPitch(self.pitch)
	src:setVolume(self.volume)
	love.audio.play(src)
	table.insert(queue, src)
end

function SoundEffect:setLooping(looping)
	self.looping = looping
end
function SoundEffect:setPitch(pitch)
	self.pitch = pitch
end
function SoundEffect:setVolume(volume)
	self.volume = volume
end

addUpdateFunc(function ()
	local removelist = {}
	for i,v in ipairs(queue) do
		if v:isStopped() then
			table.insert(removelist, i)
		end
	end
	table.foreach(removelist, function(_, key)
		table.remove(queue, key)
	end)
end)
