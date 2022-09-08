if Config.useNewQBExport then
    QBCore = exports['qb-core']:GetCoreObject()
end

local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local blips = {}
local nearAny = false
local nearAnyStore = false
--
-- Debug
--
if Config.Debug then
    ClearAreaOfObjects(GetEntityCoords(PlayerPedId()), 400.0, 0)
end

function createBlips()
    Citizen.CreateThread(function()
        for k, loc in pairs(Config.lootLocations) do
            if loc.showOnMap then
                local blip = AddBlipForCoord(loc.x, loc.y, loc.z)
                table.insert(blips, blip)
                SetBlipSprite(blip, 366)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.8)
                SetBlipColour(blip, 54)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('[Diving] ' .. loc.name)
                EndTextCommandSetBlipName(blip)
            end
        end

        if Config.useSellLocations then
            for k, sell in pairs(Config.sellLocations) do
                if sell.showOnMap then
                    for m, loc in pairs(sell.locations) do
                        local blip = AddBlipForCoord(loc.x, loc.y, loc.z)
                        table.insert(blips, blip)
                        SetBlipSprite(blip, sell.blipIcon)
                        SetBlipDisplay(blip, 4)
                        SetBlipScale(blip, sell.blipScale)
                        SetBlipColour(blip, sell.blipColor)
                        SetBlipAsShortRange(blip, true)
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString(sell.name)
                        EndTextCommandSetBlipName(blip)
                    end
                end
            end
        end
    end)
end
createBlips()

--
-- Diving Gear
--
local gearApplied = false
local gearQuality
local doingSomething = false
RegisterNetEvent('kuz_diving:applyGear')
AddEventHandler('kuz_diving:applyGear', function(quality)
    gearQuality = quality
    if not doingSomething then
        gearApplied = not gearApplied
        doingSomething = true
        if gearApplied then
            local playerPed = PlayerPedId()
            SetEnableScuba(PlayerPedId(), true)
            if quality == 0 then
                QBCore.Functions.Notify('Zakładasz swój sprzęt do nurkowania')
                SetPedMaxTimeUnderwater(PlayerPedId(), 70.00)
            else
                QBCore.Functions.Notify('Zakładasz sprzęt do nurkowania')
                SetPedMaxTimeUnderwater(PlayerPedId(), 210.00)
            end
            if Config.divingClothing then
                playAnim("mp_safehouseshower@male@", "male_shower_towel_dry_to_get_dressed")
                Citizen.Wait(2400)
                ClearPedTasks(PlayerPedId())
                if quality == 0 then
                    applyDivingClothing()
                else
                    applyScubaClothing()
                end
                doingSomething = false
            end
        else
            takeOffGear()
        end
    end
end)

function takeOffGear()
    QBCore.Functions.Notify('Zdejmujesz swój sprzęt')

    playAnim("mp_safehouseshower@male@", "male_shower_towel_dry_to_get_dressed")
    Citizen.Wait(2000)
    doingSomething = false
    ClearPedTasks(PlayerPedId())

    local playerPed = PlayerPedId()
    gearApplied = false
    TriggerServerEvent('qb-clothes:loadPlayerSkin')
    SetEnableScuba(playerPed, false)
    SetPedMaxTimeUnderwater(playerPed, 12.00)
    SetPedWetnessHeight(playerPed, 0.0)
end

function applyDivingClothing()
    local seed = GetPedHairColor(PlayerPedId())
    math.randomseed(seed)
    local Player = QBCore.Functions.GetPlayerData()
    local gender = Player.charinfo.gender

    if gender == 0 then
        local maleSkin = {
                outfitData = {
                ['t-shirt'] = { item = 15, texture = 0 },
                ['torso2'] = { item = 15, texture = 0 },
                ['ear'] = { item = -1, texture = 0 },
                ['decals'] = { item = 0, texture = 0 },
                ['mask'] = { item = 36, texture = 0 },
                ['arms'] = { item = 15, texture = 0 },
                ['pants'] = { item = 16, texture = math.random(0, 10) },
                ['shoes'] = { item = 34, texture = 0 },
                ['hat'] = { item = 8, texture = 0 },
                ['accessory'] = { item = 0, texture = 0 },
                ['bag'] = { item = 43, texture = 0 },
                ['glass'] = { item = 6, texture = 0 },
                ['vest'] = { item = 0, texture = 0 },
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', maleSkin)
    else
        local femaleSkin = {
            outfitData = {
                ['t-shirt'] = { item = 15, texture = 0 },
                ['ear'] = { item = -1, texture = 0 },
                ['torso2'] = { item = 15, texture = 0 },
                ['decals'] = { item = 0, texture = 0 },
                ['mask'] = { item = 36, texture = 0 },
                ['arms'] = { item = 15, texture = 0 },
                ['pants'] = { item = 15, texture = 0 },
                ['shoes'] = { item = 35, texture = 0 },
                ['hat'] = { item = -1, texture = 0 },
                ['accessory'] = { item = 0, texture = 0 },
                ['bag'] = { item = 43, texture = 0 },
                ['glass'] = { item = 5, texture = 0 },
                ['vest'] = { item = 0, texture = 0 },
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', femaleSkin)
    end
end

function applyScubaClothing()
    local seed = GetPedHairColor(PlayerPedId())
    math.randomseed(seed)
    local Player = QBCore.Functions.GetPlayerData()
    local gender = Player.charinfo.gender

    if gender == 0 then
        local maleSkin = {
                outfitData = {
                ['t-shirt'] = { item = 15, texture = 0 },
                ['torso2'] = { item = 243, texture = math.random(0, 25) },
                ['ear'] = { item = -1, texture = 0 },
                ['decals'] = { item = 0, texture = 0 },
                ['mask'] = { item = 0, texture = 0 },
                ['arms'] = { item = 17, texture = 0 },
                ['pants'] = { item = 94, texture = 0 },
                ['shoes'] = { item = 67, texture = 0 },
                ['hat'] = { item = 8, texture = 0 },
                ['accessory'] = { item = 0, texture = 0 },
                ['bag'] = { item = 43, texture = 0 },
                ['glass'] = { item = 26, texture = 0 },
                ['vest'] = { item = 0, texture = 0 },
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', maleSkin)
    else
        local femaleSkin = {
            outfitData = {
                ['t-shirt'] = { item = 3, texture = 0 },
                ['ear'] = { item = -1, texture = 0 },
                ['torso2'] = { item = 251, texture = math.random(0, 25) },
                ['decals'] = { item = 0, texture = 0 },
                ['mask'] = { item = 0, texture = 0 },
                ['arms'] = { item = 36, texture = 0 },
                ['pants'] = { item = 97, texture = 0 },
                ['shoes'] = { item = 70, texture = 0 },
                ['hat'] = { item = -1, texture = 0 },
                ['accessory'] = { item = 0, texture = 0 },
                ['bag'] = { item = 43, texture = 0 },
                ['glass'] = { item = 28, texture = 0 },
                ['vest'] = { item = 0, texture = 0 },
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', femaleSkin)
    end
end


--
-- Looting
--
local currentSpot
local pickupPoints = {}
local pickupDistances = {}
local pickupCoordsArray = {}
local pickingUp = false

local nearestId
local nearestDistance = 9999.0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _spawnAndPickup()
        _renderStores()
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()

        local playerCoords = GetEntityCoords(playerPed)
        nearAny = false
        for k in pairs(Config.lootLocations) do
            local lootLoc = Config.lootLocations[k]
            if GetDistanceBetweenCoords(playerCoords, lootLoc.x, lootLoc.y, lootLoc.z, true) < 200.0 then
                nearAny = true
            end
        end

        nearAnyStore = false
        if Config.useSellLocations then
            for k, sell in pairs(Config.sellLocations) do
                for m, loc in pairs(sell.locations) do
                    local distance = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, playerCoords)
                    if distance < 150 then
                        nearAnyStore = true
                    end
                end
            end
        end

        if not pickingUp and currentSpot ~= nil and #pickupPoints > 0 then

            nearestDistance = 999.9
            for m, pickup in pairs(pickupPoints) do
                local pickupCoords = GetEntityCoords(pickup)
                local pickupDistance = GetDistanceBetweenCoords(playerCoords, pickupCoords, true)
                pickupCoordsArray[m] = pickupCoords
                pickupDistances[m] = pickupDistance

                if pickupDistance < nearestDistance then
                    nearestDistance = pickupDistance
                    nearestId = m
                end
            end
        end
        Citizen.Wait(250)
    end
end)

function _renderStores()
    if Config.useSellLocations and nearAnyStore then
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k, sell in pairs(Config.sellLocations) do
            for m, loc in pairs(sell.locations) do
                local distance = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, playerCoords)
                if distance < 150 then
                    DrawMarker(1, loc.x, loc.y, loc.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.8, 1.8, 0.7, 220, 160, 20, 90, 0, 1, 0, 0)
                    if distance < 3 then
                        Draw3DText(loc.x, loc.y, loc.z, '~w~kliknij [~o~E~w~] sprzedawać przedmioty do ~o~' .. sell.name, 4, 0.1, 0.075)
                        if IsControlJustReleased(0, Keys['E']) then
                            TriggerServerEvent('kuz_diving:sell', k)
                        end
                    end
                end
            end
        end
    end
end

local creating = false
function _spawnAndPickup()
    if nearAny then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        for k in pairs(Config.lootLocations) do
            local lootLoc = Config.lootLocations[k]
            if GetDistanceBetweenCoords(playerCoords, lootLoc.x, lootLoc.y, lootLoc.z, true) < 200.0 then
                local oldSpot = currentSpot
                currentSpot = k
                if #pickupPoints <= 0 or oldSpot ~= k then
                    if #pickupPoints <= 0 then
                        for m in pairs(pickupPoints) do
                            DeleteObject(pickupPoints[m])
                        end
                        pickupPoints = {}
                    end
                    if not creating then
                        Citizen.CreateThread(function()
                            creating = true
                            Citizen.Wait(1)
                            for i = 1, lootLoc.spotsCount do
                                createLoot(lootLoc, x, y, z)
                            end
                            creating = false
                        end)
                    end
                else
                    if #pickupDistances > 0 then
                        for m, pickup in pairs(pickupPoints) do
                            local pickupDistance = pickupDistances[m]
                            local pickupCoords = pickupCoordsArray[m]
                            if pickupDistance == nil then
                                pickupDistance = 999.9
                            end

                            if pickupDistance < 4.0 and nearestId == m then
                                if not pickingUp then
                                    Draw3DText(pickupCoords.x, pickupCoords.y, pickupCoords.z + 0.2, '~w~kliknij [~b~E~w~] aby zbierać', 4, 0.1, 0.075)
                                else
                                    pickupCoords = GetEntityCoords(pickupPoints[m])
                                    Draw3DText(pickupCoords.x, pickupCoords.y, pickupCoords.z + 0.2, '~w~Zbieranie przedmiodów...', 4, 0.1, 0.075)
                                end
                                if IsControlJustReleased(0, Keys['E']) and not pickingUp then
                                    if lootLoc.requireItem == nil then
                                        startPickup(m)
                                    else
                                        QBCore.Functions.TriggerCallback('kuz_diving:hasItem', function(has)
                                            if has then
                                                startPickup(m)
                                            else
                                                QBCore.Functions.Notify('Potrzebujesz czegoś, żeby to otworzyć')
                                            end
                                        end, lootLoc.requireItem)
                                    end
                                end
                            else
                                if pickingUp and nearestId == m then
                                    pickingUp = false
                                end
                            end
                        end
                    end
                end
            else
                if currentSpot == k then
                    if currentSpot ~= nil then
                        currentSpot = nil
                    end
                    if pickingUp then
                        pickingUp = false
                    end
                end
                if #pickupPoints > 0 and currentSpot == k then
                    for m in pairs(pickupPoints) do
                        DeleteObject(pickupPoints[m])
                    end
                    pickupPoints = {}
                end
            end
        end
    end
end

function startPickup(m)
    Citizen.CreateThread(function()
        if not DoesEntityExist(pickupPoints[m]) then
            return
        end
        local playerPed = PlayerPedId()
        pickingUp = true
        pickingUpId = m
        local lootLoc = Config.lootLocations[currentSpot]
        if lootLoc.animation ~= nil and lootLoc.animationDict ~= nil then
            if lootLoc.animationDict == 'Scenario' then
                TaskStartScenarioInPlace(playerPed, lootLoc.animation, 0, true)
            else
                playAnim(lootLoc.animationDict, lootLoc.animation)
            end
        else
            playAnim("mp_take_money_mg", "put_cash_into_bag_loop")
        end
        FreezeEntityPosition(playerPed, true)
        Citizen.Wait(math.random(4000, 7000))
        pickingUp = false
        nearestId = nil
        nearestDistance = 9999.0
        FreezeEntityPosition(playerPed, false)
        ClearPedTasks(playerPed)
        pickupPickup(m)
    end)
end

function createLoot(lootLoc, x_, y_, z_)
    local x, y, z
    if x_ ~= nil then
        x = x_
        y = y_
        z = z_
    else
        x = math.random(-lootLoc.radius, lootLoc.radius) + lootLoc.x
        y = math.random(-lootLoc.radius, lootLoc.radius) + lootLoc.y
        waste, z = GetGroundZFor_3dCoord(x, y, 999.0, false)
    end

    if z >= -0.5 then
        Citizen.CreateThread(function()
            Citizen.Wait(5000)
            createLoot(lootLoc)
        end)
        return
    end

    local random = math.random(1, #lootLoc.models)
    local hash = GetHashKey(lootLoc.models[random])
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(10)
    end
    object = CreateObject(hash, x, y, z + 0.5, false, false, true)
    ApplyForceToEntityCenterOfMass(object, 0, 1.0, 1.0, 1.0, true, true, false)
    SetObjectPhysicsParams(object, 100.0, 2.0, 2.0, 0.0, 0.0)
    table.insert(pickupPoints, object)
end

function createNewLoot()
    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local lootLoc = Config.lootLocations[currentSpot]
        local x = math.random(-lootLoc.radius, lootLoc.radius) + lootLoc.x
        local y = math.random(-lootLoc.radius, lootLoc.radius) + lootLoc.y
        local waste, z = GetGroundZFor_3dCoord(x, y, 999.0, false)

        if GetDistanceBetweenCoords(playerCoords, x, y, z, true) < lootLoc.radius / 3 then
            createNewLoot()
        else
            createLoot(lootLoc, x, y, z)
        end
    end)
end

function pickupPickup(m)
    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local pickupCoords = GetEntityCoords(pickupPoints[m])
        local pickupDistance = GetDistanceBetweenCoords(playerCoords, pickupCoords, true)
        if pickupDistance < 4.0 then
            DeleteObject(pickupPoints[m])
            table.remove(pickupPoints, m)
            Citizen.Wait(10)
            createNewLoot()
            TriggerServerEvent('kuz_diving:getLoot', playerCoords)
        end
        pickingUp = false
    end)
end


--
-- Helpers
--
function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, true)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function playAnim(dict, anim)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 8.0, 5.0, 17, 0, true, true, false)
    RemoveAnimDict(dict)
end

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local playedPed = PlayerPedId()
        if gearApplied and IsPedSwimmingUnderWater(playedPed) then
            local time = math.floor(GetPlayerUnderwaterTimeRemaining(PlayerId()))
            if time < 30 then
                if time < 0 then
                    time = 0
                end

                sleep = 0
                SetTextFont(0)
                SetTextProportional(1)
                SetTextScale(0.0, 0.4)
                if time > 15 then
                    SetTextColour(220, 160, 5, 140)
                else
                    SetTextColour(220, 0, 5, 140)
                end
                SetTextCentre(true)
                SetTextDropshadow(0, 0, 0, 0, 255)
                SetTextEdge(1, 0, 0, 0, 255)
                SetTextDropShadow()
                SetTextOutline()
                SetTextEntry("STRING")
                AddTextComponentString('Pozostały tlen przez: ' .. time .. ' Sekund')
                DrawText(0.5, 0.007)
            end
        end

        Citizen.Wait(sleep)
    end
end)
