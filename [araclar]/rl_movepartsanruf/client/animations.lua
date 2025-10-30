AnimationsTable = {}

-- overrideState - функция, позволяющая динамически обновлять состояние компонента
-- если возвращает nil, состояние не будет изменяться

-- bmw e36
AnimationsTable[442] = {
    components = {
        ["revalsanruf"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0, 0} },
			{ time = 0,   params = {0, 0, 0, 0,0,0} },	--çekip açarken	
            { time = 1500,   params = {0, -0.2, 0, -10,0,0} },	--çekip açarken		
        },
    },
	--overrideState = function (vehicle)
        --if getVehicleSpeed(vehicle) > 40 then
            --return false
        --end
    --end
}
-- bme e60
AnimationsTable[445] = {
    components = {
        ["revalsanruf"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0, 0} },
            { time = 0,   params = {0, 0, 0, 0,0,0} },	--çekip açarken		
            { time = 3000, params = {0, -0.2, 0, -10,0,0} },  --soldaki konum sağa aağa atıyor. ortadaki konum öne atıyor. sağdaki yükseklik
        },
    },
    --overrideState = function (vehicle)
        --if getVehicleSpeed(vehicle) > 40 then
            --return false
        --end
    --end
}
-- c63 amg
AnimationsTable[585] = {
    components = {
        ["revalsanruf"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0.65, 0.54} },
            { time = 1200,   params = {0, 0.65, 0.54, 0,0,0} },	--çekip açarken		
            { time = 3000, params = {0, 0.55, 0.42, -10,0,0} },  --soldaki konum sağa aağa atıyor. ortadaki konum öne atıyor. sağdaki yükseklik
        },
    },
--overrideState = function (vehicle)
        --if getVehicleSpeed(vehicle) > 40 then
            --return false
        --end
    --end
}
-- c63s amg
AnimationsTable[504] = {
    components = {
        ["revalsanruf"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0.025, -0.133} },
            { time = 1000,   params = {0, 0.025, -0.133, 0,0,0} },	--çekip açarken		
			{ time = 2000,   params = {0, 0.025, -0.13, 0,0,0} },	--çekip açarken	
            { time = 5000, params = {0, -0.4, -0.12, 3,0,0} },  --soldaki konum sağa aağa atıyor. ortadaki konum öne atıyor. sağdaki yükseklik
        },
    },
}
-- passat
AnimationsTable[467] = {
    components = {
        ["revalsanruf"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0, 0} },
            { time = 1000,   params = {0, 0.025, 0, 0,0,0} },	--çekip açarken		
			{ time = 2000,   params = {0, 0.025, 0.03, 0,0,0} },	--çekip açarken	
            { time = 5000, params = {0, -0.4, 0.05, 5,0,0} },  --soldaki konum sağa aağa atıyor. ortadaki konum öne atıyor. sağdaki yükseklik
        },
    },
}

-- passat
AnimationsTable[402] = {
    components = {
        ["revalsanruf"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0, 0} },
            { time = 1000,   params = {0, 0.025, 0, 0,0,0} },	--çekip açarken		
			{ time = 2000,   params = {0, 0.025, 0.03, 0,0,0} },	--çekip açarken	
            { time = 5000, params = {0, -0.4, 0.05, 5,0,0} },  --soldaki konum sağa aağa atıyor. ortadaki konum öne atıyor. sağdaki yükseklik
        },
    },
}

-- rs5
AnimationsTable[491] = {
    components = {
        ["revalsanruf"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0, 0} },
            { time = 1000,   params = {0, 0.025, 0, 0,0,0} },	--çekip açarken		
			{ time = 2000,   params = {0, 0.025, 0.03, 0,0,0} },	--çekip açarken	
            { time = 5000, params = {0, -0.4, 0.05, 5,0,0} },  --soldaki konum sağa aağa atıyor. ortadaki konum öne atıyor. sağdaki yükseklik
        },
    },
}
-- 5.30d
AnimationsTable[516] = {
    components = {
        ["revalsanruf"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0.058, 0} }, --kapalı konum
            { time = 0,   params = {0, 0.058, 0, 0,0,0} },	--kaldırıyoruz 
			{ time = 1200,   params = {0, -0.097, 0, -10,0,0} },	--kaldırıyoruz 
        },
    },
}


local function setAnimationTime(model, mul)
    for n, t in pairs(AnimationsTable[model].components) do
        for i, k in ipairs(t) do
            if k.time then
                k.time = k.time * mul
            end
        end
    end
end

for model, t in pairs(AnimationsTable) do
    if t.timeMul then
        setAnimationTime(model, t.timeMul)
    end
end

addCommandHandler("dp", function (cmd, name)
    local v = localPlayer.vehicle
    v:resetComponentPosition(name)
    outputChatBox(inspect({v:getComponentPosition(name)}))
end)


-- Sitemiz : https://sparrow-mta.blogspot.com/

-- Facebook : https://facebook.com/sparrowgta/
-- İnstagram : https://instagram.com/sparrowmta/
-- YouTube : https://youtube.com/c/SparroWMTA/

-- Discord : https://discord.gg/DzgEcvy