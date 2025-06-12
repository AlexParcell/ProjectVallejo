return function()
	local tilemap = {}
	tilemap.tiles = {}
	tilemap.GRID_SIZE = 50
	tilemap.spriteSheet = love.graphics.newImage("sprites/mars-tileset.png")
	tilemap.tileScale = 1.5
	tilemap.tileTextureSize = 32
	tilemap.tilesInSpritesheetX = 8
	tilemap.tilesInSpritesheetY = 8
	tilemap.tilesize = tilemap.tileTextureSize * tilemap.tileScale
	tilemap.gridsize = tilemap.GRID_SIZE * tilemap.tilesize

	for y=0, tilemap.GRID_SIZE do
		local row = {}
		for x=0, tilemap.GRID_SIZE do
			local newTile = require("source.tile")()
			newTile.x = x
			newTile.y = y
			local randomX = love.math.random(tilemap.tilesInSpritesheetX - 1)
			local randomY = love.math.random(tilemap.tilesInSpritesheetY - 1)

			newTile.renderQuad = love.graphics.newQuad(
				randomX * tilemap.tileTextureSize, 
				randomY * tilemap.tileTextureSize, 
				tilemap.tileTextureSize, 
				tilemap.tileTextureSize, 
				tilemap.spriteSheet
			)

			table.insert(row, newTile)
		end
		table.insert(tilemap.tiles, row)
	end

	tilemap.draw = function()
		for y,row in pairs(tilemap.tiles) do
			for x,tile in pairs(row) do
				love.graphics.draw(
					tilemap.spriteSheet, 
					tile.renderQuad, 
					(x * tilemap.tilesize) - (tilemap.gridsize/2), 
					(y * tilemap.tilesize) - (tilemap.gridsize/2), 
					0, 
					tilemap.tileScale,
					tilemap.tileScale
				)
			end
		end
	end

	return tilemap
end