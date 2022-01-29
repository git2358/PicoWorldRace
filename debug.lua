local DEBUG_PRINT = {}
local DEBUG_PRINT_I = 1

function DebugPrint(n)
    DEBUG_PRINT[DEBUG_PRINT_I] = n
    DEBUG_PRINT_I += 1
end

function DebugUpdate()
    DEBUG_PRINT_I = 1
    for i = 1,#DEBUG_PRINT do
        DEBUG_PRINT[i] = "-"
    end
end

function DebugRender()
    fillp(0)
    for i = 1,#DEBUG_PRINT do
        print(tostr(DEBUG_PRINT[i]),2,2 + (i-1) * 6, 0)
    end
    print( flr(stat(1)*100).."%", 98,2,3 )
    -- print(tostr( flr(stat(0)) ) .."/2048k", 98,10,3 )

    if #proftms > 0 then
        --rectfill( 0, 0, 28, 128, 3 )
        for i = 1,#proftms do
            print(tostr(i)..". ".. tostr(proftms[i]),24,2 + (i-1) * 6, 0)
            proftms[i]=0
        end
    end
end

proftms={0,0,0,0,0,0,0,0}
profstrt={}

function ProfileStart( id )
    profstrt[id]=stat(1)
end

function ProfileEnd( id )
    proftms[id]=proftms[id]+(stat(1)-profstrt[id])
end