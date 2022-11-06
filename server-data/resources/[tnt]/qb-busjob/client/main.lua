-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local route = 1
local max = #Config.NPCLocations.Locations
local busBlip = nil

local NpcData = {
    Active = false,
    CurrentNpc = nil,
    LastNpc = nil,
    CurrentDeliver = nil,
    LastDeliver = nil,
    Npc = nil,
    NpcBlip = nil,
    DeliveryBlip = nil,
    NpcTaken = false,
    NpcDelivered = false,
    CountDown = 180
}

local BusData = {
    Active = false,
}

-- Functions
local function resetNpcTask()
    NpcData = {
        Active = false,
        CurrentNpc = nil,
        LastNpc = nil,
        CurrentDeliver = nil,
        LastDeliver = nil,
        Npc = nil,
        NpcBlip = nil,
        DeliveryBlip = nil,
        NpcTaken = false,
        NpcDelivered = false,
    }
end

local function updateBlip()
    if PlayerData.job.name == "bus" then
        local coords = Config.Location
        busBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(busBlip, 513)
        SetBlipDisplay(busBlip, 4)
        SetBlipScale(busBlip, 0.6)
        SetBlipAsShortRange(busBlip, true)
        SetBlipColour(busBlip, 49)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Lang:t('info.bus_depot'))
        EndTextCommandSetBlipName(busBlip)
    elseif busBlip ~= nil then
        RemoveBlip(busBlip)
    end
end

local function whitelistedVehicle()
    local veh = GetEntityModel(GetVehiclePedIsIn(cache.ped, false))
    local retval = false

    for i = 1, #Config.AllowedVehicles, 1 do
        if veh == Config.AllowedVehicles[i].model then
            retval = true
        end
    end

    if veh == `dynasty` then
        retval = true
    end

    return retval
end

local function nextStop()
    if route <= (max - 1) then
        route = route + 1
    else
        route = 1
    end
end

local function GetDeliveryLocation()
    nextStop()
    if NpcData.DeliveryBlip ~= nil then
        RemoveBlip(NpcData.DeliveryBlip)
    end
    NpcData.DeliveryBlip = AddBlipForCoord(Config.NPCLocations.Locations[route].x, Config.NPCLocations.Locations[route].y, Config.NPCLocations.Locations[route].z)
    SetBlipColour(NpcData.DeliveryBlip, 3)
    SetBlipRoute(NpcData.DeliveryBlip, true)
    SetBlipRouteColour(NpcData.DeliveryBlip, 3)
    NpcData.LastDeliver = route
    local inRange = false
    DeliverZone = lib.zones.sphere({
        name = "busjobdeliver",
        coords = vec3(Config.NPCLocations.Locations[route].x,
        Config.NPCLocations.Locations[route].y, Config.NPCLocations.Locations[route].z),
        radius = 5,
        debug = false,
        onEnter = function()
            inRange = true
            exports["qb-core"]:DrawText(Lang:t('info.busstop_text'), 'rgb(220, 20, 60)')
            CreateThread(function()
                repeat
                    Wait(0)
                    if IsControlJustPressed(0, 38) then
                        local veh = GetVehiclePedIsIn(cache.ped, false)
                        TaskLeaveVehicle(NpcData.Npc, veh, 0)
                        SetEntityAsMissionEntity(NpcData.Npc, false, true)
                        SetEntityAsNoLongerNeeded(NpcData.Npc)
                        local targetCoords = Config.NPCLocations.Locations[NpcData.LastNpc]
                        TaskGoStraightToCoord(NpcData.Npc, targetCoords.x, targetCoords.y, targetCoords.z, 1.0, -1, 0.0, 0.0)
                        QBCore.Functions.Notify(Lang:t('success.dropped_off'), 'success')
                        if NpcData.DeliveryBlip ~= nil then
                            RemoveBlip(NpcData.DeliveryBlip)
                        end
                        local RemovePed = function(pped)
                            SetTimeout(60000, function()
                                DeletePed(pped)
                            end)
                        end
                        RemovePed(NpcData.Npc)
                        resetNpcTask()
                        nextStop()
                        TriggerEvent('qb-busjob:client:DoBusNpc')
                        exports["qb-core"]:HideText()
                        DeliverZone:remove()
                        break
                    end
                until not inRange
            end)
        end,
        onExit = function()
            exports["qb-core"]:HideText()
            inRange = false
        end
    })
end

local function closeMenuFull()
    lib.hideContext()
end

local function busGarage()
    local vehicleMenu = {}
    for _, v in pairs(Config.AllowedVehicles) do
        vehicleMenu[#vehicleMenu + 1] = {
            title = Lang:t('info.bus'),
            event = "qb-busjob:client:TakeVehicle",
            args = {
                model = v.model
            }
        }
    end
    lib.registerContext({
        id = 'open_busGarage_context_menu',
        title = Lang:t('menu.bus_header'),
        options = vehicleMenu
    })
    lib.showContext('open_busGarage_context_menu')
end

RegisterNetEvent("qb-busjob:client:TakeVehicle", function(data)
    local coords = Config.Location
    if (BusData.Active) then
        QBCore.Functions.Notify(Lang:t('error.one_bus_active'), 'error')
        return
    else
        QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
            local veh = NetToVeh(netId)
            SetVehicleNumberPlateText(veh, Lang:t('info.bus_plate') .. tostring(math.random(1000, 9999)))
            exports['LegacyFuel']:SetFuel(veh, 100.0)
            closeMenuFull()
            TaskWarpPedIntoVehicle(cache.ped, veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            SetVehicleEngineOn(veh, true, true, false)
        end, data.model, coords, true)
        Wait(1000)
        TriggerEvent('qb-busjob:client:DoBusNpc')
    end
end)

-- Events
AddEventHandler('onResourceStart', function(resourceName)
    -- handles script restarts
    if GetCurrentResourceName() == resourceName then
        updateBlip()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    updateBlip()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    updateBlip()

end)

RegisterNetEvent('qb-busjob:client:DoBusNpc', function()
    if whitelistedVehicle() then
        if not NpcData.Active then
            local Gender = math.random(1, #Config.NpcSkins)
            local PedSkin = math.random(1, #Config.NpcSkins[Gender])
            local model = GetHashKey(Config.NpcSkins[Gender][PedSkin])
            lib.requestModel(model)
            NpcData.Npc = CreatePed(3, model, Config.NPCLocations.Locations[route].x, Config.NPCLocations.Locations[route].y, Config.NPCLocations.Locations[route].z - 0.98, Config.NPCLocations.Locations[route].w, false, true)
            PlaceObjectOnGroundProperly(NpcData.Npc)
            FreezeEntityPosition(NpcData.Npc, true)
            if NpcData.NpcBlip ~= nil then
                RemoveBlip(NpcData.NpcBlip)
            end
            QBCore.Functions.Notify(Lang:t('info.goto_busstop'), 'primary')
            NpcData.NpcBlip = AddBlipForCoord(Config.NPCLocations.Locations[route].x, Config.NPCLocations.Locations[route].y, Config.NPCLocations.Locations[route].z)
            SetBlipColour(NpcData.NpcBlip, 3)
            SetBlipRoute(NpcData.NpcBlip, true)
            SetBlipRouteColour(NpcData.NpcBlip, 3)
            NpcData.LastNpc = route
            NpcData.Active = true
            local inRange = false
            PickupZone = lib.zones.sphere({
                name = "busjobdeliver",
                coords = vec3(Config.NPCLocations.Locations[route].x,
                Config.NPCLocations.Locations[route].y, Config.NPCLocations.Locations[route].z),
                radius = 5,
                debug = false,
                onEnter = function()
                    inRange = true
                    exports["qb-core"]:DrawText(Lang:t('info.busstop_text'), 'rgb(220, 20, 60)')
                    CreateThread(function()
                        repeat
                            Wait(5)
                            if IsControlJustPressed(0, 38) then
                                local veh = GetVehiclePedIsIn(cache.ped, false)
                                local maxSeats, freeSeat = GetVehicleModelNumberOfSeats(veh)

                                for i = maxSeats - 1, 0, -1 do
                                    if IsVehicleSeatFree(veh, i) then
                                        freeSeat = i
                                        break
                                    end
                                end

                                ClearPedTasksImmediately(NpcData.Npc)
                                FreezeEntityPosition(NpcData.Npc, false)
                                TaskEnterVehicle(NpcData.Npc, veh, -1, freeSeat, 1.0, 0)
                                QBCore.Functions.Notify(Lang:t('info.goto_busstop'), 'primary')
                                if NpcData.NpcBlip ~= nil then
                                    RemoveBlip(NpcData.NpcBlip)
                                end
                                GetDeliveryLocation()
                                NpcData.NpcTaken = true
                                TriggerServerEvent('qb-busjob:server:NpcPay')
                                exports["qb-core"]:HideText()
                                PickupZone:remove()
                                break
                            end
                        until not inRange
                    end)
                end,
                onExit = function()
                    exports["qb-core"]:HideText()
                    inRange = false
                end
            })
        else
            QBCore.Functions.Notify(Lang:t('error.already_driving_bus'), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t('error.not_in_bus'), 'error')
    end
end)

-- Threads
CreateThread(function()
    local inRange = false
    local inVeh = whitelistedVehicle()
    if PlayerData.job.name == "bus" then
        VehicleZone = lib.zones.sphere({
            name = "busMain",
            coords = vec3(Config.Location.x, Config.Location.y, Config.Location.z),
            radius = 5,
            debug = false,
            onEnter = function()
                inRange = true
                CreateThread(function()
                    repeat
                        Wait(5)
                        if not inVeh then
                            exports["qb-core"]:DrawText(Lang:t('info.busstop_text'), 'left')
                            if IsControlJustReleased(0, 38) then
                                busGarage()
                                exports["qb-core"]:HideText()
                                break
                            end
                        else
                            exports["qb-core"]:DrawText(Lang:t('info.bus_stop_work'), 'left')
                            if IsControlJustReleased(0, 38) then
                                if (not NpcData.Active or NpcData.Active and NpcData.NpcTaken == false) then
                                    if IsPedInAnyVehicle(cache.ped, false) then
                                        BusData.Active = false;
                                        DeleteVehicle(GetVehiclePedIsIn(cache.ped, false))
                                        RemoveBlip(NpcData.NpcBlip)
                                        exports["qb-core"]:HideText()
                                        resetNpcTask()
                                        break
                                    end
                                else
                                    QBCore.Functions.Notify(Lang:t('error.drop_off_passengers'), 'error')
                                end
                            end
                        end
                    until not inRange
                end)
            end,
            onExit = function()
                exports["qb-core"]:HideText()
                inRange = false
            end
        })
    end
end)
