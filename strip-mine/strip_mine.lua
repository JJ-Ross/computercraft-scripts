function dropInventory()
    for i = 1,9,1 do 
        turtle.select(i)
        turtle.drop()
    end
end

function digFour()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.turnRight()
    turtle.dig()
    turtle.up()
    turtle.dig()
    turtle.down()
    turtle.turnLeft()
end

function comeBack(distance)
    turtle.turnRight()
    turtle.turnRight()

    for i = 1,distance,1 do
        turtle.forward()
    end
    dropInventory()
end

function stripMine()
    distance = 0
    while ( turtle.getFuelLevel() > distance + 50 ) do
    digFour()
    distance = distance + 1
    end
    comeBack(distance)
end

stripMine()