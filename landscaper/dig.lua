args = { ... }

for x = 1, args[0] do
    for y = 1, args[1] do
        for z = 1, args[2] do
            turtle.digDown()
            turtle.down()
        end
        for i = 1, args[2] do turtle.up() end
        if y ~= args[1] then
            turtle.dig()
            turtle.forward()
        end
    end
    for i = 1, args[1] do turtle.back() end
    if x ~= args[0] then
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
    end
end