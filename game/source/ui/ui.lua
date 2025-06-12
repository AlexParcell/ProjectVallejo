return function()
	local ui = {}
	local widgets = {}
	local focusedWidget = nil

	function ui:update(deltaTime)
		for _,widget in pairs(widgets) do
			if widget ~= nil then
				widget.update(deltaTime)
			end
		end
	end

	function ui:draw()
		for _,widget in pairs(widgets) do
			if widget ~= nil then
				widget.draw()
			end
		end
	end

	function ui:AddWidget(WidgetName)
		widgets[WidgetName] = require("source.ui.widgets." .. WidgetName)()
	end

	function ui:RemoveWidget(WidgetName)
		widgets[WidgetName] = nil
	end

	return ui
end