local List = ''

RegisterCommand("items", function(source, args, rawCommand)
	MySQL.Async.fetchAll('SELECT * FROM items', {},
	function(items)
		if items and items[1] then 
			for _, id in ipairs(items) do
				List = List .. '["' .. id.name .. '"] = {\n    ["name"] = "' .. id.name .. '",\n    ["label"] = "' .. id.label .. '",\n    ["weight"] = ' .. id.weight .. ',\n    ["type"] = "item",\n    ["image"] = "' .. id.name ..'.png",\n    ["unique"] = false,\n    ["useable"] = false,\n    ["shouldClose"] = false,\n    ["combinable"] = nil,\n    ["description"] = ""\n},\n\n'
			end	

			print('Finish migrate items from DB')
			SaveResourceFile(GetCurrentResourceName(), "data/items.json", List, -1)
		end
	end)
end,false)
