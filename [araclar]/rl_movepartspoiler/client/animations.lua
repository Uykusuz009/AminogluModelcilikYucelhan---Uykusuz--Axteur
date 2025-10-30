AnimationsTable = {}

-- overrideState - функция, позволяющая динамически обновлять состояние компонента
-- если возвращает nil, состояние не будет изменяться

-- mclaren
AnimationsTable[503] = {
    components = {
        ["revalspoiler"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0, 0, 0, 0, 0} },
            { time = 1000,   params = {0, 0, 0, 0, 0, 0} },	--çekip açarken		
            { time = 2000, params = {0, -0.3, -0.3, -15, 0, 0} },  --soldaki konum sağa aağa atıyor. ortadaki konum öne atıyor. sağdaki yükseklik
        },
    },
}
-- koenigsegg
AnimationsTable[411] = {
    components = {
        ["revalspoiler"] = {
            { time = 0, easing = "OutQuad",    params = {0, -0.5, 0.5, 0, 0, 0} }, --kapalı konum
            { time = 2000,   params = {0, -0.5, 0.2, -10, 0, 0} },	--açılma konumu
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