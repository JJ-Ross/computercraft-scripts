function create_collection(collection_name)
    collection_file = fs.open("/lib/db/collections/"..collection_name..".db", "w")
	collection_file.write("{}")
    collection_file.close()
end

function insert(collection_name, document_id, document)
	collection_file = fs.open("/lib/db/collections/"..collection_name..".db", "r")
	loadstring("collection = "..collection_file.readAll())()
	collection_file.close()
	collection[document_id] = document
	collection_text, num = textutils.serialize(collection):gsub("\n", ""):gsub("%s", "")
	collection_file = fs.open("/lib/db/collections/"..collection_name..".db", "w")
	collection_file.write(collection_text)
	collection_file.close()
end

function select(collection_name, document_id)
	collection_file = fs.open("/lib/db/collections/"..collection_name..".db", "r")
	loadstring("collection = "..collection_file.readAll())()
	document = collection[document_id]
	collection_file.close()
	return document
end

function show_collections()
	shell.execute("ls", "/lib/db/collections")
end