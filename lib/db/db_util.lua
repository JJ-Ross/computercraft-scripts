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

function delete(collection_name, document_id)
	collection_file = fs.open("/lib/db/collections/"..collection_name..".db", "r")
	loadstring("collection = "..collection_file.readAll())()
	collection_file.close()
	collection[document_id] = nil
	collection_text, num = textutils.serialize(collection):gsub("\n", ""):gsub("%s", "")
	collection_file = fs.open("/lib/db/collections/"..collection_name..".db", "w")
	collection_file.write(collection_text)
	collection_file.close()
end

function select(collection_name, document_id)
	collection_file = fs.open("/lib/db/collections/"..collection_name..".db", "r")
	loadstring("collection = "..collection_file.readAll())()
	collection_file.close()
	if not collection[document_id] then return nil end
	return collection[document_id]
end

function get_collection(collection_name)
	collection_file = fs.open("/lib/db/collections/"..collection_name..".db", "r")
	loadstring("collection = "..collection_file.readAll())()
	collection_file.close()
	return collection
end

function drop_collection(collection_name)
	shell.execute("rm", "/lib/db/collections/"..collection_name)
end

function show_collections()
	shell.execute("ls", "/lib/db/collections")
end