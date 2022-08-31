require("/inventory/inventory_util")
args = { ... }

modem = peripheral.wrap("right") or error("Server can't start without modem", 0)
port = tonumber(args[1]) or 20
endpoint = tonumber(args[2]) or 21
modem.open(port)
print("listening for response on port "..port.."...")

modem.transmit(endpoint, port, "mongo select chests main")
local event, side, channel, replyChannel, message, distance
repeat
  event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
until channel == port
loadstring("document = "..message)()
main_chest = peripheral.wrap(document.tag)

for index, item in next, main_chest.list() do
	-- deposit item and update database, one at a time
end

insert_chests(1, 4)