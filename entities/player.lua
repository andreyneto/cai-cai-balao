pedro=entity:extend({
	coyote=0,
	dx=0,
	dy=0,

    friction = 0.7,
    jump_boost = 3.4,
    max_speed_x = 4,
    max_speed_y = 4,
    move_acc = 1,
	left=false,
	climbing=false,
    
    running_sp={2,3,4},
    climbing_sp={2,4},
    
    last_anim=0,
	
    update=function(_ENV)
        coyote = max(0,coyote-1)
	
        local gravity = 0.2

        --movement input
        if (btn(⬅️)) then
            dx = -move_acc
            left = true
        end
        if (btn(➡️)) then
            dx = move_acc
            left = false
        end
        if btn(⬆️) and climbing then
            dy = -move_acc
        end
        if btn(⬇️) and climbing then
            dy = move_acc
        end
	
        --jumping
        if btnp(🅾️) and (grounded or climbing or coyote>0) then
            dy = -jump_boost
            climbing=false
            -- sfx(35)--jump
            -- jump(p.x+4,p.y+6)
        end

        --physics
        if (not climbing) dy += gravity
        if (climbing) dy*= friction
        dx *= friction


        --climbing
        if map_col(_ENV, 1) then
            if btn(⬆️) then
                climbing=true
                gliding=false
            end
        elseif climbing then
            climbing=false
        end

	
        dx = mid(-max_speed_x, dx, max_speed_x)
        dy = mid(-max_speed_y, dy, max_speed_y)
        local falling = dy > 0
        
        col_x, col_y = move(_ENV)
        local old_grounded = grounded
        grounded = falling and col_y
        moving = abs(dx)>0.1 or abs(dy)>0.1
        

        x = mid(0, x, 128*8-7)
        
        if old_grounded and not grounded then
            coyote=5
        end
    end,
    draw=function(_ENV)
        local hs=1
        local by=y
        local anim=isin3(2)
        last_anim=abs(anim)
        local s=running_sp[2]
        if moving and grounded then
            s=running_sp[anim+2]
            by-=abs(anim)
        end
        if not grounded then
            s=17
        end


        if climbing then
            hs=35
            if moving then
                s=climbing_sp[isin2(4)+1]
            end
        end

        local hy=by-3
        if (not moving and grounded) hy+=isin2(0.5)
        ospr(0,s, x, by, 1, 1, left) --body
        ospr(0,hs, x, hy, 1, 1, left) --head
        spr(s, x, by, 1, 1, left) --body
        spr(hs, x, hy, 1, 1, left) --head
    end
});