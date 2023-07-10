local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("+ui", function()
    SendNUIMessage({
        action = "open",
        type = "close"
    })
    SetNuiFocus(true, true)
end)

RegisterKeyMapping('+ui', 'Open UI', 'keyboard', 'F2')


RegisterNUICallback("spawncar", function(data, cb)
    local coords = QBCore.Functions.GetCoords(PlayerPedId())
    QBCore.Functions.SpawnVehicle(data.name, function(veh)
    SetVehicleNumberPlateText(veh, 'TEST')
    SetEntityHeading(veh, coords.w)
    exports['LegacyFuel']:SetFuel(veh, 100.0)
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end)

RegisterNUICallback("releaseFocus", function(data, cb)
    SetNuiFocus(false, false)
end)