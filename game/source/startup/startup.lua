function startup()
	love.window.setTitle("SERAPHINE RPG")

	love.window.setIcon(love.image.newImageData("sprites/seraphine-icon.png"))

	require("source.startup.main_require")
	GetMainRequires()
end