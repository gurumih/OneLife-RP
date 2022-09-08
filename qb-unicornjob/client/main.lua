local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = false
PlayerJob = {}

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    Unicorn = AddBlipForCoord(131.58, -1303.13, 29.23)
    SetBlipSprite (Unicorn, 121)
    SetBlipDisplay(Unicorn, 4)
    SetBlipScale  (Unicorn, 0.7)
    SetBlipAsShortRange(Unicorn, true)
    SetBlipColour(Unicorn, 8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Unicorn")
    EndTextCommandSetBlipName(Unicorn)
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "vunicorn" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)

RegisterNetEvent("qb-unicornjob:DutyB")
AddEventHandler("qb-unicornjob:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-unicornjob:Table1")
AddEventHandler("qb-unicornjob:Table1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table2")
AddEventHandler("qb-unicornjob:Table2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable2", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table4")
AddEventHandler("qb-unicornjob:Table4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table3")
AddEventHandler("qb-unicornjob:Table3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table5")
AddEventHandler("qb-unicornjob:Table5", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable5")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable5", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table6")
AddEventHandler("qb-unicornjob:Table6", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable6")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable6", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table7")
AddEventHandler("qb-unicornjob:Table7", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable7")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable7", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table8")
AddEventHandler("qb-unicornjob:Table8", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable8")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable8", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table9")
AddEventHandler("qb-unicornjob:Table9", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable9")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable9", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Table10")
AddEventHandler("qb-unicornjob:Table10", function()
    TriggerEvent("inventory:client:SetCurrentStash", "drinkstable10")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drinkstable10", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-unicornjob:Storage")
AddEventHandler("qb-unicornjob:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "vunicornstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "vunicornstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-unicornjob:Storage2")
AddEventHandler("qb-unicornjob:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "vunicornstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "vunicornstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

CreateThread(function()
    if Config.VUDrawText == "enabled" then 
        while true do
            sleep = 100
            local pos = GetEntityCoords(PlayerPedId())
            local PlayerData = QBCore.Functions.GetPlayerData()
  
                if PlayerJob.name == Config.JobName then
                    for k, v in pairs(Config.VunicornLocations["vunicorn-duty"]) do
                        local dist = #(pos - v)
                            if dist < 1.8 then
                              DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 16, 227, 86, 86, false, false, false, true, false, false, false)                              if dist < 1.8 then
                                    sleep = 5
                                    if not onDuty then
                                        QBCore.Functions.DrawText3D(v.x, v.y, v.z +0.2, "~g~E~w~ - Go on duty")
                                        --QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Go off duty")
                                    else
                                        QBCore.Functions.DrawText3D(v.x, v.y, v.z +0.2, "~r~E~w~ - Go off duty")
                                        --QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Go on duty")
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        onDuty = not onDuty
                                        TriggerServerEvent("QBCore:ToggleDuty")
                                    end
                                end
                            elseif #(pos - v) < 1.5 then
                                sleep = false
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Time Clock")
                            end
                        end
                    end
  
                --[[  for k, v in pairs(Config.VunicornLocations["weed-tray1"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 0.9 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Access Tray")
                      if IsControlJustReleased(0, 38) then
                          TriggerEvent("qb-weedshop:Tray1")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Access Tray")
                  end
              end ]]
  
                if PlayerJob.name == Config.JobName and QBCore.Functions.GetPlayerData().job.onduty then
                for k, v in pairs(Config.VunicornLocations["drinks-1"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 0.8 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Oryginalne koktajle")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-menu:Homebrewed")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Oryginalne koktajle")
                    end
                  end
  
                for k, v in pairs(Config.VunicornLocations["vunicorn-menu"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 0.9 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Dostepne Menu")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-menu:OrderMenu")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Dostepne Menu")
                    end
                end
  
                for k, v in pairs(Config.VunicornLocations["vunicorn-storage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Otwórz magazyn")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-unicornjob:Storage")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Otwórz magazyn")
                    end
                end
  
                for k, v in pairs(Config.VunicornLocations["drinks-2"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Klasyczny Koktail")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-menu:V-Classics")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Klasyczny Koktail")
                    end
                end
  
                  for k, v in pairs(Config.VunicornLocations["vunicorn-register"]) do
                      if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                          sleep = 5
                          QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Naładuj klienta")
                          if IsControlJustReleased(0, 38) then
                              TriggerEvent("qb-unicornjob:bill")
                          end
                      elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                          sleep = 5
                          QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Naładuj klienta")
                      end
                  end
 
                for k, v in pairs(Config.VunicornLocations["vunicorn-garage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Dostęp do garażu")
                        if IsControlJustReleased(0, 38) then
                          TriggerEvent("qb-unicornjob:garage")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Dostęp do garażu")
                    end
                end
            end
        Wait(sleep)
    end
    end
  end)

RegisterNetEvent('qb-unicornjob:v-shots-pack', function()
    QBCore.Functions.Progressbar('name_here', 'Opening a pack of shots...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_ped',
        flags = 16,
    }, {}, {}, function()
		TriggerServerEvent('QBCore:Server:RemoveItem', "v-shots-pack", 1)		
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "shot-absinthe", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "shot-snakebite", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "shot-redsnapper", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "shot-fireball", 1)
        TriggerServerEvent('qb-unicornjob:v-shots-pack')
        QBCore.Functions.Notify('Otworzyłeś paczkę z shots!', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)


RegisterNetEvent('qb-unicornjob:vodka-crate', function()
    QBCore.Functions.Progressbar('name_here', 'Opening a crate of vodka...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_ped',
        flags = 16,
    }, {}, {}, function()
		TriggerServerEvent('QBCore:Server:RemoveItem', "vodkacrate", 1)		
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "vodka", 5)
        TriggerServerEvent('qb-unicornjob:vodka-crate')
        QBCore.Functions.Notify('Otworzyłeś paczkę z vodka!', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)


RegisterNetEvent('qb-unicornjob:whiskey-box', function()
    QBCore.Functions.Progressbar('name_here', 'Otwieranie pudełka z  whiskey...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_ped',
        flags = 16,
    }, {}, {}, function()
		TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey-box", 1)		
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "whiskey", 5)
        TriggerServerEvent('qb-unicornjob:whiskey-box')
        QBCore.Functions.Notify('Otworzyłeś pudełko z  whiskey!', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)


RegisterNetEvent('qb-unicornjob:beer-crate', function()
    QBCore.Functions.Progressbar('name_here', 'Opening a crate of beer...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_ped',
        flags = 16,
    }, {}, {}, function()
		TriggerServerEvent('QBCore:Server:RemoveItem', "beer-crate", 1)		
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "beer", 12)
        TriggerServerEvent('qb-unicornjob:beer-crate')
        QBCore.Functions.Notify('Otworzyłeś skrzynkę z beer!', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)


RegisterNetEvent('qb-unicornjob:tequila-crate', function()
    QBCore.Functions.Progressbar('name_here', 'Opening a crate of tequila...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_ped',
        flags = 16,
    }, {}, {}, function()
		TriggerServerEvent('QBCore:Server:RemoveItem', "tequila-crate", 1)		
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "tequila", 8)
        TriggerServerEvent('qb-unicornjob:tequila-crate')
        QBCore.Functions.Notify('Otworzyłeś skrzynkę z tequila!', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)


RegisterNetEvent('qb-unicornjob:fruit-box', function()
    QBCore.Functions.Progressbar('name_here', 'Otwieranie pudełka z  fruit...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_ped',
        flags = 16,
    }, {}, {}, function()
		TriggerServerEvent('QBCore:Server:RemoveItem', "fruit-box", 1)		
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "fruit-mix", 8)
        TriggerServerEvent('qb-unicornjob:fruit-box')
        QBCore.Functions.Notify('Otworzyłeś pudełko z  fruit!', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent("qb-unicornjob:MakeEspressoMartini")
AddEventHandler("qb-unicornjob:MakeEspressoMartini", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientEspressoMartini', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Tworzysz Espresso Martini..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "coffee", 1)
                    			TriggerServerEvent('QBCore:Server:RemoveItem', "vodka", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-espressomartini", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-espressomartini"], "add")
                    			QBCore.Functions.Notify("Zrobiłeś Espresso Martini", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz przedmiotów, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end  
end)

RegisterNetEvent("qb-unicornjob:MakeMargarita")
AddEventHandler("qb-unicornjob:MakeMargarita", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientmargarita', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Margarita..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "tequila", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-sugar-syrup", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "fruit-mix", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-margarita", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-margarita"], "add")
                    			QBCore.Functions.Notify("Tworzysz a Margarita", "success")
				end, function()
					QBCore.Functions.Notify("Anulowanie..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz składników, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end
end)

RegisterNetEvent("qb-unicornjob:MakeManhattan")
AddEventHandler("qb-unicornjob:MakeManhattan", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientManhattan', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Manhattan..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-sugar-syrup", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-manhattan", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-manhattan"], "add")
                    			QBCore.Functions.Notify("You made a Manhattan", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz składników, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end
end)

RegisterNetEvent("qb-unicornjob:MakeOldFashioned")
AddEventHandler("qb-unicornjob:MakeOldFashioned", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientOldFashioned', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Old Fashioned..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-sugar-syrup", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-bitter", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-oldfashioned", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-oldfashioned"], "add")
                    			QBCore.Functions.Notify("You made an Old Fashioned", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz składników, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end
end)

RegisterNetEvent("qb-unicornjob:MakeSparkles")
AddEventHandler("qb-unicornjob:MakeSparkles", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientSparkles', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Sparkles..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "vodka", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-sugar-syrup", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "fruit-mix", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-sparkles", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-sparkles"], "add")
                    			QBCore.Functions.Notify("You made a Sparkles", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz składników, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end
end)

RegisterNetEvent("qb-unicornjob:MakeUnicorn")
AddEventHandler("qb-unicornjob:MakeUnicorn", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientUnicorn', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Unicorn..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-sugar-syrup", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "fruit-mix", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-unicorn", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-unicorn"], "add")
                    			QBCore.Functions.Notify("You made a Unicorn", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz składników, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end
end)

RegisterNetEvent("qb-unicornjob:MakeDancerz")
AddEventHandler("qb-unicornjob:MakeDancerz", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientDancerz', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Dancerz..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "beer", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "vodka", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-bitter", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-dancerz", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-dancerz"], "add")
                    			QBCore.Functions.Notify("You made a Dancerz", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz składników, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end
end)

RegisterNetEvent("qb-unicornjob:MakeHulk")
AddEventHandler("qb-unicornjob:MakeHulk", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientHulk', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Hulk..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-sugar-syrup", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "vodka", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-hulk", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-hulk"], "add")
                    			QBCore.Functions.Notify("You made a Hulk", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz składników, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end
end)

RegisterNetEvent("qb-unicornjob:MakeClass")
AddEventHandler("qb-unicornjob:MakeClass", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-unicornjob:server:get:ingredientClass', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Class..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "fruit-mix", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "v-sugar-syrup", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "coffee", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "v-class", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["v-class"], "add")
                    			QBCore.Functions.Notify("You made a Class", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("Nie masz składników, aby to zrobić", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Musisz być taktowany do pracy", "error")
	end
end)
   
RegisterNetEvent("qb-unicornjob:shop")
AddEventHandler("qb-unicornjob:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "vunicorn", Config.Items)
end)
