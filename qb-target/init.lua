function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Whether to have the target as a toggle or not
Config.Toggle = false

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = false

-- The default distance to draw the Sprite
Config.DrawDistance = 10.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {

}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetModels = {
	["vunicorn"] = {
		models = {
			"s_m_m_bouncer_01"
		},
		options = {
			{
				type = "client",
				event = "garage:V-UnicornGarage",
				icon = "fas fa-car",
				label = "Vanilla Unicorn Garage",
				job = "vunicorn",
			}
		},
		distance = 2.5,
	},
	["Banking"] = {
		models = {
			"cs_bankman",
		},
		options = {
			{
				type = "client",
				event = "qb-banking:openBankScreen",
				icon = "fas fa-circle",
				label = "Sprawdź Bank",
			},
		},
		distance = 2.5,
	},
	["burgershotgarage"] = {
			models = {
				"ig_floyd"
			},
			options = {
				{
					type = "client",
					event = "garage:BurgerShotGarage",
					icon = "fas fa-car",
					label = "BurgerShot Garage",
					job = "burgershot",
				}
			},
			distance = 2.5,
		},
		["24/7 shops"] = {
			models = {
				"mp_m_shopkeep_01",
			},
			options = {
				{
					type = "client",
					event = "qb-shops:marketshop",
					icon = "fas fa-store",
					label = "Sprawdź wyposażenie",
				},
			},
			distance = 2.5,
		},
		["ammunation shops"] = {
			models = {
				"s_m_y_ammucity_01",
			},
			options = {
				{
					type = "client",
					event = "qb-shops:marketshop",
					icon = "fas fa-shopping-cart",
					label = "Sprawdź wyposażenie",
				},
			},
			distance = 2.5,
		},
		["youtool shops"] = {
			models = {
				"s_m_m_lathandy_01",
			},
			options = {
				{
					type = "client",
					event = "qb-shops:marketshop",
					icon = "fas fa-wrench",
					label = "Sprawdź wyposażenie",
				},
			},
			distance = 2.5,
		},
		["sea world"] = {
			models = {
				"cs_dom",
			},
			options = {
				{
					type = "client",
					event = "qb-shops:marketshop",
					icon = "fas fa-circle",
					label = "Sprawdź wyposażenie",
				},
			},
			distance = 2.5,
		},
		["darkshop1"] = {
			models = {
				"a_m_m_fatlatin_01",
			},
			options = {
				{
					type = "client",
					event = "qb-shops:marketshop",
					icon = "fas fa-circle",
					label = "Sprawdź wyposażenie",
				},
			},
			distance = 2.5,
		},
		["darkshop2"] = {
			models = {
				"a_c_chimp",
			},
			options = {
				{
					type = "client",
					event = "qb-shops:marketshop",
					icon = "fas fa-circle",
					label = "Sprawdź wyposażenie",
				},
			},
			distance = 2.5,
		},
		["darkshop3"] = {
			models = {
				"csb_rashcosvki",
			},
			options = {
				{
					type = "client",
					event = "qb-shops:marketshop",
					icon = "fas fa-circle",
					label = "Sprawdź wyposażenie",
				},
			},
			distance = 2.5,
		},
		["darkshop4"] = {
			models = {
				"g_m_m_chicold_01",
			},
			options = {
				{
					type = "client",
					event = "qb-shops:marketshop",
					icon = "fas fa-circle",
					label = "Sprawdź wyposażenie",
				},
			},
			distance = 2.5,
		},

}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

}

Config.Peds = {
    {  -------Youtool Shop------
	model = `s_m_m_lathandy_01`,
	coords = vector4(45.48, -1748.85, 28.55, 55.1),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
["Grandma"] = {
	model = 'g_m_m_chemwork_01',
	coords = vector4(2439.04, 4976.61, 46.81, 271.05),
	minusOne = true,
	freeze = true,
	invincible = true,
	blockevents = true,
	flag = 1,
	scenario = 'WORLD_HUMAN_CLIPBOARD',	
	currentpednumber = 0,
},
{  -------darkshop4------
    model = `g_m_m_chicold_01`,
    coords = vector4(-1037.65, 4734.15, 232.45-1, 206.08),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------darkshop3------
    model = `csb_rashcosvki`,
    coords = vector4(2424.98, 4604.89, 29.1-1, 39.67),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------darkshop2------
    model = `a_c_chimp`,
    coords = vector4(3203.89, 4732.92, 194.0-1.2, 181.2),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------darkshop1------
    model = `a_m_m_fatlatin_01`,
    coords = vector4(397.4, -1666.14, 48.3-1, 117.07),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------banking------
    model = `cs_bankman`,
    coords = vector4(149.49, -1042.08, 28.37, 339.08),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------banking2------
    model = `cs_bankman`,
    coords = vector4(-2961.16, 482.96, 14.7, 89.59),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------banking3------
    model = `cs_bankman`,
    coords = vector4(-351.39, -51.23, 48.04, 344.36),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------banking4------
    model = `cs_bankman`,
    coords = vector4(313.8, -280.43, 53.16, 342.47),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------banking5------
    model = `cs_bankman`,
    coords = vector4(1175.02, 2708.22, 37.09, 182.34),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------banking6------
    model = `cs_bankman`,
    coords = vector4(-112.29, 6471.05, 30.63, 135.11),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------banking7------
    model = `cs_bankman`,
    coords = vector4(-1211.95, -331.96, 36.78, 26.87),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------banking8------
    model = `cs_bankman`,
    coords = vector4(247.03, 225.01, 106.29, 162.98),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
},
{  -------Youtool Shop------
	model = `s_m_m_lathandy_01`,
	coords = vector4(2748.07, 3472.72, 54.70, 238.96),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-3242.23, 999.97, 11.85, 351.66),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(24.5, -1346.63, 28.60, 273.18),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-47.18, -1758.46, 28.45, 39.64),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-706.02, -913.9, 18.35, 86.17),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1486.75, -377.57, 39.20, 132.60),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	-- San Andreas Ave Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1221.30, -907.82, 11.40, 34.60),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Carrson Ave
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(372.6, 327.06, 102.55, 258.49),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- North Rockford
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1819.96, 794.04, 137.10, 126.36),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean South
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-3039.89, 584.21, 6.90, 16.15),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-2966.41, 391.62, 14.05, 84.40),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Mirror Park
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1164.72, -323.04, 68.25, 93.92),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Vespucci Boulevard Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1134.32, -983.25, 45.45, 278.23),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Route 68
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(549.24, 2670.37, 41.25, 94.15),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Sandy
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1959.72, 3740.68, 31.40, 297.43),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Sandy Shores Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1165.25, 2710.80, 38.16, 183.01),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Grape Seed
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1697.8, 4923.14, 41.10, 321.33),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean North
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1728.33, 6416.21, 34.05, 241.78),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- LS Freeway
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(2677.32, 3279.69, 54.30, 323.82),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{---by youtool
	model = 'mp_m_shopkeep_01',
	coords = vector4(2557.28, 380.78, 107.65, 359.83),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Ammunations
{   ----vesspuci
	model = 's_m_y_ammucity_01',
	coords = vector4(-661.98, -933.57, 20.80, 181.76),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Legion Square
{
	model = 's_m_y_ammucity_01',
	coords = vector4(22.59, -1105.55, 28.80, 159.83),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Popular Street
{
	model = 's_m_y_ammucity_01',
	coords = vector4(810.21, -2159.02, 28.60, 1.43),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Vespucci Boulevard
{
	model = 's_m_y_ammucity_01',
	coords = vector4(842.42, -1035.31, 27.20, 358.67),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Vinewood Hills
{
	model = 's_m_y_ammucity_01',
	coords = vector4(253.87, -50.58, 68.95, 67.39),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Palomino Freeway
{
	model = 's_m_y_ammucity_01',
	coords = vector4(2567.97, 292.64, 107.80, 358.18),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Route 68
{
	model = 's_m_y_ammucity_01',
	coords = vector4(-1118.98, 2699.77, 17.60, 223.39),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Sandy Shores
{
	model = 's_m_y_ammucity_01',
	coords = vector4(1692.21, 3760.91, 33.70, 229.39),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Paleto
{
	model = 's_m_y_ammucity_01',
	coords = vector4(-331.61, 6084.92, 30.55, 226.57),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{ --sea world
	model = 'cs_dom',
	coords = vector4(-679.08, 5834.46, 17.33-1.0, 143.39),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},

}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('qb-core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('qb-core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCheck = function(items)
			local isTable = type(items) == 'table'
			local isArray = isTable and table.type(items) == 'array' or false
			local finalcount = 0
			local count = 0
			if isTable then for _ in pairs(items) do finalcount += 1 end end
			for _, v in pairs(PlayerData.items) do
				if isTable then
					if isArray then -- Table expected in this format {'itemName1', 'itemName2', 'etc'}
						for _, item in pairs(items) do
							if v and v.name == item then
								count += 1
							end
						end
					else -- Table expected in this format {['itemName'] = amount}
						local itemAmount = items[v.name]
						if itemAmount and v and v.amount >= itemAmount then
							count += 1
						end
					end
					if count == finalcount then -- This is to make sure it checks all items in the table instead of only one of the items
						return true
					end
				else -- When items is a string
					if v and v.name == items then
						return true
					end
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end