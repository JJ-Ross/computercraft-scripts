require("/lib/safeturtle")

args = { ... }
command = args[1]

function square(len, wid, hgt)
end

function cylinder(rad, hgt, xfc, yfc, top)
    turtle.select(1)
	diag_p(rad, hgt, turtle.turnLeft, xfc)
	turtle.turnRight()
	diag_p(rad, hgt, turtle.turnLeft, yfc)
	turtle.turnRight()
	diag_p(rad, hgt, turtle.turnLeft, xfc)
	turtle.turnRight()
	diag_p(rad, hgt, turtle.turnLeft, yfc)
	turtle.turnRight()
	forward()
end

if command == "square" then
    square(tonumber(args[2]), tonumber(args[3]), tonumber(args[4]))
elseif command == "cylinder" then
	cylinder(tonumber(args[2]), tonumber(args[3]), tonumber(args[4]), tonumber(args[5]), args[6])
end