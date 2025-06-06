return function(deltaTime)
	if g_activeLevel then
		g_activeLevel:update(deltaTime)
	end
end