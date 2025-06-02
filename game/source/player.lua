player = {}
player.position = {
	["x"] = 0,
	["y"] = 0
}

player.spriteSheet = love.graphics.newImage("sprites/player/character-spritesheet.png")
player.animation = love.animation.newAnimation(player.spriteSheet, 0, 0, 8, 1, 0, 64, 64, 0.5)

function player:update(deltaTime)

end

function player:draw()

end