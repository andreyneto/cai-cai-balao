-- particle
particle=entity:extend({
	frame=0,
	frames=10,
	rad=1,
	clr=5,
	sx=0,
	sy=0,
	
	update=function(_ENV)
		x+=sx
		y+=sy
		frame+=1
		x-=speed
		
		if frame>=frames then
			destroy(_ENV)
		end
	end,

	draw=function(_ENV)
		local r=(1-frame/frames)*rad
		circfill(x,y,r,clr)
	end
})


spark=particle:extend({
	clr=10,
	sy=-.5,
})
