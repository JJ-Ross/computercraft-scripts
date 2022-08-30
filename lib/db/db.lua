require("/lib/db/db_util")

args = { ... }

if table.getn(args) < 1 then
    print("Missing argument, try mongo help")
	return
end

command = args[1]

function db_help()
    print("***** cc-db help page *****")
    print()
    print("mongo help - display the help page")
	print("mongo create <name> - create collection")
	print("mongo insert <name> <id> <doc> - insert document")
	print("mongo delete <name> <id> - delete document")
	print("mongo select <name> <id> - select document")
	print("mongo get <name> - get collection")
	print("mongo drop <name> - drop collection")
	print("mongo list - show all collections")
    print()
    print("***** ---------------- *****")
end

if command == "help" then
    db_help()
elseif command == "create" and table.getn(args) == 2 then
	create_collection(args[2])
elseif command == "insert" and table.getn(args) == 4 then
	loadstring("document = "..args[4])()
	insert(args[2], args[3], document)
elseif command == "delete" and table.getn(args) == 3 then
	delete(args[2], args[3])
elseif command == "select" and table.getn(args) == 3 then
	document_text, num = textutils.serialize(select(args[2], args[3])):gsub("\n", ""):gsub("%s", "")
	print(document_text)
elseif command == "get" and table.getn(args) == 2 then
	collection_text, num = textutils.serialize(get_collection(args[2])):gsub("\n", ""):gsub("%s", "")
	print(collection_text)
elseif command == "drop" and table.getn(args) == 2 then
	drop_collection(args[2]..".db")
elseif command == "list" and table.getn(args) == 1 then
	show_collections()
else
    print("Unknown command or argument(s), try mongo help")
end