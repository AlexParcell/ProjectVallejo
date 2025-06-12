return function()
	local level = {}
	level.player = require("source.player")()
	level.tilemap = require("source.tilemap")()

	function level:update(deltaTime)
		level.player:update(deltaTime)
		love.camera.setCameraLocation(level.player.position.x + 32, level.player.position.y + 32)
	end

	function level:draw()
		level.tilemap:draw()
		level.player:draw()
	end

	return level
end