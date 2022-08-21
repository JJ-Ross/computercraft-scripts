function dropInventory()
    for i = 1,16,1 do 
        turtle.select(i)
        turtle.drop()
    end
end

function ifNotItems(itemList)
    for j = 1,16,1 do
        turtle.select(j)
        isItem = false;
        for i = 0,table.getn(itemList),1
            do
                if (turtle.getItemDetail().name == itemList[i]) do
                    isItem = true;
                end
            end
        end
        if (isItem = false) do
        turtle.drop()
        end
    end
end

itemList = {"minecraft:raw_copper", "minecraft:diamond", "minecraft:redstone", "minecraft:raw_iron", "minecraft:raw_gold", "minecraft:lapis_lazuli", "minecraft:coal"}

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