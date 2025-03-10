entity=class:extend({
	-- class
	pool={},
	
	extend=function(_ENV,tbl)
		tbl=class.extend(_ENV,tbl)
		return tbl
	end,

	each=function(_ENV,method,...)
		for e in all(pool) do
			if (e[method]) e[method](e,...)
		end
	end,
	
	-- instance
	x=0,
	y=0,

	w=8,
	h=8,

	init=function(_ENV)
		add(entity.pool,_ENV)
		if pool != entity.pool then
			add(pool,_ENV)
		end
	end,

	animate=noop,

	detect=function(_ENV,other,callback)
		if collide(_ENV,other) then
			callback(_ENV)
		end
	end,

	collide=function(_ENV,other)
		return x<other.x+other.w and
			x+w>other.x and
			y<other.y+other.h and
			h+y>other.y
	end,

	destroy=function(_ENV)
		del(entity.pool,_ENV)
		if pool != entity.pool then
			del(pool,_ENV)
		end
	end
})


--move entity with collision
function move(e)
	local col_x = false
	local col_y = false
	
	e.x += e.dx
	if map_col(e) then
		e.x -= e.dx
		e.dx = 0
		col_x = true
	end
	
	e.y += e.dy
	if map_col(e) then
		e.y -= e.dy
		e.dy = 0
		col_y = true
	end
	
	return col_x, col_y
end


--map collision
function map_col(o, f)
	local f = f or 0
	local x1 = o.x/8
	local x2 = (o.x+o.w-1)/8
	local y1 = o.y/8
	local y2 = (o.y+o.h-1)/8
	x1=mid(0,x1,128)
	x2=mid(0,x2,128)
	y1=mid(0,y1,128)
	y2=mid(0,y2,128)

	local a = mget(x1, y1)
	local b = mget(x1, y2)
	local c = mget(x2, y1)
	local d = mget(x2, y2)
	
	return fget(a, f) or fget(b, f)
		or fget(c, f) or fget(d, f)
		or x1 < 0 or y1 < 0
end