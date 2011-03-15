local queue = {}

-- This is a loveclass exclusive object. It implements soundmanager functionality.
local SoundEffect = Class(function(self, ...)
	self.object = love.sound.newSoundData(...)
	self.looping = false
	self.pitch = 1
	self.volume = 1
	self.playing = 0
end)

function SoundEffect:play()
	local src = love.audio.newSource(self.object, "static")
	src:setLooping(self.looping)
	src:setPitch(self.pitch)
	src:setVolume(self.volume)
	love.audio.play(src)
	self.playing = self.playing + 1
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

Timer.addPeriodic(1, function ()
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

return SoundEffect
