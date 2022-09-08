Config = {}
Config.Zones = {}

Config.Command = "music" 
Config.VolumeDistance = 50.0
Config.EveryoneHears = true 

--QBCORE TRIGGER CLIENT.LUA
Config.qbCoreClient = 'QBCore:GetObject'

--QBCORE EXPORT SERVER.LUA
function QbExport()
    exports['qb-core']:GetCoreObject()
end