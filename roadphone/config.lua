Config = {}

Config.NewQBVersion = true

if Config.NewQBVersion then
     QBCore = exports['qb-core']:GetCoreObject()
else
     TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
end



Config.QBCoreName = "QBCore"

Config.Items = {
     "phone"
}

Config.RegisterKeyMapping = true --If you set RegisterKeyMapping to false you can only close the phone with ESC.
Config.OpenPhoneKey = 'M' --Works only with RegisterKeyMapping true / https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

Config.NeedItem = true --Need Item to open the phone
Config.ShowOffNotifications = false --Notifications outside the phone

Config.MumbleExport = "mumble-voip" --exports["mumble-voip"]
Config.PMAVoiceExport = "pma-voice" --exports["pma-voice"]

Config.UseMumbleVoip = false --We recommend: https://github.com/FrazzIe/mumble-voip-fivem
Config.UseTokoVoip = false
Config.UseSaltyChat = false --Works perfect with SaltyChat 2.6
Config.UsePmaVoice = true

--Funk App

Config.RadioAnimation = true -- Only works with Mumble-Voip & PMA-Voice!
Config.RadioAnimationKey = 19
Config.RemoveFromRadioWhenDead = true
Config.RadioNeedItem = true

Config.RadioItems = {
     "radio"
}

Config.MaxMusicRange = 1.0 --Adjust music volume RANGE: 0.1 - 1.0

Config.RadioItemName = "radio"

Config.lockedRadioChannels = { --Radio lock
     { frq = 1, jobhasaccess = "police"},
     { frq = 2, jobhasaccess = "ambulance"},
     { frq = 3, jobhasaccess = "mechanic"}
}

Config.YellowAppName = false

--Don't change anything if you don't know what are you doing.
--These tables only change code that is not accessible to you, which means you also have to make changes in ServerAPI.lua.

Config.UserTable = "players" 
