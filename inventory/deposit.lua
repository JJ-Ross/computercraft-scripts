args = { ... }

modem = peripheral.find("modem") or error("Server can't start without modem", 0)
port = tonumber(args[1]) or 20
modem.open(port)
print("listening on port "..port.."...")

modem.transmit(21, 20, "mongo select test minecraft:dirt")
event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
print(message)