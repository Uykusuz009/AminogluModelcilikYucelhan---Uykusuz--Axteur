function getVehicleSpeed(vehicle)
    local vx, vy, vz = getElementVelocity(vehicle)
    return ((vx^2 + vy^2 + vz^2)^(0.5))*180
end
