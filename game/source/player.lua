player = {}

player.position = {
	["x"] = 0,
	["y"] = 0
}

player.animationYOffset = 320;
player.spriteSheet = love.graphics.newImage("sprites/player/character-spritesheet.png")
for i,k in pairs(love) do
	print(i)
end

player.animation = love.animation.newAnimation(player.spriteSheet, 0, 0, 8, 1, 0, 64, 64, 0.1)
player.playerIsMoving = false
player.movementSpeed = 100

player.spritesheetOffsets = {
	["up_run"] = 0,
	["down_run"] = 64,
	["left_run"] = 128,
	["right_run"] = 192,
	["up_idle"] = 256,
	["down_idle"] = 320,
	["left_idle"] = 384,
	["right_idle"] = 448
}

player.idleOffset = player.spritesheetOffsets["up_idle"]

player.inputFunctions = 
{
	['a'] = function(deltaTime)
		player.playerIsMoving = true
		player.animationYOffset = player.spritesheetOffsets.left_run
		player.position.x = player.position.x - (player.movementSpeed * deltaTime)
	end,
	['s'] = function(deltaTime)
		player.playerIsMoving = true
		player.animationYOffset = player.spritesheetOffsets.down_run
		player.position.y = player.position.y + (player.movementSpeed * deltaTime)
	end,
	['d'] = function(deltaTime)
		player.playerIsMoving = true
		player.animationYOffset = player.spritesheetOffsets.right_run
		player.position.x = player.position.x + (player.movementSpeed * deltaTime)
	end,
	['w'] = function(deltaTime)
		player.playerIsMoving = true
		player.animationYOffset = player.spritesheetOffsets.up_run
		player.position.y = player.position.y - (player.movementSpeed * deltaTime)
	end
}

function player:update(deltaTime)
	player.playerIsMoving = false

	for key,inputFunc in pairs(player.inputFunctions) do
		if (love.keyboard.isDown(key)) then
			inputFunc(deltaTime)
			break
		end
	end

	-- set to idle variant of animation if not moving
	if not player.playerIsMoving and player.animationYOffset < player.idleOffset then
		player.animationYOffset = player.animationYOffset + player.idleOffset
	end

	love.camera.setCameraLocation(player.position.x + 64, player.position.y + 32)

	love.animation.update(player.animation, deltaTime)
	love.animation.setOffset(player.animation, 0, player.animationYOffset)
end

function player:draw()
	local quad, texture = love.animation.getDrawData(player.animation)
	love.graphics.draw(texture, quad, player.position.x, player.position.y, 0, 1, 1)
end