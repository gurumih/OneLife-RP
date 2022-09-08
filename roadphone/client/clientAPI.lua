-- ====================================================================================
--                              RoadToSix & Lea & Dachlatti :)
-- ====================================================================================
local isInFocus = false
local isInFlashlight = false


if Config.RegisterKeyMapping then
    RegisterKeyMapping('TooglePhone', Lang:t('info.registerkeymapping'), 'keyboard',
                       Config.OpenPhoneKey)

    RegisterCommand("TooglePhone", function() TooglePhone() end)
else
    CreateThread(function()
        while true do
            if IsControlJustReleased(0, 288) then TooglePhone() end
            Wait(0)
        end
    end)
end


function GenerateCallID()
    local numBase = math.random(1000000, 9999999)
    num = string.format("%07d", numBase)
    return num
end

RegisterNUICallback("sendNotification", function(data)

    TriggerEvent("roadphone:sendNotification", data)

end)

RegisterNetEvent("roadphone:sendNotification")
AddEventHandler("roadphone:sendNotification", function(data)

    QBCore.Functions.TriggerCallback('roadphone:getPhoneAmount', function(amount)
        if amount then

            SendNUIMessage({
                action = "show_notification",
                title = data.title,
                sender = data.sender,
                message = data.message,
                img = data.img
            })
        end
    end)

end)

function startRadioAnimation()

    if Config.RadioAnimation and Config.UseMumbleVoip or Config.UsePmaVoice and
        not getRadioAnimation() then
        local ped = PlayerPedId()
        setRadioAnimation(true)
        RequestAnimDict("random@arrests")
        while not HasAnimDictLoaded("random@arrests") do Wait(150) end

        CreateThread(function()

            while getRadioAnimation() do
                Wait(0)
                if getHandyActive() == false then
                    if not IsPedFalling(ped) then
                        if not IsEntityDead(ped) then
                            if IsControlPressed(0, Config.RadioAnimationKey) then
                                TaskPlayAnim(ped, "random@arrests",
                                             "generic_radio_chatter", 4.0, -1,
                                             -1, 50, 0, false, false, false)
                                Wait(1000)

                                StopAnimTask(ped, "random@arrests",
                                             "generic_radio_chatter", 1.0)
                            end
                        end
                    end
                end
            end
        end)
    end
end

CreateThread(function()
    while true do
        if getHandyActive() then
            if not isInFocus then
                if not isInFlashlight then
                    DisableControlAction(0, 1, true)
                    DisableControlAction(0, 2, true)
                    SetNuiFocusKeepInput(true)
                end
                DisableControlAction(0, 304, true)
                DisableControlAction(0, 101, true)
                DisableControlAction(0, 74, true)
                DisableControlAction(0, 303, true)
                DisableControlAction(0, 311, true)
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 25, true)
                DisableControlAction(0, 29, true)
                DisableControlAction(0, 322, true)
                DisableControlAction(0, 200, true)
                DisableControlAction(0, 202, true)
                DisableControlAction(0, 177, true)
                DisableControlAction(0, 37, true)
                DisableControlAction(0, 245, true)
                DisableControlAction(0, 263, true)
                DisableControlAction(0, 45, true)
                DisableControlAction(0, 80, true)
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 0, true)
                DisableControlAction(0, 36, true)
                DisableControlAction(0, 326, true)
                DisableControlAction(0, 341, true)
                DisableControlAction(0, 343, true)
                DisableControlAction(0, 257, true)
                DisableControlAction(0, 22, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 288, true)
                DisableControlAction(0, 289, true)
                DisableControlAction(0, 170, true)
                DisableControlAction(0, 167, true)
                DisableControlAction(0, 26, true)
                DisableControlAction(0, 73, true)
                DisableControlAction(2, 199, true)
                DisableControlAction(0, 47, true)
                DisableControlAction(0, 264, true)
                DisableControlAction(0, 257, true)
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 81, true)
                DisableControlAction(0, 82, true)
                DisableControlAction(0, 99, true)
                DisableControlAction(0, 100, true)
                DisableControlAction(0, 141, true)
                DisableControlAction(0, 142, true)
                DisableControlAction(0, 143, true)
                DisableControlAction(0, 106, true)
                DisableControlAction(0, 115, true)
                DisableControlAction(0, 245, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 157, true)
                DisableControlAction(0, 158, true)
                DisableControlAction(0, 160, true)
                DisableControlAction(0, 164, true)
                DisableControlAction(0, 165, true)
                DisableControlAction(0, 159, true)
                DisableControlAction(0, 161, true)
                DisableControlAction(0, 162, true)
                DisableControlAction(0, 163, true)
                DisableControlAction(0, 182, true)
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                end
                SetNuiFocusKeepInput(true)
            else
                SetNuiFocusKeepInput(false)
            end
        else
            SetPlayerCanDoDriveBy(PlayerId(), true)
            Wait(200)
        end
        Wait(0)
    end
end)

CreateThread(function()
    if Config.RemoveFromRadioWhenDead then
        while true do
            Wait(2000)
            if IsEntityDead(PlayerPedId()) and getRadioActive() then
                TriggerEvent("roadphone:leaveradio")
            end
        end
    end
end)
RegisterNUICallback('notification',
                    function(data) sendNotification(data.text) end)

RegisterNetEvent('roadphone:sendOffNotification')
AddEventHandler('roadphone:sendOffNotification',
                function(text) sendNotification(text) end)

RegisterNUICallback('inputfocus', function(data) -- Nichts hier dran ändern!

    if isInFocus ~= data.focus then
        isInFocus = data.focus
    end
end)

RegisterNUICallback('flashlightfocus', function(data) -- Nichts hier dran ändern!

    if isInFlashlight ~= data.focus then
        isInFlashlight = data.focus
    end

end)
function sendNotification(text)

    -- Ersetze QBCore.Functions.Notify durch deine eigene Funktion/Methode wenn du möchtest das deine eigenen Notifications kommen.

    -- TriggerEvent("notifications", "#FF1D25", "Handy", text)

    QBCore.Functions.Notify(text)

end
-----------------------------------------------------------------------------------------
--------------------------------NEW LOAD FUNCTION----------------------------------------
-----------------------------------------------------------------------------------------
CreateThread(function ()
    while true do 
        Wait(2000)
        if NetworkIsPlayerActive(PlayerId()) then 
            TriggerServerEvent('roadphone:playerLoad', GetPlayerServerId(PlayerId()))
            break
        end
    end
end)

RegisterNUICallback("loadPlayer", function()
    TriggerServerEvent('roadphone:playerLoad', GetPlayerServerId(PlayerId()))
end)
-----------------------------------------------------------------------------------------
--------------------------------END LOAD FUNCTION----------------------------------------
-----------------------------------------------------------------------------------------

function getJobSocietyMoney(society)

    local accountmoney = exports['qb-management']:GetAccount(society)

    SendNUIMessage({action = "updateJobsSettingsBalance", balance = accountmoney})
end

RegisterNetEvent('roadphone:use')
AddEventHandler('roadphone:use', function() TooglePhone() end)

RegisterCommand("Phone", function() TooglePhone() end)
