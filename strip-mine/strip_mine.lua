function dropInventory()
    for i = 1,16,1 do 
        turtle.select(i)
        turtle.drop()
    end
end

function ifNotItems(itemList)
    for j = 1,16,1 do
        turtle.select(j)
        isItem = false
        for i = 0,table.getn(itemList),1 do
                if (turtle.getItemDetail().name == itemList[i]) then
                    isItem = true;
                end
        end
        if (isItem == false) then
        turtle.drop()
        end
    end
end

function ifFull()
    isFull = true
    for i = 1,16,1 do
        turtle.select(i)
        if (turtle.getItemDetail().count = 0) then
            isFull = false
        end
    end
    if (isFull = true) then
        comeback()
    end
end

itemsList = {"minecraft:raw_copper", "minecraft:diamond", "minecraft:redstone", "minecraft:raw_iron", "minecraft:raw_gold", "minecraft:lapis_lazuli", "minecraft:coal"}

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
    ifNotItems(itemsList)
end

function comeBack(distance)
    turtle.turnRight()
    turtle.turnRight()

    for i = 1,distance,1 do
        turtle.forward()
    end
    dropInventory()
    exit()
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