if Config.useNewQBExport then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('kq_hideouts:requestSync')
end)
