local QBCore = exports['qb-core']:GetCoreObject()
 
local spawnedShrooms = 0
local ShroomSpawns = {}
local isPickingUpShroom = false
local NeededAttempts = 0
local SucceededAttempts = 0
local FailedAttemps = 0

---------------------------
--SHROOMS FIELD FUNCTIONS--
---------------------------

CreateThread(function()
	while true do
		Wait(10)
		local coords = GetEntityCoords(PlayerPedId())
		if GetDistanceBetweenCoords(coords, Config.ShroomField, true) < 50 then
			SpawnShroomSpawns()
			Wait(500)
		else
			Wait(500)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(ShroomSpawns) do
			DeleteObject(v)
		end
	end
end)

function SpawnObject(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(1)
	end
    local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    if cb then
        cb(obj)
    end
end

function SpawnShroomSpawns()
	while spawnedShrooms < 15 do
		Wait(1)
		local placementCoords = GenerateShroomCoords()
		SpawnObject('prop_stoneshroom1', placementCoords, function(obj)
			table.insert(ShroomSpawns, obj)
			spawnedShrooms = spawnedShrooms + 1
		end)
	end
end 

function ValidateShroomCoord(mushroomCoord)
	if spawnedShrooms > 0 then
		local validate = true
		for k, v in pairs(ShroomSpawns) do
			if GetDistanceBetweenCoords(mushroomCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end
		if GetDistanceBetweenCoords(mushroomCoord, Config.ShroomField, false) > 50 then
			validate = false
		end
		return validate
	else
		return true
	end
end

function GenerateShroomCoords()
	while true do
		Wait(1)
		local shroomyCoordX, shroomyCoordY
		math.randomseed(GetGameTimer())
		local modX = math.random(-22, 22)
		Wait(100)
		math.randomseed(GetGameTimer())
		local modY = math.random(-22, 22)
		shroomyCoordX = Config.ShroomField.x + modX
		shroomyCoordY = Config.ShroomField.y + modY
		local coordZ = GetCoordZShrooms(shroomyCoordX, shroomyCoordY)
		local coord = vector3(shroomyCoordX, shroomyCoordY, coordZ)
		if ValidateShroomCoord(coord) then
			return coord
		end
	end
end

function GetCoordZShrooms(x, y)
	local groundCheckHeights = { 15, 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0 }
	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	return 18.66
end

------------------
---PICK SHROOMS---
------------------

exports['qb-target']:AddTargetModel(`prop_stoneshroom1`, {
	options = {
		{
			event = "mz-shrooms:client:harvestMushroom",
			icon = "fas fa-seedling",
			label = "Zbierz grzybka",
		},
	},
	distance = 2.0
}) 

RegisterNetEvent('mz-shrooms:client:harvestMushroom', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID
	for i=1, #ShroomSpawns, 1 do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(ShroomSpawns[i]), false) < 1.2 then
			nearbyObject, nearbyID = ShroomSpawns[i], i
		end
	end
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
		if result then
			if nearbyObject and IsPedOnFoot(playerPed) then
				isPickingUpShroom = true
				PrepareAnimShroom()
                PickShroomMiniGame()
				ClearPedTasks(playerPed)
				Wait(4000)
				DeleteObject(nearbyObject) 
				table.remove(ShroomSpawns, nearbyID)
				spawnedShrooms = spawnedShrooms - 1
			else
				if Config.NotifyType == 'qb' then
					QBCore.Functions.Notify('Tego grzyba nie da się zerwać?', "error", 3500)
				elseif Config.NotifyType == "okok" then
					exports['okokNotify']:Alert("CAN'T PICK", "Tego grzyba nie da się zerwać?", 3500, "error")
				end 
			end
		else
			local requiredItems = {
				[1] = {name = QBCore.Shared.Items["gardengloves"]["name"], image = QBCore.Shared.Items["gardengloves"]["image"]},
			}  
			if Config.NotifyType == 'qb' then
				QBCore.Functions.Notify('Te grzyby wyglądają na trujące, lepiej używaj rękawiczek.', "error", 3500)
			elseif Config.NotifyType == "okok" then
				exports['okokNotify']:Alert("NEED GLOVES", "Te grzyby wyglądają na trujące, lepiej używaj rękawiczek.", 3500, "error")
			end   
			TriggerEvent('inventory:client:requiredItems', requiredItems, true)
			Wait(3000)
			TriggerEvent('inventory:client:requiredItems', requiredItems, false)
		end
	end, {"gardengloves"})
end)

function PrepareAnimShroom()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
    PreparingAnimCheckShroom()
end

function PreparingAnimCheckShroom()
    shroompicking = true
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()
            if shroompicking then
				Wait(1)
            else
                ClearPedTasksImmediately(ped)
                break
            end
            Citizen.Wait(200)
        end
    end)
end

function PickShroomMiniGame()
	local success = exports['qb-lock']:StartLockPickCircle(Config.ShroomskillCheck, Config.ShroomskillTime) --StartLockPickCircle(1,10) 1= how many times, 30 = time in seconds
	if success then
		TriggerServerEvent('mz-shrooms:server:addShroom')
		Wait(500)
		TriggerServerEvent('mz-shrooms:server:removeGlovesSuccess')
	else
        TriggerServerEvent('mz-shrooms:server:removeGlovesFail')
	end
end

----------------
--MAKES GLOVES--
----------------

CreateThread(function()
    exports['qb-target']:AddBoxZone("makegardengloves", vector3(716.25, -963.26, 30.4), 1.8, 1, {
        name = "makegardengloves",
        heading = 90,
        debugPoly = false,
        minZ = 27.0,
        maxZ = 31.0,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-shrooms:client:MakeGloves",
                icon = 'fas fa-sun',
                label = 'Stitch gloves'
            },
        },
        distance = 1.5,
     })
end)

RegisterNetEvent('mz-shrooms:client:MakeGloves')
AddEventHandler('mz-shrooms:client:MakeGloves', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then
            TriggerServerEvent("mz-shrooms:server:MakeGloves")
        else
            local requiredItems = {
                [1] = {name = QBCore.Shared.Items["fabric"]["name"], image = QBCore.Shared.Items["fabric"]["image"]}, 
            }  
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Do wykonania rękawic potrzebujesz trochę tkaniny.', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("NEED FABRIC", "Do wykonania rękawic potrzebujesz trochę tkaniny.", 3500, "error")
            end   
            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
            Wait(3000)
            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    end, {"fabric"})
end)

RegisterNetEvent('mz-shrooms:client:MakeGlovesMinigame')
AddEventHandler('mz-shrooms:client:MakeGlovesMinigame', function(source)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    MakeGlovesMinigame(source)
end)

function MakeGlovesMinigame(source)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = Config.MakeGlovesSkillCheck
    end
    local maxwidth = 30
    local maxduration = 3000
    Skillbar.Start({
        duration = math.random(1600, 2100),
        pos = math.random(15, 30),
        width = math.random(11, 15),
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            MakeGlovesProcess()
            Wait(500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Zszywasz rękawiczki.', "success", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("STITCHING GLOVES", "Zszywasz rękawiczki.", 3500, "success")
            end   
            Wait(500)
        else    
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(1600, 2100),
                pos = math.random(10, 30),
                width = math.random(11, 12),
            })
        end
    end, function()
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Ślizgasz się i rozdzierasz rękawiczki. Ta tkanina jest zniszczona...', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("FABRIC RUINED", "Ślizgasz się i rozdzierasz rękawiczki. Ta tkanina jest zniszczona...", 3500, "error")
        end
        Wait(500) 
        FailedAttemps = 0
        SucceededAttempts = 0
        NeededAttempts = 0
        craftprocesscheck = false
        ClearPedTasks(PlayerPedId())
    end)
end

function MakeGlovesProcess()
    QBCore.Functions.Progressbar("grind_coke", "Zszycie tkaniny razem...", (Config.MakeGlovesProgressbar * 1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("mz-shrooms:server:GetGloves")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        craftcheck = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Proces anulowany', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("TASK STOPPED", "Proces anulowany", 3500, "error")
        end 
    end)
end


-----------------------
--MAKE SHROOM BAGGIES--
-----------------------

CreateThread(function()
    exports['qb-target']:AddBoxZone("makeshroombags", vector3(712.24, -970.79, 30.4), 1.6, 0.7, {
        name = "makeshroombags",
        heading = 0,
        debugPoly = false,
        minZ = 27.0,
        maxZ = 31.0,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-shrooms:client:MakeShroomBags",
                icon = 'fas fa-sun',
                label = 'Stwórz samare'
            },
        },
        distance = 1.5,
     })
end)

RegisterNetEvent('mz-shrooms:client:MakeShroomBags')
AddEventHandler('mz-shrooms:client:MakeShroomBags', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then
            TriggerServerEvent("mz-shrooms:server:MakeShroomBags")
        else
            local requiredItems = {
                [1] = {name = QBCore.Shared.Items["plastic"]["name"], image = QBCore.Shared.Items["plastic"]["image"]},
           }  
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Do wyprasowania worka potrzebujesz 2 plastików', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("NEED PLASTIC", "Do wyprasowania worka potrzebujesz 2 plastików", 3500, "error")
            end   
            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
            Wait(3000)
            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    end, {"plastic"})
end)

RegisterNetEvent('mz-shrooms:client:MakeShroomBagsMinigame')
AddEventHandler('mz-shrooms:client:MakeShroomBagsMinigame', function(source)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    MakeShroomBagsMinigame(source)
end)

function MakeShroomBagsMinigame(source)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = Config.MakeShroomBagsSkillcheck
    end
    local maxwidth = 30
    local maxduration = 3000
    Skillbar.Start({
        duration = math.random(1400, 1500),
        pos = math.random(15, 30),
        width = math.random(11, 15),
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            MakeShroomBagsProcess()
            Wait(500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Przycinasz plastik na wymiar i uszczelniasz.', "success", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("MAKING BAG", "Przycinasz plastik na wymiar i uszczelniasz.", 3500, "success")
            end   
            Wait(500)
            local skillup = 0
            local multiplier = math.random(1, 5)
            if multiplier > 4 then
                skillup = 1
            else
                skillup = 0
            end
            exports["mz-skills"]:UpdateSkill("Drug Manufacture", skillup)
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else    
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(1200, 1500),
                pos = math.random(10, 30),
                width = math.random(11, 12),
            })
        end
    end, function()
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Jebłeś się i plastik jest zniszczony.', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("PLASTIC RUINED", "Jebłeś się i plastik jest zniszczony.", 3500, "error")
        end
        Wait(500)
        FailedAttemps = 0
        SucceededAttempts = 0
        NeededAttempts = 0
        craftprocesscheck = false
        ClearPedTasks(PlayerPedId())
    end)
end

function MakeShroomBagsProcess()
    QBCore.Functions.Progressbar("grind_coke", "Torebka uszczelniająca...", (Config.MakeBagTime * 1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("mz-shrooms:server:GetShroomBaggy")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        craftcheck = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Proces anulowany', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("TASK STOPPED", "Proces anulowany", 3500, "error")
        end 
    end)
end

---------------
--BAG SHROOMS--
---------------

CreateThread(function()
    exports['qb-target']:AddBoxZone("GetShroomBag", vector3(710.69, -969.48, 30.4), 2.2, 1, {
        name = "GetShroomBag",
        heading = 0,
        debugPoly = false,
        minZ = 27.0,
        maxZ = 31.0,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-shrooms:client:BagShrooms",
                icon = 'fas fa-pills',
                label = 'wypełnij torbe grzybem spod napleta'
            },
        },
        distance = 1.5,
     })
end)

RegisterNetEvent('mz-shrooms:client:BagShrooms')
AddEventHandler('mz-shrooms:client:BagShrooms', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then
            TriggerServerEvent("mz-shrooms:server:BagShrooms")
        else
            local requiredItems = {
                [1] = {name = QBCore.Shared.Items["shroom"]["name"], image = QBCore.Shared.Items["shroom"]["image"]},
                [2] = {name = QBCore.Shared.Items["shroombaggy"]["name"], image = QBCore.Shared.Items["shroombaggy"]["image"]},
            }  
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Potrzebujesz pięciu (5) grzybów i torebek ESSA', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("BAG IT UP", "Potrzebujesz pięciu (5) grzybów i torebek ESSA", 3500, "error")
            end   
            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
            Wait(3000)
            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    end, {"shroom", "shroombaggy"})
end)

RegisterNetEvent('mz-shrooms:client:BagShroomsMinigame')
AddEventHandler('mz-shrooms:client:BagShroomsMinigame', function(source)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    BagShroomsMinigame(source)
end)

function BagShroomsMinigame(source)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = Config.BagShroomsSkillcheck
    end
    local maxwidth = 30
    local maxduration = 3000
    Skillbar.Start({
        duration = math.random(1400, 1500),
        pos = math.random(15, 30),
        width = math.random(11, 15),
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            BagShroomsProcess()
            Wait(500)
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Odważasz właściwy produkt i pakujesz go.', "success", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("BAGGING SHROOMS", "Odważasz właściwy produkt i pakujesz go.", 3500, "success")
            end   
            Wait(500)
            local skillup = 0
            local multiplier = math.random(1, 4)
            if multiplier > 3 then
                skillup = 2
            else
                skillup = 1
            end
            exports["mz-skills"]:UpdateSkill("Drug Manufacture", skillup)
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else    
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(1200, 1500),
                pos = math.random(10, 30),
                width = math.random(11, 12),
            })
        end
    end, function()
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Rozdzierasz worek i upuszczasz grzyby...', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("PRODUCT RUINED!", "Rozdzierasz worek i upuszczasz grzyby...", 3500, "error")
        end
        Wait(500)
        local deteriorate = -2
        exports["mz-skills"]:UpdateSkill("Drug Manufacture", deteriorate)
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('-2 XP to Drug Manufacture', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("SKILLS", "-2 XP to Drug Manufacture", 3500, "error")
        end   
        FailedAttemps = 0
        SucceededAttempts = 0
        NeededAttempts = 0
        craftprocesscheck = false
        ClearPedTasks(PlayerPedId())
    end)
end

function BagShroomsProcess()
    QBCore.Functions.Progressbar("grind_coke", "Pakowanie produktu..", (Config.BagShroomsTime * 1000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local lvl8 = false
        local lvl7 = false
        local lvl6 = false
        local lvl5 = false
        local lvl4 = false
        local lvl3 = false
        local lvl2 = false
        local lvl1 = false
        exports["mz-skills"]:CheckSkill("Drug Manufacture", 12800, function(hasskill)
            if hasskill then
                lvl8 = true
            end
        end)
        exports["mz-skills"]:CheckSkill("Drug Manufacture", 6400, function(hasskill)
            if hasskill then
                lvl7 = true
            end
        end)
        exports["mz-skills"]:CheckSkill("Drug Manufacture", 3200, function(hasskill)
            if hasskill then
                lvl6 = true
            end
        end)
        exports["mz-skills"]:CheckSkill("Drug Manufacture", 1600, function(hasskill)
            if hasskill then
                lvl5 = true
            end
        end)
        exports["mz-skills"]:CheckSkill("Drug Manufacture", 800, function(hasskill)
            if hasskill then
                lvl4 = true
            end
        end)
        exports["mz-skills"]:CheckSkill("Drug Manufacture", 400, function(hasskill)
            if hasskill then
                lvl3 = true
            end
        end)
        exports["mz-skills"]:CheckSkill("Drug Manufacture", 200, function(hasskill)
            if hasskill then
                lvl2 = true
            end
        end)
        exports["mz-skills"]:CheckSkill("Drug Manufacture", 100, function(hasskill)
            if hasskill then
                lvl1 = true
            end
        end)
        if lvl8 == true then
            TriggerServerEvent('mz-shrooms:server:receiveShroomslevel8')
        elseif lvl7 == true then 
            TriggerServerEvent('mz-shrooms:server:receiveShroomslevel7')
        elseif lvl6 == true then 
            TriggerServerEvent('mz-shrooms:server:receiveShroomslevel6')
        elseif lvl5 == true then 
            TriggerServerEvent('mz-shrooms:server:receiveShroomslevel5')
        elseif lvl4 == true then 
            TriggerServerEvent('mz-shrooms:server:receiveShroomslevel4')
        elseif lvl3 == true then 
            TriggerServerEvent('mz-shrooms:server:receiveShroomslevel3')
        elseif lvl2 == true then 
            TriggerServerEvent('mz-shrooms:server:receiveShroomslevel2')
        elseif lvl1 == true then 
            TriggerServerEvent('mz-shrooms:server:receiveShroomslevel1')
        else
            TriggerServerEvent('mz-shrooms:server:receiveShrooms')
        end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        craftcheck = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Proces anulowany', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("TASK STOPPED", "Proces anulowany", 3500, "error")
        end 
    end)
end

-------------------
--DRUG PROPERTIES--
-------------------

RegisterNetEvent('mz-shrooms:client:Shrooms', function()
    QBCore.Functions.Progressbar("use_ecstasy", "Wpierdalasz grzyby...", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "shroombag", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["shroombag"], "remove")
        ShroomEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Failed", "error")
    end)
end)

function ShroomEffect()
    local startStamina = 15
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
		local drugeffect = math.random(1, 100)
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if drugeffect < 61 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.18)
		elseif drugeffect > 60 and drugeffect < 81 then 
			AlienEffect()
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end
end

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end