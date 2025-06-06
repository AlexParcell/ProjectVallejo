return function()
	love.camera.setCameraRenderingActive(true)
	if g_activeLevel then
		g_activeLevel:draw()
	end
	love.camera.setCameraRenderingActive(false)
	
	-- draw UI and stuff
end