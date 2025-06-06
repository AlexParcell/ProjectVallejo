require("source.globals")

function love.load()
	require("source.startup.startup")()
end

function love.update(dt)
	require("source.update")(dt)
end

function love.draw()
	require("source.draw")()
end