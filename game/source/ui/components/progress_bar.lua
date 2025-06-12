return function(parent, x, y, w, h)
	local pb = {}

	pb.fill = 100
	pb.parent = parent
	pb.position = {
		["x"] = x,
		["y"] = y
	}
	pb.size = {
		["w"] = w,
		["h"] = h
	}

	pb.setFill = function(newValue)
		pb.fill = math.min(math.max(newValue, 0), 100)
	end

	pb.decrement = function(delta)
		pb.setFill(pb.fill - delta)
	end

	pb.increment = function(delta)
		pb.setFill(pb.fill + delta)
	end

	pb.draw = function()
		love.graphics.rectangle("fill", pb.position.x, pb.position.y, pb.size.w, pb.size.h)

		love.graphics.setColor(1, 0, 0, 1)

		local fillWidth = pb.size.w * (pb.fill / 100) 
		love.graphics.rectangle("fill", x, y, fillWidth, pb.size.h)
		love.graphics.setColor(1, 1, 1, 1)
	end

	return pb
end