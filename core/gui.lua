gui=class:extend({
    init=function(_ENV)
        noop();
    end,
    draw=function(_ENV)
        local x = camx
        rectfill(0,0,127,16,0)
        rectfill(x,111,x+127,127,0)
        message("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")
    end,
    update=function(_ENV)
        noop();
    end
})

function message(str, x, y)
    local max_len = 30
    local lines = {}
    local current_line = ""
    local word = ""
    local pos = 1
    local x,y = camx, 111

    rect(x+1,y+1,x+126,y+15,7)
    
    while pos <= #str do
        local char = sub(str, pos, pos)
        if char == " " then
            if #current_line + #word + 1 <= max_len then
                if current_line ~= "" then
                    current_line = current_line .. " "
                end
                current_line = current_line .. word
                word = ""
            else
                add(lines, current_line)
                current_line = word
                word = ""
            end
        else
            word = word .. char
        end
        pos = pos + 1
    end

    if #current_line + #word + 1 <= max_len then
        current_line = current_line .. " " .. word
    else
        add(lines, current_line)
        current_line = word
    end

    if current_line ~= "" then
        add(lines, current_line)
    end

    for i=1,#lines do
        print(lines[i], x+3, y+3, 7)
        y = y + 6  -- ajusta a altura para a próxima linha
    end
end