----------------------
-- BLIPS
----------------------
local policeBlips = {}

RegisterNetEvent('kq_carheist:refreshPoliceAlarm')
AddEventHandler('kq_carheist:refreshPoliceAlarm', function(trailerCoords, vehiclesCoords)
    ClearPoliceBlips()

    if trailerCoords then
        RefreshPoliceTrailerAlarm(trailerCoords)
    end
    RefreshPoliceVehiclesAlarm(vehiclesCoords, trailerCoords)
end)

function RefreshPoliceTrailerAlarm(trailerCoords)
    if trailerBlip ~= nil then
        RemoveBlip(trailerBlip)
    end

    local blipConf = Config.policeBlip.truck.primary
    local primBlip = CreatePoliceBlip(trailerCoords, blipConf.sprite, blipConf.color, blipConf.alpha, blipConf.scale, L('Car transport robbery'), blipConf.shortRange)
    SetBlipDisplay(primBlip, 8)
    table.insert(policeBlips, primBlip)

    blipConf = Config.policeBlip.truck.secondary
    local secBlip = CreatePoliceBlip(trailerCoords, blipConf.sprite, blipConf.color, blipConf.alpha, blipConf.scale, L('Car transport robbery'), blipConf.shortRange)
    table.insert(policeBlips, secBlip)

end


function RefreshPoliceVehiclesAlarm(vehiclesCoords, trailerCoords)
    for k, veh in pairs(vehiclesCoords) do
        if not trailerCoords or GetDistanceBetweenCoords(trailerCoords, veh.coords, false) > 25.0 then

            local blipConf = Config.policeBlip.vehicles.primary


            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), veh.coords, true)

            local _, z = GetGroundZFor_3dCoord(veh.coords.x, veh.coords.y, 900.0, true)
            if z == 0.0 then
                z = GetHeightmapTopZForPosition(veh.coords.x, veh.coords.y)
            end

            z = z - 6.0

            if Config.policeBlip.makeTunnelsLowerSignal and distance > 10.0 and (IsInsideATunnel(veh.coords) or (Config.policeBlip.unknownTunnelChecking and z > veh.coords.z)) then
                math.randomseed(math.floor((veh.coords.x / 10) + (veh.coords.y / 10)))
                local newCoords = vector3(veh.coords.x + math.random(-130, 130), veh.coords.y + math.random(-130, 130), veh.coords.z)
                veh.coords = newCoords
                math.randomseed(GetGameTimer())

                local tunnelBlip = CreateTunnelPoliceBlip(veh.coords, blipConf.color, blipConf.alpha)
                table.insert(policeBlips, tunnelBlip)
            else
                local primBlip = CreatePoliceBlip(veh.coords, blipConf.sprite, blipConf.color, blipConf.alpha, blipConf.scale, L('Stolen vehicle: ') .. veh.name, blipConf.shortRange)
                SetBlipDisplay(primBlip, 8)
                table.insert(policeBlips, primBlip)
            end

            blipConf = Config.policeBlip.vehicles.secondary
            local secBlip = CreatePoliceBlip(veh.coords, blipConf.sprite, blipConf.color, blipConf.alpha, blipConf.scale, L('Stolen vehicle: ') .. veh.name, blipConf.shortRange)
            table.insert(policeBlips, secBlip)
        end
    end
end

function ClearPoliceBlips()
    for k, blip in pairs(policeBlips) do
        RemoveBlip(blip)
    end
    policeBlips = {}
end

function RemovePoliceTrailerBlip()
    if trailerBlip then
        RemoveBlip(trailerBlip)
    end
end

function CreatePoliceBlip(coords, sprite, color, alpha, scale, message, shortRange)
    local blip = AddBlipForCoord(coords)

    SetBlipSprite(blip, sprite)
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, color)
    SetBlipAlpha(blip, alpha)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(message)
    EndTextCommandSetBlipName(blip)
    SetBlipAsShortRange(blip, shortRange)
    return blip
end


function CreateTunnelPoliceBlip(coords, color, alpha)
    local blip = AddBlipForRadius(coords, 300.0)

    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, color)
    SetBlipAlpha(blip, alpha)
    SetBlipAsShortRange(blip, true)
    return blip
end


----------------------
-- DISPATCH MESSAGES
----------------------

function EndPoliceAlarm()
    if trailerBlip ~= nil then
        RemovePoliceTrailerBlip()
        SendDispatchMessage(L('Our truck has arrived to its destination. Thank you for your assistance'), L('Truck arrived'))
    end
end

function SendDispatchMessage(message, subtitle)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)

    -- Set the notification icon, title and subtitle.
    local title = L('Car Transports Inc.')
    local iconType = 0
    local flash = false -- Flash doesn't seem to work no matter what.
    EndTextCommandThefeedPostMessagetext("CHAR_CARSITE", "CHAR_CARSITE", flash, iconType, title, subtitle)

    -- Draw the notification
    local showInBrief = true
    local blink = false -- blink doesn't work when using icon notifications.
    EndTextCommandThefeedPostTicker(blink, showInBrief)
end
