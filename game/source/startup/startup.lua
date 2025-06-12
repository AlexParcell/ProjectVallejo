return function()
	love.window.setTitle("SERAPHINE RPG")
	love.window.setIcon(love.image.newImageData("sprites/seraphine-icon.png"))
	g_activeLevel = require("source.level")()
	g_ui = require("source.ui.ui")()
	g_ui:AddWidget("hud")
end