
function StrToTable( str, stridx, num, stride )
    tbl={}
    for i=0,num do
        pos=stridx+i*stride
        sstr=sub(str,pos,pos+stride-1)
        add(tbl,tonum(sstr))
    end
    return tbl
end

SPRSTRING="0360480240080081.41.40000010480240080081.41.40010010570350070050.40.60000000560240100112.54.50000010480320080080.50020000000000400160110040040000010000000320240010010000000360000360240010010000000360000360240010010010000230400070070010010000001220250060060010010000011030250180150010010000001030250180150010010010000300400050110.60.60000010350400050110.60.60000010400400050110.60.60000010450400120081.21.20000010450400120081.21.20010010570400080230010010000010570400080230010010010010650400100131.80030000010650530200060030030000010750460040070.60.60000010750250090110023.50000010910240060070010020000010860240040060.20.50000000850300060050.40.80000000760360080040.20.80000010840350050090.90.90000010840350050090.90.90010010890350090090040090000010850440080081.11.10000010850440080081.11.10010010860530060100020030000010940440030120.40.40000010970490230132.52.5000001"
SDEF={}

SPRPSTRING="00400600300020006000001.601.6000000040004000000020008000100030002000101.500020001003000100060000-1.6-1.6000000040004000000020008000100030002000101.50002000100300040006000201.50008000100050005000100020004000100030002000001.40003000100400060018000000020002000000040002000001.50008000100050003000000020004000100030001000001.400030001002001400120000-1.1-1.1000000040006000201.100040001003001500080000-1.1-1.1000000160008000101.101.1000000050005000000020004000100400300330006000001.401.4000000340007000001.20008000100270006000001.100020001003003200060000-1.4-1.4000000340007000001.20008000100270006000001.100020001002003500120000-1.1-1.1000000340007000001.20003000100300360026000001.804.5000100340007000001.20003000100280009000001.20003000100900300180006000001.601.6000000210002000001.20008000100030001000001.500020001003001700060000-1.6-1.6000000210002000001.20008000100030001000001.5000200010020019000600001.0501.10000002000060001-1.1-1.1000000300210005000001.50006000100050005000000020004000100030001000001.400030001003001500080000-1.1-1.1000000160008000101.101.1000000050005000000020004000100200220008000000040006000100210003000001.50006000100300230006000001.201.20000002300060002-1.2-1.2000000210007000001.5000600010020019000800001.021.020000000300050000000200020001002002000080000-1.1-1.1000000030005000000020002000100600300300007000001.601.6000000270008000001.500020001002800050001000200040001003002900070000-1.6-1.6000000270008000001.50002000100280005000100020004000100300240012000001.50006000100260005000001.20004000100280004000001.40005000100300250012000001.50006000100260008000201.20004000100280006000101.40005000100100270006000001.60006000100300310018000000050009000100250020000001.50006000100270008000201.200040001"
SPDEF={}

function InitSpriteDef()
    
    -- Sprite def
    
    sstr=sub(SPRSTRING,1,3)
    len=tonum(sstr)
    idx=4
    for i=0,len-1 do
        add( SDEF, StrToTable( SPRSTRING, idx, 8, 3 ) )
        idx+=8*3
    end
    
    -- Sprite pattern def
    sstr=sub(SPRPSTRING,1,3)
    spidx=4
    thms=tonum(sstr)
    for i=1,thms do
        thm={}
        -- pattern groups
        sstr=sub(SPRPSTRING,spidx,spidx+2)
        nspg=tonum(sstr)
        spidx+=3
        for spg=1,nspg do
            -- patterns
            spg={}
            sstr=sub(SPRPSTRING,spidx,spidx+2)
            nsp=tonum(sstr)
            spidx+=3
            for j=1,nsp do
                -- 6 records
                add(spg, StrToTable( SPRPSTRING, spidx, 6, 4 ) )
                spidx+=24
            end
            add( thm, spg )
        end
        add(SPDEF,thm)
    end
end

