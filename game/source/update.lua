return function(deltaTime)
	if g_activeLevel then
		g_activeLevel:update(deltaTime)
	end
	if (g_ui) then
		g_ui:update(deltaTime)
	end
end