return function(parent, x, y, w, h)
	local b = {}

	b.bIsHovered = false
	b.bIsDown = false
	b.downTime = 0.25 -- how long we spend down before we go back up
	b.timeSpentDown = 0
	b.parent = parent
	b.onHoverStart = nil -- function
	b.onHoverEnd = nil -- function
	b.onDownStart = nil -- function
	b.onDownEnd = nil -- function
	b.position = {
		["x"] = x,
		["y"] = y
	}
	b.size = {
		["w"] = w,
		["h"] = h
	}

	b.draw = function()
		if b.bIsDown then
			love.graphics.setColor(0.5, 0.5, 0.5, 1)
		elseif b.bIsHovered then
			love.graphics.setColor(0.75, 0.75, 0.75, 1)
		else
			love.graphics.setColor(1, 1, 1, 1)
		end

		love.graphics.rectangle("fill", b.position.x, b.position.x, b.size.w, b.size.h)

		love.graphics.setColor(1, 1, 1, 1)
	end

	b.update = function(deltaTime)
		if (b.bIsDown) then
			b.timeSpentDown = b.timeSpentDown + deltaTime
			if (b.timeSpentDown >= b.downTime) then
				b.endDown()
			end
		else
			b.timeSpentDown = 0
		end
	end

	b.startDown = function()
		b.timeSpentDown = 0
		b.bIsDown = true
		if b.onDownStart ~= nil then
			b.onDownStart()
		end
	end

	b.endDown = function()
		b.bIsDown = false
		if b.onDownEnd ~= nil then
			b.onDownEnd()
		end
	end

	b.startHover = function()
		b.bIsHovered = true
		if b.onHoverStart ~= nil then
			b.onHoverStart()
		end
	end

	b.endHover = function()
		b.bIsHovered = false
		if b.onHoverEnd ~= nil then
			b.onHoverEnd()
		end
	end

	return b
end