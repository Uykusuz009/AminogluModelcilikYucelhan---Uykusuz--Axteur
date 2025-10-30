local vehicleAnimations = {}
local localVehicleUpdateInterval = 500

-- Автомобиль, за рулем которого находится localPlayer
local function getDrivingVehicle()
    if localPlayer.vehicle and localPlayer.vehicle.controller == localPlayer then
        return localPlayer.vehicle
    end
end

-- Callback для обновления анимации компонента
local function updateVehicleComponents(params, x, y, z, rotX, rotY, rotZ)
    if isElement(params.vehicle) then
        setVehicleComponentPosition(params.vehicle, params.component, x, y, z)
		if (rotX) then
			setVehicleComponentRotation(params.vehicle, params.component, rotX, rotY, rotZ)
		end
    end
end

-- Если instantly == true, тогда анимация будет пропущена
function updateVehicleAnimationState(vehicle, instantly)
    if not isElement(vehicle) or not isElementStreamedIn(vehicle) then
        return
    end
    if not AnimationsTable[vehicle.model] then
        return
    end

    local state = not not vehicle:getData("movparts_state")
    local animations = vehicleAnimations[vehicle]
    if not animations then
        animations = {}
        vehicleAnimations[vehicle] = animations
    end
    for component, keyframes in pairs(AnimationsTable[vehicle.model].components) do
        if instantly then
            if isAnimation(animations[component]) then
                stopAnimation(animation)
            end
            local params = keyframes[1].params
            if state then
                params = keyframes[#keyframes].params
            end
            updateVehicleComponents({vehicle=vehicle, component=component}, unpack(params))
            vehicleAnimations[vehicle] = nil
            return
        else
            if isAnimation(animations[component]) then
                setAnimationReversed(animations[component], not state)
            else
                animations[component] = animate(keyframes, not state, updateVehicleComponents, {
                    vehicle   = vehicle,
                    component = component
                })
            end
        end
    end
end

function removeVehicleAnimation(vehicle)
    if not vehicle then
        return
    end
    if not vehicleAnimations[vehicle] then
        return
    end
    for component, animation in pairs(vehicleAnimations[vehicle])  do
        stopAnimation(animation)
    end
    vehicleAnimations[vehicle] = nil
end

setTimer(function ()
    local vehicle = getDrivingVehicle()
    if vehicle and AnimationsTable[vehicle.model] and AnimationsTable[vehicle.model].overrideState then
        local state = AnimationsTable[vehicle.model].overrideState(vehicle)
        if state ~= nil then
            vehicle:setData("movparts_state", state)
        end
    end
end, localVehicleUpdateInterval, 0)

addEventHandler("onClientPreRender", root, function (deltaTime)
    updateAnimators(deltaTime)
end)

addEventHandler("onClientElementStreamIn", root, function ()
    if getElementType(source) == "vehicle" then
        updateVehicleAnimationState(source, true)
    end
end)

addEventHandler("onClientElementStreamOut", root, function ()
    if getElementType(source) == "vehicle" then
        removeVehicleAnimation(source)
    end
end)

addEventHandler("onClientElementDestroy", root, function ()
    if getElementType(source) == "vehicle" then
        removeVehicleAnimation(source)
    end
end)

addEventHandler("onClientElementDataChange", root, function (data)
    if getElementType(source) == "vehicle" and data == "movparts_state" then
        updateVehicleAnimationState(source)
    end
end)

addEventHandler("onClientResourceStart", resourceRoot, function ()
    for i, vehicle in ipairs(getElementsByType("vehicle", root, true)) do
        updateVehicleAnimationState(vehicle, true)
    end
end)

function setVehicleMovpartsState(vehicle, state)
    if not isElement(vehicle) then
        return
    end
    if not AnimationsTable[vehicle.model] then
        return
    end
    if AnimationsTable[vehicle.model].overrideState then
        local overrideState = AnimationsTable[vehicle.model].overrideState(vehicle)
        if overrideState ~= nil then
            state = overrideState
        end
    end
    vehicle:setData("movparts_state", not not state)
end

addCommandHandler("sanruf", function ()
    local vehicle = getDrivingVehicle()
    if vehicle then
        setVehicleMovpartsState(vehicle, not vehicle:getData("movparts_state"))
    end
end)

addEvent("setPlayerVehicleMovpartsState", true)
addEventHandler("setPlayerVehicleMovpartsState", root, function (state)
    if not isElement(source) or getElementType(source) ~= "vehicle" then
        return
    end
    setVehicleMovpartsState(source, state)
end)


-- Sitemiz : https://sparrow-mta.blogspot.com/

-- Facebook : https://facebook.com/sparrowgta/
-- İnstagram : https://instagram.com/sparrowmta/
-- YouTube : https://youtube.com/c/SparroWMTA/

-- Discord : https://discord.gg/DzgEcvy