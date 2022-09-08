local QBCore = exports['qb-core']:GetCoreObject()

function CreateGrandma()
    for k,v in pairs(Shared.location) do
        local poly = Shared.location[k]
        exports['qb-target']:AddBoxZone('ren-grandma:add:BoxZone'..k, poly.coords, poly.length, poly.width, {
                name = 'ren-grandma:add:BoxZone'..k,
                heading = poly.heading,
                debugpoly = true,
                minZ = poly.minZ,
                maxZ = poly.maxZ,
                }, {
                    options = {
                    {
                    event = 'ren-grandma:request:help',
                    icon = 'fas fa-user-injured',
                    label = 'Poproś o pomoc - '..Shared.GrandmaCost..'$',
                },
            },
            distance = 3.0
        })
    end
end

RegisterNetEvent("ren-grandma:request:help", function()
    if QBCore.Functions.GetPlayerData().metadata.isdead or QBCore.Functions.GetPlayerData().metadata.inlaststand then 
        if QBCore.Functions.GetPlayerData().money['cash'] >= Shared.GrandmaCost then 
            QBCore.Functions.Progressbar('name_here', 'Doktor cię leczy..', 5000, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerServerEvent("ren-grandma:revive")
            end, function()
                QBCore.Functions.Notify("Canceled", "error")
            end)
        else
            QBCore.Functions.Notify("Doktor nie pomoże, jeśli nie masz dla niej gotówki", "error", 5000)
        end
    else
        QBCore.Functions.Notify("Wyglądasz dobrze dla doktora", "error")
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    CreateGrandma()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        CreateGrandma()
    end
end)
