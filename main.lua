-- globals
speed=1
gravity=5
friction=0.5

flags={
	floor=0,
	ceiling=1,
	snow=2,
	slip=3,
}

-- game loop
function _init()

	background:init()
	pal()

	local c = {11, 12, 14, 15, 6, 4, 2}

	for i = 1, #c do
		pal(c[i], 128 + c[i], 1)
	end

	pal(10, 15, 1)
	pal(13, 6, 1)
	gui:init()
	-- balao({y=32,x=32,s=4})
	-- balao({y=72,x=72,s=8})
	-- balao({y=64,x=64,s=8})
	p = pedro({x=16})
end

function _update60()
	background:update()
	entity:each("update")

	camx = mid(0,p.x-48,896)
	camera(camx,0)
end

function _draw()
    cls(0)
	background:draw()
	map(0,0,0,0,128,16)
	entity:each("draw")
	gui:draw()
end
