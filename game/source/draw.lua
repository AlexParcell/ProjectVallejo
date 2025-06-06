local function draw()
	love.camera.setCameraRenderingActive(true)
	tilemap:draw()
	player:draw()
	love.camera.setCameraRenderingActive(false)
	
	-- draw UI and stuff
end

return draw