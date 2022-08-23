args = { ... }

function square(len, wid, hgt)
    for x = 1, len do
        for y = 1, wid do
            for z = 1, hgt - 1 do
                turtle.digDown()
                if z ~= hgt - 1 then turtle.down() end
            end
            for i = 1, hgt - 2 do turtle.up() end
            if y ~= wid then
                turtle.dig()
                turtle.forward()
            end
        end
        for i = 1, wid - 1 do turtle.back() end
        if x ~= len then
            turtle.turnRight()
            turtle.dig()
            turtle.forward()
            turtle.turnLeft()
        end
    end
    turtle.turnLeft()
    for i = 1, len - 1 do turtle.forward() end
    turtle.turnRight()
end

if args[1] == "square" then
    square(args[2], args[3], args[4])
elseif args[1] == "capsule" then
end