function new_chest(tag)
	chest = {}
	chest.tag = tag
	chest.items = {}
	for i = 1, 52 do
		chest.items[i] = {count=0}
	end
	return chest
end

function insert_chests(min, max)
	for i = min, max do
		doc_text, num = textutils.serialize(new_chest('minecraft:chest_'..i)):gsub("\n", ""):gsub("%s", "")
		command = ("mongo insert chests minecraft:chest_"..i.." "..doc_text):gsub('"', "'")
		modem.transmit(endpoint, port, command)
	end
end