Config = Config or {}

Config.Keys = {

    action = {key = 38, label = 'E', name = 'INPUT_PICKUP'}  -- Open Garage Key  https://docs.fivem.net/docs/game-references/controls/
	
}


Config.OLDQBCore = false  -- True if you have OLD QBcore as  -- TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


Config.NewQBCore = true  --  True if you have NEW QBcore as   -- QBCore = exports['qb-core']:GetCoreObject()

 
Config.MechanicUpgradeOnly = true  --  Only Who have the mechanic job can do upgrade and edit the vehicles

-- if both of them are false then everyone can have all the features without permissions

Config.MechanicVisualOnly = true  -- Only Who have the mechanic job can do Visuals for the vehicles


Config.ActionDistance = 20.0 -- Distance to enter the garage


Config.BlipName = "Mechanic" -- Blip Name on Map


Config.BlipDesign = 72 -- Blip Design on Map   https://docs.fivem.net/docs/game-references/blips/


Config.BlipColor = 0 -- Blip Color  https://docs.fivem.net/docs/game-references/blips/


Config.BlipSize = 0.6 -- Blip Size  [ 0.1 - 0.9 ]


--------------------------------------------- FREE UPGRADE OPTION --------------------------------------------

------------------ if you dont want the free upgrade just remove the job name below and leave it " "  --------------------

Config.FreeUpgradeJob = "lsc" -- Put your job name inside "" To have free upgrades

Config.FreeUpgradeJob2 = "cardealer" -- Put your job name inside "" To have free upgrades

Config.FreeUpgradeJob3 = "mechanic" -- Put your job name inside "" To have free upgrades

-------------------------------------------------------------------------------------------------------------------------


Config.Positions = {
    {
	
        pos = {x = -336.5, y = -137.08, z = 39.0}, -- Enter Garage Coords
		
		whitelistJobName = 'mechanic', -- Job Name

    },
	{
		
        pos = {x = 25.44, y = 6459.43, z = 31.43}, -- Enter Garage Coords
		
	    whitelistJobName = 'lsc', -- Job Name
			
    },
	{
			
        pos = {x = 1174.53, y = 2639.87, z = 37.38}, -- Enter Garage Coords
		
		whitelistJobName = 'mechanic', -- Job Name
		 
    }
}



