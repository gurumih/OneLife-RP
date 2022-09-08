if Config.qbSettings.enabled then
    if Config.qbSettings.useNewQBExport then
        QBCore = exports['qb-core']:GetCoreObject()
    end

    job = QBCore.Functions.GetPlayerData().job

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        job = QBCore.Functions.GetPlayerData().job
        TriggerServerEvent('kq_carheist:playerLoaded')
    end)


    RegisterNetEvent('QBCore:Client:OnJobUpdate')
    AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
        job = JobInfo
    end)

    function IsPolice()
        if not job then
            return false
        end
        return Contains(Config.policeJobNames, job.name)
    end
end
