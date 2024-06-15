pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- cai cai balao
-- by andrey neto
#include main.lua

#include core/class.lua
#include core/background.lua
#include core/entity.lua
#include core/scene.lua
#include core/gui.lua
#include core/utils.lua

#include entities/balao.lua
#include entities/particles.lua
__gfx__
000000005bbbbbbbbbbbbbbbbbbbbbb5dddd33d33ddbbd33dd33dddd2222222222222222222033bb99dddd99fff9fff9dddddddf2dddddddd77777777777777d
00000000bbbb3bb3bb3bbbbb3bb3bbbbd3353333333bbb33353335dd22222222222222222223333b994ff499fff2fff2ddddddf992dddddd7666666666666665
00700700bb3bb5333333bb53335bb3bbd3335bb33333bb333353355d2222222222222222220335339949949999929992dddddf99992ddddd7666666666666665
00077000b3333353353333353533333bd5333bbb3bb333333333355d22222222222222222200033399dddd99ddddddddddddf9999992dddd7666666666666655
00077000333533005333033000335333335333333bbb3bb33333555d22200220022002220220033099dddd99dddddddddddf999999992ddd7666666666666565
00700700b3335000033000000005333b3333bbb3bbbbb3b333333555220330033003302230033000994ff499ddddddddddf99929929292dd7666665656565655
00000000b3333000000000000003333b333bbb3bbbbbbb33bbbb335522033353353330223533300099499499dddddddddf9292922929292d7665656565656555
00000000333330020000222220033333d3bbb3bbbbbbbbb3bbbb335d22203333333302223333022299dddd99ddddddddd22222222222222dd55555555555555d
dddddddd333300222222222222003333d3333bbbbbbbbbbb3bbb35dd222033bbbb330222bb330222ccc5ddddddd58885d777777dd777777ddffffffffffffffd
ddddddddb3333022222222222203333b3333bbb3bbbbbb3333bb555d2223333bb3333222b3333222cccdaaa5bbbd888d766666657cccccc1f999999999999992
ddddddddb3333302222222222033333b335bbb333bb3bb3bb353555d220335333353302233533022cdcdaaadbbbdd8dd766666657cccccc1f999999999999992
ddddddddb3353302222222222033533bd53bb333333bbb3bbb31155d220003333330002233300022dddddaddbdbddddd766666557ccccc11f999999999999922
ddddd99d3333500222222222200533333333333bbb3bb333bb3355dd222003300330022203300220dddddddddddddddd766665657cccc1c1f999999999999292
deed944933333022222222222203333333335333bb3b33bb3333355d222200000000222200033003dddddddddddddddd765656557c1c1c11f999992929292922
e22ed99db3533022222222222203353b333533333b3333bbb5333355222222200022222200033353dddddddddddddddd7565655571c1c111f992929292929222
deed555db3350022222222222200533bd55333333333333bb3111555222222222222222222203333ddddddddddddddddd555555dd111111dd22222222222222d
dddddddd333330222222222222033333d553313355533313331533dd2222222222222222222222229442944294429442dddddddddddddddd000a800000000000
ddddddddb3333022222222222203333b55555513533533513335333d2222222244422244222222229442944294429442ddddddd44ddddddd00aa880000000000
ddddddddb3330002222222222000333b55555335533355551335533d2222222244442444222222229442944299999999dddddd4494dddddd00aa880000000000
dddddddd3335550022200222005553335505533355335533111555dd2444222244442442244422229442944244444444dddddd4994dddddd0aaa888000000000
dddddddd335335330003302033533533dd555533511555333115511d2444422244442222244442229442944244444444dddddd4444dddddd0888aaa000000000
dddccddd333333333353330333533333d555d555111552533555111d2444422224442222244442229442944222222222ddd4499999444ddd0088aa0000000000
ddc11cdd333333333335333333353333d55dddd511255235555d11dd2244422222222222224442229442944294429442dd449444444494dd0008a00000000000
d55ccddd533333333333333333333335dddddddd33422233dddddddd2222222222222222222222229442944294429442dd499444449444dd0000000000000000
ddddddddddddddddd3333d33dddddddddd4944dddd4944dddd4422dd222222222222222222222222ccc2aaa2bbb28882ddd4444444494ddd0000000000000000
dddddddddddddddddd33dddddddddddddd9944dddd9944dddd4444dd444422222222222222222222cccdaaadbbbd8882dddddd2222dddddd0000000000000000
dddddddddddddddddddddddddddddddddd9944dddd9994dddd4444dd444442222222244222222222cdcddaddbdbdd8d2dddddd2944dddddd0000000000000000
dddddddddddddddddddddddddddddddddd9994dddd9994dddd4444dd4444422222224442244222222dddddddddddddd2dddddd9944dddddd0000000000000000
dddddddddddddddddddddddddddddddddd4994dddd9944dddd4444dd4444422222224422244422222dddddddddddddd2dddddd9994dddddd0000000000000000
dddd99dddddddddddddddddddddddddddd4944ddd999499ddd4944dd2444224422222222224422222dddddddddddddd2dddddd9994dddddd0000000000000000
ddd9449dd33ddddddddddddddddd33dddd4944dd99944999dd4944dd2222244422222222222222222dddddddddddddd2dddddd4944dddddd0000000000000000
33dd99553333d33ddddddddd3dd333dddd4944dd99444499dd4944dd2222244222222222222222222dddddddddddddd2dddddd4944dddddd0000000000000000
00006606000066060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00066660000666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0066fff00066fff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0066fff00066fff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06776670067766700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6f77777f06f777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6ff7777f06fff7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ff55500005ff5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00555500005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00755700000775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06770770000777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66600660000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56000660000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05500555000555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001010100000000000000000000000000010101000000000000000000000000000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000002c2d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000003c3d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000c0d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000c1f1e0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001c0e0f1c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c1c1d1d1c0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c1f1c1d1d1c1e0d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0f0e0f0e0f0e0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1c0e0f0e0f0e0f1c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1c1d1c2b2b1c1d1c1a1b1a1b1a1b1a1b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1c1d1c2a2a1c1d1c003a3b003a3b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0f1c2b2b1c0e0f002b2b002b2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212381212121212122712271200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
