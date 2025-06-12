return function()
	love.camera.setCameraRenderingActive(true)
	if g_activeLevel then
		g_activeLevel:draw()
	end
	love.camera.setCameraRenderingActive(false)
	
	if g_ui then
		g_ui:draw()
	end
	-- draw UI and stuff
end