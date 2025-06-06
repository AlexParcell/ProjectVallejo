return function()
	local tilemap = {}
	tilemap.tiles = {}
	tilemap.GRID_SIZE = 50
	tilemap.spriteSheet = love.graphics.newImage("sprites/grass-tileset.png")
	tilemap.tileScale = 1.5
	tilemap.tileTextureSize = 16
	tilemap.tilesInSpritesheet = 16

	for y=0, tilemap.GRID_SIZE do
		local row = {}
		for x=0, tilemap.GRID_SIZE do
			local newTile = require("source.tile")()
			newTile.x = x
			newTile.y = y
			local randomX = love.math.random(tilemap.tilesInSpritesheet - 1)
			local randomY = love.math.random(tilemap.tilesInSpritesheet - 1)
			newTile.renderQuad = love.graphics.newQuad(randomX * tilemap.tileTextureSize, 
				randomY * tilemap.tileTextureSize, 
				tilemap.tileTextureSize, 
				tilemap.tileTextureSize, tilemap.spriteSheet)
			table.insert(row, newTile)
		end
		table.insert(tilemap.tiles, row)
	end

	tilemap.draw = function()
		local DrawOffset = ((tilemap.GRID_SIZE/2) * (16 * tilemap.tileScale))
		for y,row in pairs(tilemap.tiles) do
			for x,tile in pairs(row) do
				love.graphics.draw(tilemap.spriteSheet, tile.renderQuad, 
				(x * (16 * tilemap.tileScale)) - DrawOffset, 
				(y * (16 * tilemap.tileScale)) - DrawOffset, 
				0, tilemap.tileScale, tilemap.tileScale)
			end
		end
	end

	return tilemap
end