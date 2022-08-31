args = { ... }

modem = peripheral.find("modem") or error("Server can't start without modem", 0)
port = tonumber(args[1]) or 21
modem.open(port)
print("listening on port "..port.."...")

while true do
	local event, side, channel, replyChannel, message, distance
	repeat
		event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
	until channel == port
	print("\nRecieved query: "..message.."\nreply to port "..replyChannel)
	shell.run(message.." "..tostring(replyChannel))
end
