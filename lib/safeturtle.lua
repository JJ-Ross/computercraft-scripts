function forward()
	dig()
	turtle.forward()
end

function dig()
	while turtle.detect() do
		turtle.dig()
	end
end

function digDown(hgt, ret)
	for y = 1, hgt - 1 do
		turtle.digDown()
		if y < hgt - 1 then turtle.down() end
	end
	if ret then
		for i = 1, hgt - 2 do turtle.up() end
	end
end

function diag(len, hgt, ev1, fce)
	ev2 = ev1 == turtle.turnLeft and turtle.turnRight or turtle.turnLeft
	for x = 1, len do
		digDown(hgt, true)
		dig()
		forward()
		ev1()
		dig()
		forward()
		ev2()
	end
	for y = 1, fce - 1 do
		digDown(hgt, true)
		dig()
		forward()
	end
end