args = { ... }

len = tonumber(args[0])
wid = tonumber(args[1])
hgt = tonumber(args[2])

for x = 1, len do
    for y = 1, wid do
        for z = 1, hgt do
            turtle.digDown()
            turtle.down()
        end
        for i = 1, hgt do turtle.up() end
        if y ~= wid then
            turtle.dig()
            turtle.forward()
        end
    end
    for i = 1, wid do turtle.back() end
    if x ~= len then
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
    end
end