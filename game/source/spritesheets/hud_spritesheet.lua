local baseImage = love.graphics.newImage("sprites/ui_spritesheet.png")
local tile_size = 32

-- SERA.AP: transform spritesheet tile index to actual pixel coordinate on image
local idx_to_img = function(idx) return (idx*tile_size) end

return {
	["image"] = baseImage,
	["sprite_quads"] = 
	{
		["gray_rect"] = love.graphics.newQuad(
			idx_to_img(1), idx_to_img(1), idx_to_img(3), idx_to_img(2), baseImage
		),
		["blue_rect"] = love.graphics.newQuad(
			idx_to_img(4), idx_to_img(1), idx_to_img(3), idx_to_img(2), baseImage
		),
		["yellow_rect"] = love.graphics.newQuad(
			idx_to_img(7), idx_to_img(1), idx_to_img(3), idx_to_img(2), baseImage
		)
	}
}