require("/lib/safeturtle")

args = { ... }
command = args[1]

function square(len, wid, hgt)
    for x = 1, len do
        for y = 1, wid do
            for z = 1, hgt - 1 do
                turtle.digDown()
                if z < hgt - 1 then turtle.down() end
            end
            for i = 1, hgt - 2 do turtle.up() end
            if y < wid then
                dig()
                forward()
            end
        end
        for i = 1, wid - 1 do turtle.back() end
        if x < len then
            turtle.turnRight()
            dig()
            forward()
            turtle.turnLeft()
        end
    end
    turtle.turnLeft()
    for i = 1, len - 1 do forward() end
    turtle.turnRight()
end

function cylinder(rad, hgt, xfc, yfc)
	diag(rad, hgt, turtle.turnLeft, xfc)
	turtle.turnRight()
	diag(rad, hgt, turtle.turnLeft, yfc)
	turtle.turnRight()
	diag(rad, hgt, turtle.turnLeft, xfc)
	turtle.turnRight()
	diag(rad, hgt, turtle.turnLeft, yfc)
	turtle.turnRight()
	dig()
	forward()
	if rad <= 1 then
		for y = 1, hgt - 1 do
			turtle.digDown()
			if y < hgt - 1 then turtle.down() end
		end
		return 1
	else
		return cylinder(rad - 1, hgt, xfc, xfc)
	end
end

if command == "square" then
    square(tonumber(args[2]), tonumber(args[3]), tonumber(args[4]))
elseif command == "cylinder" then
	cylinder(tonumber(args[2]), tonumber(args[3]), tonumber(args[4]), tonumber(args[5]))
end