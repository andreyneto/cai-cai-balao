balao=entity:extend({
    x=64,
    y=64,
	dx=0,
	dy=0,
    s=5,
    spd=speed*5,
	spdx=1,
	spdy=1,
	pool={},
	id=-1,

	x1=0,
	y1=0,
	x2=0,
	y2=0,
	offset=0,

	piece={{},{},{},{},{}},

	toupdate=false,

    init=function (_ENV)
		add(entity.pool,_ENV)
		if pool != entity.pool then
			add(pool,_ENV)
		end
        h=s
        w=h*3/4
		id=#pool
        x1=x
        y1=y
        x2=x
        y2=y
    end,
    update=function (_ENV)
        toupdate = not toupdate
		if not toupdate then return end
		if(spdx<1)spdx+=.1
		if(spdy<1)spdy+=.1

		--control x
		if btn(⬅️)==btn(➡️) then
			dx=lerp(dx,0,.05)
		elseif btn(⬅️) then
			dx-=.1*spdx
		else
			dx+=.1*spdx
		end

		--control y
		if(btn(⬆️) or btn(❎))==
		(btn(⬇️) or btn(🅾️)) then
			dy=lerp(dy,.5,.05)
		elseif btn(⬆️) or btn(❎)then
			dy-=.075*spdy
		else
			dy+=.1*spdy
		end

		--limit speed
		dx=min(max(-2,dx),2)
		dy=min(max(-2,dy),2)
		angle=atan2(dx,dy)
		maxx=2*abs(cos(angle))
		maxy=2*abs(sin(angle))
		dx=
		min(max(-maxx,dx),maxx)
		dy=
		min(max(-maxy,dy),maxy)

		--move
		x+=dx
		y+=dy

        --wire
		if(dx<0)offset=-1
		if(dx>0)offset=1
        if(dx==0)offset=0
		x1=x-(w/2)-offset
		y1=y
		x2=lerp(x2,x1,.15)
        y2=lerp(y2,y1+(s/2),.25)

		piece[0]={
			x2=x1,
			y2=y1
		}
		for i,p in ipairs(piece) do
			p.y1=piece[i-1].y2
			p.x1=piece[i-1].x2
			p.y2=lerp(y1,y2,i/5)
			p.x2=lerp(
				x1,
				lerp(x1,x2,i/5),
				i/5
			)
		end
    end,
    draw=function (_ENV)


        c1=12+128 c2=10+128
        c={x=x-offset,y=y}
        t={x=x,y=y-(h/2)}
        l={x=x-(w/2),y=y}
        b={x=x,y=y+(h/2)}
        r={x=x+(w/2),y=y}
        trian(t.x,t.y,l.x,l.y,c.x,c.y,c1)
        trian(t.x+1,t.y,r.x+1,r.y,c.x+1,c.y,c2)
        trian(b.x,b.y+1,l.x,l.y+1,c.x,c.y+1,c2)
        trian(b.x+1,b.y+1,r.x+1,r.y+1,c.x+1,c.y+1,c1)
        --wire
		for p in all(piece) do
			line(p.x1,p.y1,p.x2,p.y2,8)
			-- line(p.x1+offset,p.y1,p.x2,p.y2,8)
			line(p.x1+(w/2),p.y1,p.x2+(w/2),p.y2,11)
			line(p.x1+offset+w+2,p.y1,p.x2+w+2,p.y2,8)
		end

    end,
})


function trian(a,b,c,d,e,f,g)
	local h,i=a-c,b-d
	local j,k,l,m=abs(h),abs(i),c,d
	j=max(1,max(j,k))
	for n=0,j do
		line(c,d,e,f,g)
		line(c+1,d,e+1,f)
		c+=h/j d+=i/j
	end
end
