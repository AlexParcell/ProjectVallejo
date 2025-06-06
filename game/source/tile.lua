local UID = 0
return function()
	UID = UID + 1
	local tile = {}
	tile.id = UID
	return tile
end