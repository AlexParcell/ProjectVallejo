local hud_spritesheet = require("source.spritesheets.hud_spritesheet")

return function()
	local hud = {}

	hud.healthbar = require("source.ui.components.progress_bar")(hud, 50, 50, 100, 20)
	hud.button = require("source.ui.components.button")(hud, 200, 200, 50, 50)
	hud.button.onDownStart = function()
		
	end

	hud.mouseHoversButton = function(b)
		local mx, my = love.mouse.getPosition()
		return mx >= b.position.x and mx <= b.position.x + b.size.w and
			my >= b.position.y and my <= b.position.y + b.size.h
	end

	hud.update = function(deltaTime)
		hud.healthbar.decrement(deltaTime * 100)

		if (hud.bIsFocused and hud.mouseHoversButton(hud.button)) then
			if not hud.button.bIsHovered then
				hud.button.startHover()
			end

			if love.mouse.isDown(1) then
				hud.button.startDown()
			end
		elseif hud.button.bIsHovered then
			hud.button.endHover()
		end

		hud.button.update(deltaTime)
	end

	hud.bIsFocused = true
	hud.zIdx = 0;

	hud.draw = function()
		hud.healthbar.draw()
		hud.button.draw()
	end

	return hud
end