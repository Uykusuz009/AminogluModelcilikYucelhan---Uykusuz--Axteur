AnimationsTable = {}

-- overrideState - функция, позволяющая динамически обновлять состояние компонента
-- если возвращает nil, состояние не будет изменяться

-- vito
AnimationsTable[418] = {
    components = {
        ["door_dside_r0"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0.001, 0.1535} },		
            { time = 1000,   params = {-0.1, 0, 0.16} },
            { time = 1200,   params = {-0.1, 0, 0.19} },			
            { time = 3000, params = {-0.13, -1, 0.19} },
        },
        ["door_dside_r1"] = {
            { time = 0, easing = "OutQuad",    params = {0, 0, 0.135} },		
            { time = 1000,   params = {-0.1, 0, 0.16} },
            { time = 1200,   params = {-0.1, 0, 0.19} },			
            { time = 3000, params = {-0.13, -1, 0.19} },
        },
    },

    overrideState = function (vehicle)
        if getVehicleSpeed(vehicle) > 40 then
            return false
        end
        -- for door = 2, 5 do
        --     if getVehicleDoorOpenRatio(vehicle, door) > 0 then
        --         return true
        --     end
        -- end
    end
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