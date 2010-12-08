SuperFont = class("SuperFont"):include(Indexable)
-- You shouldn't use this class.

local loveSetFont = love.graphics.setFont
local loveGetFont = love.graphics.getFont
local lovePrint = love.graphics.print
local lovePrintf = love.graphics.printf

function SuperFont:initialize(object)
	self.object = object
end

function SuperFont:set()
	loveSetFont(self.object)
end

function SuperFont:_print(f, ...)
	local oldfont = loveGetFont()
	self:set()
	f(...)
	loveSetFont(oldfont)
end
function SuperFont:print(...)
	self:_print(lovePrint, ...)
end
function SuperFont:printf(...)
	self:_print(lovePrintf, ...)
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
