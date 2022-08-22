farmed = 0;

function dropInventory()
    for i = 1,16,1 do 
        turtle.select(i)
        turtle.drop()
    end
end

function isReady()
    p1, p2 = turtle.inspect()
    if (p2.state.age = 7) then
        return true
    end
end

function farm()
    if (isReady) then
        turtle.dig()
        turtle.place()
        turtle.turnRight()
        turtle.forward()
        turtle.turnLeft()
        farmed = farmed + 1
    end
end

while true do
    farm()
    if farmed = 8 then
        for i = 1,8,1 do
            turtle.forward()
        end
        dropInventory()
        turtle.turnRight()
    end
end