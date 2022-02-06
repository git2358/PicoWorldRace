pico-8 cartridge // http://www.pico-8.com
version 19
__lua__
-- hello world
-- by zep

-- sprite definitions (the bottom of the sprite should be on the ground)
-- 1.sx, 2.sy, 3.sw, 4.sh, 5.scalemin, 6.scalemax, 7.flip, 8.collidable

SDEF = { 
    { 48, 24, 8, 8, 1.4, 1.4, 0, 1 }, -- 1. chevron r (orange)
    { 48, 24, 8, 8, 1.4, 1.4, 1, 1 }, -- 2. chevron l (orange)
    { 57, 35, 7, 5, 0.4, 0.6, 0, 0 }, -- 3. grass
    { 56, 24, 10, 11, 2.5, 4.5, 0, 1 }, -- 4. tree
    { 48, 32, 8, 8, 0.5, 2, 0, 0 }, -- 5. shrub
    { 0, 40, 16, 11, 4, 4, 0, 1 }, -- 6. bilboard
    { 0, 0, 32, 24, 1, 1, 0, 0 }, -- 7. opponent car
    { 36, 0, 36, 24, 1, 1, 0, 0 }, -- 8. opponent car l
    { 36, 0, 36, 24, 1, 1, 1, 0 }, -- 9. opponent car r
    { 23, 40, 7, 7, 1, 1, 0, 0 }, -- 10. token
    { 122, 25, 6, 6, 1, 1, 0, 1 }, -- 11. gantry section
    { 103, 25, 18, 15, 1, 1, 0, 0 }, -- 12. start/end banner left
    { 103, 25, 18, 15, 1, 1, 1, 0 }, -- 13. start/end banner right
    { 30, 40, 5, 11, 0.6, 0.6, 0, 1 }, -- 14. warn sign
    { 35, 40, 5, 11, 0.6, 0.6, 0, 1 }, -- 15. diamond sign
    { 40, 40, 5, 11, 0.6, 0.6, 0, 1 }, -- 16. diamond sign back
    { 45, 40, 12, 8, 1.2, 1.2, 0, 1 }, -- 17. chevron r (red)
    { 45, 40, 12, 8, 1.2, 1.2, 1, 1 }, -- 18. chevron l (red)
    { 57, 40, 8, 23, 1, 1, 0, 1 }, -- 19. jap flag l
    { 57, 40, 8, 23, 1, 1, 1, 1 }, -- 20. jap flag r
    { 65, 40, 10, 13, 1.8, 3, 0, 1 }, -- 21. sakura tree
    { 65, 53, 20, 6, 3, 3, 0, 1 }, -- 22. distant building
    { 75, 46, 4, 7, 0.6, 0.6, 0, 1 }, -- 23. jap lantern
    { 75, 25, 9, 11, 2, 3.5, 0, 1 }, -- 24. burned tree
    { 91, 24, 6, 7, 1, 2, 0, 1 }, -- 25. burned tree 2
    { 86, 24, 4, 6, 0.2, 0.5, 0, 0 }, -- 26. desert plant
    { 85, 30, 6, 5, 0.4, 0.8, 0, 0 }, -- 27. bush (desert?)
    { 76, 36, 8, 4, 0.2, 0.8, 0, 1 }, -- 28. rock
    { 84, 35, 5, 9, 0.9, 0.9, 0, 1 }, -- 29. black chevron r
    { 84, 35, 5, 9, 0.9, 0.9, 1, 1 }, -- 30. black chevron l
    { 89, 35, 9, 9, 4, 9, 0, 1 }, -- 31. big desert rock
    { 85, 44, 8, 8, 1.1, 1.1, 0, 1 }, -- 32. green chevron r
    { 85, 44, 8, 8, 1.1, 1.1, 1, 1 }, -- 33. green chevron l
    { 86, 53, 6, 10, 2, 3, 0, 1 }, -- 34. pine tree
    { 94, 44, 3, 12, 0.4, 0.4, 0, 1 }, -- 35. vertical warning sign
    { 97, 49, 23, 13, 2.5, 2.5, 0, 1 }, -- 36. cabin
}

-- sprite pattern definitions
-- when conflict first is used
-- 1. SDEF, 2. interval, 3. interval offset, 4. minx (*roadw), 5. maxx (*roadw), 6. rand l/r
SPDEF = {
    -- 1. Green raceway
    {
    { { 2, 6,0, 1.6, 1.6, 0 }, { 4, 4,0, 2, 8, 1 }, { 3, 2,1, 1.5, 2, 1 }  }, --  <LEFT> chevron l, trees, grass
    { { 1, 6, 0, -1.6, -1.6, 0 }, { 4, 4,0, 2, 8, 1 }, { 3, 2,1, 1.5, 2, 1 }  }, --  <RIGHT> chevron r, trees, grass
    { { 4, 6,2, 1.5, 8, 1 }, { 5, 5,1, 2, 4, 1 }, { 3, 2,0, 1.4, 3, 1 } }, -- trees, shrubs, grass
    { { 6, 18,0, 2, 2, 0 }, { 4, 2,0,  1.5, 8, 1 }, { 5, 3,0, 2, 4, 1 }, { 3, 1,0, 1.4, 3, 1 } }, -- billboard, trees, shrubs, grass
    { { 14, 12, 0, -1.1, -1.1, 0 }, { 4, 6,2, 1.1, 4, 1 }  }, --  warning sign l, tree
    { { 15, 8, 0,-1.1,-1.1, 0 }, { 16, 8, 1, 1.1, 1.1, 0 }, { 5, 5, 0, 2, 4, 1 }  }, --  diamond sign, shrubs
    -- 2. Snowy
    },{
    { { 33, 6, 0, 1.4, 1.4, 0 }, { 34, 7, 0, 1.2, 8, 1 }, { 27, 6,0, 1.1, 2, 1 }  }, --  <LEFT> chevron, trees, bush
    { { 32, 6,0, -1.4, -1.4, 0 }, { 34, 7, 0, 1.2, 8, 1 }, { 27, 6,0, 1.1, 2, 1 }  }, --  <RIGHT> chevron, trees, bush
    { { 35, 12, 0, -1.1, -1.1, 0 }, { 34, 7, 0, 1.2, 3, 1 }  }, --  warning, trees
    { { 36, 26, 0, 1.8, 4.5, 1 }, { 34, 7, 0, 1.2, 3, 1 }, { 28, 9, 0, 1.2, 3, 1 }  }, --  cabin, trees, rocks
    -- 3. Japan
    },{
    { { 18, 6, 0, 1.6, 1.6, 0 }, { 21, 2, 0, 1.2, 8, 1 }, { 3, 1,0, 1.5, 2, 1 }  }, -- <LEFT> chevron l, trees, grass
    { { 17, 6, 0, -1.6, -1.6, 0 }, { 21, 2, 0, 1.2, 8, 1 }, { 3, 1,0, 1.5, 2, 1 }  }, -- <RIGHT> chevron r, trees, grass
    { { 19, 6, 0, 1.05, 1.1, 0 }, { 20, 6, 1, -1.1, -1.1, 0 } }, -- 5. flag
    { { 21, 5, 0, 1.5, 6, 1 },  { 5, 5, 0, 2, 4, 1 }, { 3, 1,0, 1.4, 3, 1 } }, -- trees, shrubs, grass
    { { 15, 8, 0,-1.1,-1.1, 0 }, { 16, 8, 1, 1.1, 1.1, 0 }, { 5, 5, 0, 2, 4, 1 }  }, --  diamond sign, shrubs
    { { 22, 8, 0, 4, 6, 1 }, { 21, 3, 0, 1.5, 6, 1 } }, -- 13. buildings (x2), trees
    { { 23, 6, 0, 1.2, 1.2, 0 }, { 23, 6, 2, -1.2, -1.2, 0 }, { 21, 7, 0, 1.5, 6, 1 } }, -- 14. lantern (x2), tree
    { { 19, 8, 0, 1.02, 1.02, 0 }, { 3, 5, 0, 2, 2, 1 } }, -- 15. flag right only
    { { 20, 8, 0, -1.1, -1.1, 0 }, { 3, 5, 0, 2, 2, 1 } }, -- 16. flag left only
     -- 4. Red desert
    },{
    { { 30, 7, 0, 1.6, 1.6, 0 }, { 27, 8, 0, 1.5, 2, 1 }, { 28, 5, 1, 2, 4, 1 }  }, --  <LEFT> chevron, bush, rocks
    { { 29, 7, 0, -1.6, -1.6, 0 }, { 27, 8, 0, 1.5, 2, 1 }, { 28, 5, 1, 2, 4, 1 }  }, --  <RIGHT> chevron, bush, rocks
    { { 24, 12, 0, 1.5, 6, 1 },  { 26, 5, 0, 1.2, 4, 1 }, { 28, 4,0, 1.4, 5, 1 } }, -- b trees, d plant, rock
    { { 25, 12, 0, 1.5, 6, 1 },  { 26, 8, 2, 1.2, 4, 1 }, { 28, 6,1, 1.4, 5, 1 } }, -- b trees2, d plant, rock
    { { 27, 6, 0, 1.6, 6, 1 } }, -- bush
    { { 31, 18, 0, 5, 9, 1 }, { 25, 20, 0, 1.5, 6, 1 },  { 27, 8, 2, 1.2, 4, 1 } }, -- big rok, b trees2, bush
    }
}

local str=""
local sdtest={}
local sptest={}

function ToThreeChar( num )
    nmstr=tostr(num)
    s=""
    --assert( #nmstr <= 3 )
    if #nmstr == 1 then
        s="0".."0"..nmstr
    elseif #nmstr == 2 then
        s="0"..nmstr
    elseif #nmstr == 3 then
        s=nmstr
    else
        print(num)
        assert( false )
    end
    return s
end

function ToFourChar( num )
    nmstr=tostr(num)
    s=""
    --assert( #nmstr <= 3 )
    if #nmstr == 1 then
        s="0".."0".."0"..nmstr
    elseif #nmstr == 2 then
        s="0".."0"..nmstr
    elseif #nmstr == 3 then
        s="0"..nmstr
    elseif #nmstr == 4 then
        s=nmstr
    else
        print(num)
        assert( false )
    end
    return s
end

function StrToTable( str, stridx, num, stride )
    tbl={}
    for i=0,num do
        pos=stridx+i*stride
        sstr=sub(str,pos,pos+stride-1)
        add(tbl,tonum(sstr))
    end
    return tbl
end

function ExportSDEF()

    str=ToThreeChar(#SDEF)
    --appendn( outstr, #SDEF )
    --for i=1,#SDEF do
    for i=1,#SDEF do
        for j=1,8 do
            str=str..ToThreeChar(SDEF[i][j])
        end
    end

    --print(SDEF[1][8])

    printh( str, "spr.txt", true )
    printh( str, "@clip" )

    -- TEST
    sstr=sub(str,1,3)
    len=tonum(sstr)
    print(len)
    idx=4
    for i=0,len-1 do
        add( sdtest, StrToTable( str, idx, 8, 3 ) )
        idx+=8*3
    end

end

function ExportSPDEF()

    -- num themes
    str=ToThreeChar(#SPDEF)
    for i=1,#SPDEF do
        -- num pattern groups
        str=str..ToThreeChar(#SPDEF[i])
        sppg=SPDEF[i]
        for spg=1,#sppg do
            -- num patterns
            str=str..ToThreeChar(#sppg[spg])
            sp=sppg[spg]
            for p=1,#sp do
                -- always 6
                for k=1,6 do
                    str=str..ToFourChar(sp[p][k])
                end
            end
        end
    end

    printh( str, "sprp.txt", true )
    printh( str, "@clip" )
    
    -- TEST
    sstr=sub(str,1,3)
    spidx=4
    thms=tonum(sstr)
    print(len)
    for i=1,thms do
        thm={}
        -- pattern groups
        sstr=sub(str,spidx,spidx+2)
        nspg=tonum(sstr)
        spidx+=3
        for spg=1,nspg do
            -- patterns
            spg={}
            sstr=sub(str,spidx,spidx+2)
            nsp=tonum(sstr)
            spidx+=3
            for j=1,nsp do
                -- 6 records
                add(spg, StrToTable( str, spidx, 6, 4 ) )
                spidx+=24
            end
            add( thm, spg )
        end
        add(sptest,thm)
    end

end

function _init()
    ExportSPDEF()
end

function _draw()
	cls()
	
   
    print( "done" )
    
--[[
    -- TEST
    sptest={}
    sstr=sub(str,1,3)
    spidx=4
    thms=tonum(sstr)
    for i=1,thms do
        thm={}
        -- pattern groups
        sstr=sub(str,spidx,spidx+2)
        nspg=tonum(sstr)
        spidx+=3
        print(nspg,2)
        for spg=1,nspg do
            -- patterns
            spg={}
            sstr=sub(str,spidx,spidx+2)
            nsp=tonum(sstr)
            print(nsp,3 )
            spidx+=3
            for j=1,nsp do
                -- 6 records
                add(spg, StrToTable( str, spidx, 6, 4 ) )
                spidx+=24
            end
            add( thm, spg )
        end
        add(sptest,thm)
    end
--]]

    for i = 1,6 do
    print( sptest[3][3][2][i] )
    end
    
    --[[
	str="0451.20.8001"
    --print(#str)
    for i=1,#str,3 do
        sstr=sub(str,i,i+2)
        print(tonum(sstr))
    end
    --]]
 end
	
















__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888887800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077007700777777007700000077000000777777000000000770007700777777007777770077000000777700000000000000000000000000000000000
00000000077007700770000007700000077000000770077000000000770007700770077007700770077000000770077000000000000000000000000000000000
00000000077007700770000007700000077000000770077000000000770707700770077007700770077000000770077000000000000000000000000000000000
00000000077777700777700007700000077000000770077000000000777777700770077007777000077000000770077000000000000000000000000000000000
00000000077007700770000007700000077000000770077000000000777077700770077007700770077000000770077000000000000000000000000000000000
00000000077007700777777007777770077777700777777000000000770007700777777007700770077777700777777000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000007777770077000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000007777770087788770077000000077770000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000007700770087708770077000000977907700000000000000000000000
00000000000000000000000000000000000000000000000000000000000000077000770087788770087777800a77000000977a97700000000000000000000000
00000000000000000000000000000000000000000000000000000000000000077000770087708770087789770a77000000977b97700000000000000000000000
00000000000000000000000000000000000000000000000000000000000000077070770087798770a877a8770a7777770c977097700000000000000000000000
0000000000000088c088c00000000000000000000000000000000000000000077777770087777770a88998800a8888880c977777700000000000000000000000
0000000000000077ce77ce0000000000000000000000000000000000000000977787770088aa8800a99ba990ca9999990c999999000000000000000000000000
0000000000000077ce77ceaaaaaae000000000000000007777770000000000977888770088888800a99ab990caaaaaa00caaaaaa000000000000000000000000
00000000000000778877ce7777770077000000770000007700770000000000988808880b99bb9900aaccaa00cbb00000ecbbbbbb000000000000000000000000
00000000000000777777ce77e0000077000000770000007788770000000000988999880b99999900aabbaa00cbbbbbb0ecccccc0000000000000000000000000
0000000000000077ce77ce77aae00077000000770000007799770000000000999099900baa0baa0dbbddbb00cc000000edd0edd0000000000000000000000000
0000000000000077ee77ee77770000770000007700000077aa77000000000b990ab9900baaaaaa0dbbccbb00cccccc00edddddd0000000000000000000000000
000000000000000000000077aaaae07700000077000000777777000000000baaaaaaa00bb00bb00dcc0dcc00dd000000ee00ee00000000000000000000000000
000000000000000000000077777700777777007777770088cc88000000000baaa0aaa0dbbbbbb00dccdecc00dddddd00eeeeee00000000000000000000000000
0000000000000000000000000000008888880088888800888888000000000baabbbaa0dcc0dcc00dd00dd000ee00000000000000000000000000000000000000
0000000000000000000000000000009999990099999900999999000000000bbbcbbb00dccedcc00dd00dd000eeeeee0000000000000000000000000000000000
00000000000000000000000000000000000000aaaaaa00aaaaaa000000000bbcccbb00dcccccc00eeee000000000000000000000000000000000000000000000
00000000000000000000000000000000000000bbbbbb00bbbbbb000000000cccdccc00dd00dd000ee00ee0000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000cccccc000000000ccdedcc00dddddd000ee00ee0000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000dddddd000000000dde0edd00ee00ee0000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000ee000ee00eeeeee0000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000eee0e0e0eee00ee00000eee00ee00000eee0eee00ee00ee00000eee000000000000000000000000000000000000
00000000000000000000000000000000000000e00e0e00e00e00000000e00e0000000e0e00e00e000e0e00000e0e000000000000000000000000000000000000
00000000000000000000000000000000000000e00eee00e00eee000000e00eee00000eee00e00e000e0e0eee0eee000000000000000000000000000000000000
00000000000000000000000000000000000000e00e0e00e0000e000000e0000e00000e0000e00e000e0e00000e0e000000000000000000000000000000000000
00000000000000000000000000000000000000e00e0e0eee0ee000000eee0ee000000e000eee00ee0ee000000eee000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000cc00ccc00cc0ccc00000ccc00cc00000ccc0ccc0ccc0ccc00000c0c00cc0c0c0000000000000000000000000000000
0000000000000000000000000000000000c0c00c00c000c00000000c00c0c00000ccc0c000c0000c000000c0c0c0c0c0c0000000000000000000000000000000
0000000000000000000000000000000000c0c00c00c000cc0000000c00c0c00000c0c0cc00cc000c000000ccc0c0c0c0c0000000000000000000000000000000
0000000000000000000000000000000000c0c00c00c000c00000000c00c0c00000c0c0c000c0000c00000000c0c0c0c0c0000000000000000000000000000000
0000000000000000000000000000000000c0c0ccc00cc0ccc000000c00cc000000c0c0ccc0ccc00c000000ccc0cc000cc0000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000008808800000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000088888780000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000088888880000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000008888800000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000888000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__sfx__
0110000000472004620c3400c34318470004311842500415003700c30500375183750c3000c3751f4730c375053720536211540114330c37524555247120c3730a470163521d07522375164120a211220252e315
01100000183732440518433394033c65539403185432b543184733940318433394033c655306053940339403184733940318423394033c655394031845321433184733940318473394033c655394033940339403
01100000247552775729755277552475527755297512775524755277552b755277552475527757297552775720755247572775524757207552475227755247522275526757297552675722752267522975526751
01100000001750c055003550c055001750c055003550c05500175180650c06518065001750c065003650c065051751106505365110650c17518075003650c0650a145160750a34516075111451d075113451d075
011000001b5771f55722537265171b5361f52622515265121b7771f76722757267471b7461f7362271522712185771b5571d53722517187361b7261d735227122454527537295252e5171d73514745227452e745
01100000275422754227542275422e5412e5452b7412b5422b5452b54224544245422754229541295422954224742277422e7422b7422b5422b5472954227542295422b742307422e5422e7472b547305462e742
0110000030555307652e5752b755295622e7722b752277622707227561297522b072295472774224042275421b4421b5451b5421b4421d542295471d442295422444624546245472444727546275462944729547
0110000000200002000020000200002000020000200002000020000200002000020000200002000020000200110171d117110171d227131211f227130371f2370f0411b1470f2471b35716051221571626722367
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002e775000002e1752e075000002e1752e77500000
__music__
00 00044208
00 00044108
00 00010304
00 00010304
01 00010203
00 00010203
00 00010305
00 00010306
00 00010305
00 00010306
00 00010245
02 00010243

