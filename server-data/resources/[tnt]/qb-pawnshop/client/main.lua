local QBCore = exports['qb-core']:GetCoreObject()
local isMelting = false
local canTake = false
local meltTime
local meltedItem = {}

CreateThread(function()
    for _, value in pairs(Config.PawnLocation) do
        local blip = AddBlipForCoord(value.coords.x, value.coords.y, value.coords.z)
        SetBlipSprite(blip, 431)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 5)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(Lang:t('info.title'))
        EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    if Config.UseTarget then
        for key, value in pairs(Config.PawnLocation) do
            exports.ox_target:addBoxZone({
                coords = value.coords,
                size = value.size,
                rotation = value.heading,
                debug = value.debugPoly,
                options = {
                    {
                        name = 'PawnShop' .. key,
                        event = 'qb-pawnshop:client:openMenu',
                        icon = 'fas fa-ring',
                        label = 'PawnShop ' .. key,
                        distance = value.distance
                    }
                }
            })
        end
    else
        local zone = {}
        for key, value in pairs(Config.PawnLocation) do
            zone[#zone + 1] = lib.zones.box({
                name = 'PawnShop' .. key,
                coords = value.coords,
                size = value.size,
                rotation = value.heading,
                debug = value.debugPoly,
                onEnter = function()
                    lib.registerContext({
                        id = 'open_pawnShopMain',
                        title = Lang:t('info.title'),
                        options = {
                            {
                                title = Lang:t('info.open_pawn'),
                                event = 'qb-pawnshop:client:openMenu'
                            }
                        }
                    })
                    lib.showContext('open_pawnShopMain')
                end,
                onExit = function()
                    lib.hideContext(false)
                end
            })
        end
    end
end)

RegisterNetEvent('qb-pawnshop:client:openMenu', function()
    if Config.UseTimes then
        if GetClockHours() >= Config.TimeOpen and GetClockHours() <= Config.TimeClosed then
            local pawnShop = {
                {
                    title = Lang:t('info.sell'),
                    description = Lang:t('info.sell_pawn'),
                    event = 'qb-pawnshop:client:openPawn',
                    args = {
                        items = Config.PawnItems
                    }
                }
            }
            if not isMelting then
                pawnShop[#pawnShop + 1] = {
                    title = Lang:t('info.melt'),
                    description = Lang:t('info.melt_pawn'),
                    event = 'qb-pawnshop:client:openMelt',
                    args = {
                        items = Config.MeltingItems
                    }
                }
            end
            if canTake then
                pawnShop[#pawnShop + 1] = {
                    title = Lang:t('info.melt_pickup'),
                    serverEvent = 'qb-pawnshop:server:pickupMelted',
                    args = {
                        items = meltedItem
                    }
                }
            end
            lib.registerContext({
                id = 'open_pawnShop',
                title = Lang:t('info.title'),
                options = pawnShop
            })
            lib.showContext('open_pawnShop')
        else
            QBCore.Functions.Notify(Lang:t('info.pawn_closed', { value = Config.TimeOpen, value2 = Config.TimeClosed }))
        end
    else
        local pawnShop = {
            {
                title = Lang:t('info.sell'),
                description = Lang:t('info.sell_pawn'),
                event = 'qb-pawnshop:client:openPawn',
                args = {
                    items = Config.PawnItems
                }
            }
        }
        if not isMelting then
            pawnShop[#pawnShop + 1] = {
                title = Lang:t('info.melt'),
                description = Lang:t('info.melt_pawn'),
                event = 'qb-pawnshop:client:openMelt',
                args = {
                    items = Config.MeltingItems
                }
            }
        end
        if canTake then
            pawnShop[#pawnShop + 1] = {
                title = Lang:t('info.melt_pickup'),
                serverEvent = 'qb-pawnshop:server:pickupMelted',
                args = {
                    items = meltedItem
                }
            }
        end
        lib.registerContext({
            id = 'open_pawnShop',
            title = Lang:t('info.title'),
            options = pawnShop
        })
        lib.showContext('open_pawnShop')
    end
end)

RegisterNetEvent('qb-pawnshop:client:openPawn', function(data)
    lib.callback('qb-pawnshop:server:getInv', false, function(inventory)
        local PlyInv = inventory
        local pawnMenu = {}

        for _, v in pairs(PlyInv) do
            for i = 1, #data.items do
                if v.name == data.items[i].item then
                    pawnMenu[#pawnMenu + 1] = {
                        title = QBCore.Shared.Items[v.name].label,
                        description = Lang:t('info.sell_items', { value = data.items[i].price }),
                        event = 'qb-pawnshop:client:pawnitems',
                        args = {
                            label = QBCore.Shared.Items[v.name].label,
                            price = data.items[i].price,
                            name = v.name,
                            amount = v.amount
                        }
                    }
                end
            end
        end
        lib.registerContext({
            id = 'open_pawnMenu',
            menu = 'open_pawnShop',
            title = Lang:t('info.title'),
            options = pawnMenu
        })
        lib.showContext('open_pawnMenu')
    end)
end)

RegisterNetEvent('qb-pawnshop:client:openMelt', function(data)
    lib.callback('qb-pawnshop:server:getInv', false, function(inventory)
        local PlyInv = inventory
        local meltMenu = {}

        for _, v in pairs(PlyInv) do
            for i = 1, #data.items do
                if v.name == data.items[i].item then
                    meltMenu[#meltMenu + 1] = {
                        title = QBCore.Shared.Items[v.name].label,
                        description = Lang:t('info.melt_item', { value = QBCore.Shared.Items[v.name].label }),
                        event = 'qb-pawnshop:client:meltItems',
                        args = {
                            label = QBCore.Shared.Items[v.name].label,
                            reward = data.items[i].rewards,
                            name = v.name,
                            amount = v.amount,
                            time = data.items[i].meltTime
                        }
                    }
                end
            end
        end
        lib.registerContext({
            id = 'open_meltMenu',
            menu = 'open_pawnShop',
            title = Lang:t('info.title'),
            options = meltMenu
        })
        lib.showContext('open_meltMenu')
    end)
end)

RegisterNetEvent('qb-pawnshop:client:pawnitems', function(item)
    local sellingItem = lib.inputDialog(Lang:t('info.title'), {
        {
            type = 'number',
            label = 'amount',
            placeholder = Lang:t('info.max', { value = item.amount })
        }
    })
    if sellingItem then
        if not sellingItem[1] or sellingItem[1] <= 0 then return end
        TriggerServerEvent('qb-pawnshop:server:sellPawnItems', item.name, sellingItem[1], item.price)
    else
        QBCore.Functions.Notify(Lang:t('error.negative'), 'error')
    end
end)

RegisterNetEvent('qb-pawnshop:client:meltItems', function(item)
    local meltingItem = lib.inputDialog(Lang:t('info.melt'), {
        {
            type = 'number',
            label = 'amount',
            placeholder = Lang:t('info.max', { value = item.amount })
        }
    })
    if meltingItem then
        if not meltingItem[1] or meltingItem[1] <= 0 then return end
        TriggerServerEvent('qb-pawnshop:server:meltItemRemove', item.name, meltingItem[1], item)
    else
        QBCore.Functions.Notify(Lang:t('error.no_melt'), 'error')
    end
end)

RegisterNetEvent('qb-pawnshop:client:startMelting', function(item, meltingAmount, meltTimees)
    if not isMelting then
        isMelting = true
        meltTime = meltTimees
        meltedItem = {}
        CreateThread(function()
            while isMelting do
                if LocalPlayer.state.isLoggedIn then
                    meltTime = meltTime - 1
                    if meltTime <= 0 then
                        canTake = true
                        isMelting = false
                        table.insert(meltedItem, { item = item, amount = meltingAmount })
                        if Config.SendMeltingEmail then
                            TriggerServerEvent('qb-phone:server:sendNewMail', {
                                sender = Lang:t('info.title'),
                                subject = Lang:t('info.subject'),
                                message = Lang:t('info.message'),
                                button = {}
                            })
                        else
                            QBCore.Functions.Notify(Lang:t('info.message'), 'success')
                        end
                    end
                else
                    break
                end
                Wait(1000)
            end
        end)
    end
end)

RegisterNetEvent('qb-pawnshop:client:resetPickup', function()
    canTake = false
end)
