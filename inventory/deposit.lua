args = { ... }

modem = peripheral.wrap("right") or error("Server can't start without modem", 0)
port = tonumber(args[1]) or 20
endpoint = tonumber(args[2]) or 21
modem.open(port)
print("listening on port "..port.."...")

modem.transmit(endpoint, port, "mongo help")
event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
print(message)
