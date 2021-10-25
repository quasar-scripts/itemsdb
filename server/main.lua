local items = 'Items = {\n'

RegisterCommand("items", function(source, args, rawCommand)
	MySQL.Async.fetchAll('SELECT * FROM items', {},
	function(users)
		if users and users[1] then 
			for _, id in ipairs(users) do
				items = items .. '    ["' .. id.name .. '"] 					 = {["name"] = "' .. id.name .. '", 						["label"] = "' .. id.label .. '", 					["weight"] = ' .. id.weight .. ', 		["type"] = "item", 		["image"] = "' .. id.name ..'.png", 		        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	   ["combinable"] = nil,   ["description"] = ""},\n'
			end
			items = items .. '}'
			print('Finish migrate items from DB')
			SaveResourceFile(GetCurrentResourceName(), "data/items.json", items, -1)
		end
	end)
end,false)