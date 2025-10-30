function setVehicleMovpartsState(player, vehicle, state)
    if not isElement(player) or not isElement(vehicle) then
        return false
    end
    return triggerClientEvent(player, "setPlayerVehicleMovpartsState", vehicle, not not state)
end




