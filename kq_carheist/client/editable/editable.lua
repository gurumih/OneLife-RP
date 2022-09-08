function AfterTruckCreated(vehicle)

end

function AfterTrailerCreated(vehicle)

end

function AfterTrailerVehicleCreated(vehicle)

end

function AfterDriverCreated(ped)

end

function AfterPassengerCreated(ped)

end

function AfterSupportVehicleCreated(vehicle)

end

function AfterSupportPedCreated(ped)

end

function OnStartOpeningTrailer()

end

function OnTrailerOpened()

end

function OnVehicleDetach(vehicle)

end


RegisterNetEvent('kq_carheist:dropOffCompleted')
AddEventHandler('kq_carheist:dropOffCompleted', function(reward, losses, vehName)
    if losses > 0 then
        Alert(L('{vehicle} dropped off'):gsub('{vehicle}', vehName), (L('You made ~g~${reward}\n~r~${losses} deducted due to vehicle damage')):gsub('{reward}', reward):gsub('{losses}', losses), 5000)
    else
        Alert(L('{vehicle} dropped off'):gsub('{vehicle}', vehName), (L('You made ~g~${reward}')):gsub('{reward}', reward), 5000)
    end
    PlaySoundFrontend(-1, 'PROPERTY_PURCHASE', 'HUD_AWARDS', false)
end)


function SendAnnouncementMessage(message, subtitle, coords)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)

    -- Set the notification icon, title and subtitle.
    local title = L('Martin')
    local iconType = 0
    local flash = false -- Flash doesn't seem to work no matter what.
    EndTextCommandThefeedPostMessagetext("CHAR_MARTIN", "CHAR_MARTIN", flash, iconType, title, subtitle)

    -- Draw the notification
    local showInBrief = true
    local blink = false -- blink doesn't work when using icon notifications.
    EndTextCommandThefeedPostTicker(blink, showInBrief)

    local blipConf = Config.announcementBlip.primary
    CreateTemporaryBlip(coords, blipConf.sprite, blipConf.color, blipConf.alpha, blipConf.scale, L('Car transport'), blipConf.shortRange, true)

    blipConf = Config.announcementBlip.secondary
    CreateTemporaryBlip(coords, blipConf.sprite, blipConf.color, blipConf.alpha, blipConf.scale, L('Car transport'), blipConf.shortRange)
end

-- This function is responsible for creating the text shown on the bottom of the screen
function DrawMissionText(text, time)
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time or 30000, 1)
end

-- This function is responsible for all the tooltips displayed on top right of the screen, you could
-- replace it with a custom notification etc.
function ShowTooltip(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    EndTextCommandDisplayHelp(0, 0, 0, -1)
end

-- This function is responsible for drawing all the 3d texts ('Press [E] to prepare for an engine swap' e.g)
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
