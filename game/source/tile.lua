local UID = 0
local MakeTile = function()
	UID = UID + 1

	local tile = {}
	tile.test = "hi"
	tile.id = UID

	return tile
end

return MakeTile;