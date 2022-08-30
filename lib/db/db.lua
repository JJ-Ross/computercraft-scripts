require("/lib/db/db_util")
modem = peripheral.find("modem")

args = { ... }

if table.getn(args) < 1 then
    print("Missing argument, try mongo help")
	return
end

command = args[1]

function db_help()
    return "***** cc-db help page *****\n\nmongo help - display the help page\nmongo create <name> - create collection\nmongo insert <name> <id> <doc> - insert document\nmongo delete <name> <id> - delete document\nmongo select <name> <id> - select document\nmongo get <name> - get collection\nmongo drop <name> - drop collection\nmongo list - show all collections\n\n***** ---------------- *****"
end

if command == "help" and table.getn(args) >= 1 then
	if modem then modem.transmit(tonumber(args[2]), 0, db_help())
	else print(db_help()) end
elseif command == "create" and table.getn(args) >= 2 then
	create_collection(args[2])
	if modem then modem.transmit(tonumber(args[3]), 0, "collection "..args[2].." created")
	else print("collection "..args[2].." created") end
elseif command == "insert" and table.getn(args) >= 4 then
	loadstring("document = "..args[4])()
	insert(args[2], args[3], document)
	if modem then modem.transmit(tonumber(args[5]), 0, "document inserted into collection "..args[2])
	else print("document inserted into collection "..args[2]) end
elseif command == "delete" and table.getn(args) >= 3 then
	delete(args[2], args[3])
	if modem then modem.transmit(tonumber(args[4]), 0, "document deleted from collection "..args[2])
	else print("document deleted from collection "..args[2]) end
elseif command == "select" and table.getn(args) >= 3 then
	document_text, num = textutils.serialize(select(args[2], args[3])):gsub("\n", ""):gsub("%s", "")
	if modem then modem.transmit(tonumber(args[4]), 0, document_text)
	else print(document_text) end
elseif command == "get" and table.getn(args) >= 2 then
	collection_text, num = textutils.serialize(get_collection(args[2])):gsub("\n", ""):gsub("%s", "")
	if modem then modem.transmit(tonumber(args[3]), 0, collection_text)
	else print(collection_text) end
elseif command == "drop" and table.getn(args) >= 2 then
	drop_collection(args[2]..".db")
	if modem then modem.transmit(tonumber(args[3]), 0, "dropped collection "..args[2])
	else print("dropped collection "..args[2]) end
elseif command == "list" and table.getn(args) >= 1 then
	show_collections()
else
    print("Unknown command or argument(s), try mongo help")
end