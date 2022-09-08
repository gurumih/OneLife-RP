if Config.esxSettings.enabled then
    ESX = nil

    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj)
                ESX = obj
            end)
            Citizen.Wait(0)
        end

        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        ESX.PlayerData = ESX.GetPlayerData()
        TriggerServerEvent('kq_carheist:playerLoaded')
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        ESX.PlayerData.job = job
        ClearPoliceBlips()
    end)

    function IsPolice()
        if not ESX.PlayerData.job then
            return false
        end
        return Contains(Config.policeJobNames, ESX.PlayerData.job.name)
    end
end
