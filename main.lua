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
	gui:init()
	balao({y=32,x=32,s=8})
	balao({y=64,x=64,s=8})
	balao({y=72,x=72,s=8})
end

function _update()
	background:update()
	entity:each("update")
end

function _draw()
    cls(0)
	background:draw()
	entity:each("draw")
	-- palt(13,true)
	-- palt(0,false)
	-- map(16,0,0,0,16,16)
	-- map(0,0,0,0,16,16)
	-- pal()
	gui:draw()
end
