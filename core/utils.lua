cartdata("cai_cai_balao_a")
global=_ENV
noop=function()end

function lerp(p1,p2,i)
	return p1+(p2-p1)*i
end

function log(str, override)
	printh(time()..": "..str, "log", override)
end

-- Função para converter uma tabela em uma string legível
function logtbl(t)
    log(parsetbl(t), true)
end

function parsetbl(t)
    local resultado = "{\n"
    for chave, valor in pairs(t) do
        if type(valor) == "table" then
            valor = parsetbl(valor)
        else
            valor = tostr(valor)
        end
        resultado = resultado .. "  [" .. tostr(chave) .. "] = " .. valor .. ",\n"
    end
    resultado = resultado .. "}\n"
    return resultado
end

--toggles between 0,1 with
--period and offset
function isin2(p,o)
	return flr(sin(t()*p+(o or 0))*0.5+1)
end

--toggles between 0,1,2 with
--period and offset
function isin3(p,o)
	return flr(sin(t()*p+(o or 0))+0.5)
end


--outlined sprite
function ospr(c, n, x, y, w, h, flip_x, flip_y)
	w = w or 1
	h = h or 1
	flip_x = flip_x or false
	flip_y = flip_y or false
	
	pal({[0]=c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c}, 0)
	
	spr(n, x-1, y, w, h, flip_x, flip_y)
	spr(n, x+1, y, w, h, flip_x, flip_y)
	spr(n, x, y-1, w, h, flip_x, flip_y)
	spr(n, x, y+1, w, h, flip_x, flip_y)

	pal(0)
	
	spr(n, x, y, w, h, flip_x, flip_y)
end