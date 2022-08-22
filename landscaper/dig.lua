args = { ... }

len = tonumber(args[1])
wid = tonumber(args[2])
hgt = tonumber(args[3])

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