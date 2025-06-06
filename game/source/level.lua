return function()
	local level = {}
	level.player = require("source.player")()
	level.tilemap = require("source.tilemap")()

	function level:update(deltaTime)
		level.player:update(deltaTime)
	end

	function level:draw()
		level.tilemap:draw()
		level.player:draw()
	end

	return level
end