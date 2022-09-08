Config = {}

-- Enables debug statements which will print in consoles
-- Also enabled a command /cheist which will forcefully spawn a new heist even if one is already happening
-- Do not enable this unless asked to by a KuzQuality staff member or you know what you're doing
Config.debug = false

-- Experimental method of syncing the trucks between players
Config.experimentalSync = false

--------------------------------------------------------
--------------------------------------------------------
--- MAKE SURE THAT THE CORRECT FRAMEWORK IS ENABLED ! --
--------------------------------------------------------
--------------------------------------------------------

--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = false,
    -- Account on which players will receive their money after successfully dropping off their vehicle
    moneyAccount = 'black_money'
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = true,
    -- If you're using an old QBCore version set this to 'false' and uncomment the old export in fxmanifest.lua
    useNewQBExport = true,
    -- Account on which players will receive their money after successfully dropping off their vehicle
    moneyAccount = 'bank'
}

-- Minimum police officers that have to be online to allow spawning of the heist truck
Config.minimumOfficers = 4


-- How often the truck should be spawned (In minutes)
-- If any players are still near the old truck new one won't be spawned
Config.heistSpawnTime = 30

-- Whether or not to announce the truck spawning to all players (Besides police officers)
Config.announceTruckDepartureToPlayers = true

-- Announcement blip
Config.announcementBlip = {
    -- How long the blip will stay on the map
    duration = 15000,
    primary = {
        sprite = 161,
        color = 47,
        scale = 2.0,
        alpha = 150,
        shortRange = true,
    },
    secondary = {
        sprite = 477,
        color = 47,
        scale = 1.3,
        alpha = 255,
        shortRange = true,
    },
}

-- Whether or not to use audible vehicle alarms
Config.useVehicleAlarm = true

-- Bike jump config
Config.bikeJump = {
    enabled = true,
    keybind = 'X'
}


-- Whether or not to require a item to open the trailer
Config.requireTool = true
-- item names that will allow players to open the ramp of the trailer
Config.cuttingTools = {
    'kq_angle_grinder'
}
-- Amount of key presses required to open the latch/ramp (Set it higher to make it take longer)
Config.latchCuttingDuration = 15
-- Keys used for the angle grinder / cutting the latches
Config.grinderKeys = { 'W', 'A', 'S', 'D', 'G' }

Config.tracker = {
    -- How long it will take to search one spot on the vehicle (in ms)
    searchDuration = 15000,
    -- How many times the player has to press the keys to unscrew the tracker
    removalLength = 50,
    -- Time that players will need to wait when they misclick "drop the screwdriver" (in ms)
    removalMessedUpDuration = 6000,
    -- Keys used to unscrew the tracker
    removalKeybinds = {
        'A',
        'W',
        'D',
        'S'
    },
    -- For how long the GPS location is going to be visible for police after tracker gets removed (in ms)
    stayOnMapAfterRemovalTime = 90000,
}

-- Name of the job(s) which will receive the alerts
Config.policeJobNames = {
    'police'
}

Config.policeBlip = {
    -- How often the trackers locations should be updated (Don't recommend putting it too low) (in ms)
    refreshTime = 5000,
    -- Whether or not to allow tunnels and underground areas to lower the accuracy of the tracker
    makeTunnelsLowerSignal = true,
    -- Check which works better for detection of tunnels but makes all trackers which are far away
    -- from the officer display as if the tracker is in a tunnel (Still recommended)
    unknownTunnelChecking = true,
    truck = {
        primary = {
            sprite = 161,
            color = 47,
            scale = 2.0,
            alpha = 150,
            shortRange = false,
        },
        secondary = {
            sprite = 477,
            color = 47,
            scale = 1.3,
            alpha = 255,
            shortRange = false,
        }
    },
    vehicles = {
        primary = {
            sprite = 161,
            color = 49,
            scale = 1.0,
            alpha = 150,
            shortRange = false,
        },
        secondary = {
            sprite = 595,
            color = 49,
            scale = 1.0,
            alpha = 255,
            shortRange = false,
        }
    }
}

-- ADVANCED! If you don't know what this does. Do not change it.
Config.truckDriveStyle = 1074528293

-- Speed the truck will drive at (I don't recommend putting it above 30.0)
Config.truckDriveSpeed = 20.0
-- Color of the heist truck
Config.truckColor = { r = 255, g = 60, b = 10 }


-- All possible routes that the truck can spawn on and take
-- (Be careful when adding new ones. Make sure that the NPC knows how to drive the route (test it))
Config.startLocations = {
    {
         truck = { x = 1541.56, y = 854.07, z = 77.5, h = 329.0 },
         support = { x = 1524.74, y = 822.16, z = 77.5, h = 328.0 },
         finish = { x = 138.46, y = 6414.1, z = 26.13, h = 261.80 },
     },
    {
       truck = { x = -2875.27, y = 2188.37, z = 35.23, h = 129.0 },
       support = { x = -2841.30, y = 2207.92, z = 31.11, h = 121.19 },
       finish = { x = 2506.23, y = -280.09, z = 93.05, h = 91.77 },
   },
    {
        truck = { x = -1947.37, y = -337.79, z = 46.23, h = 280.77 },
        support = { x = -1980.10, y = -311.63, z = 43.65, h = 231.09 },
        finish = { x = -680.03, y = 5761.55, z = 16.88, h = 304.37 },
    },
    {
        truck = { x = 1156.20, y = -1695.16, z = 35.65, h = 164.31 },
        support = { x = 1165.83, y = -1669.85, z = 36.45, h = 150.35 },
        finish = { x = 138.46, y = 6414.1, z = 26.13, h = 261.80 },
    },
    {
        truck = { x = 2666.48, y = 3454.13, z = 55.73, h = 247.0 },
        support = { x = 2636.36, y = 3462.57, z = 55.37, h = 244.77 },
        finish = { x = 1379.78, y = -2068.52, z = 51.99, h = 156.80 },
    },
}

-- Whether or not to reduce the drop off reward based on how damaged the vehicle is
Config.reduceRewardByVehicleDamage = true
-- How much percentage to remove off the vehicle price based on damage (0% nothing, 100% cars which have 0 health will pay $0)
Config.reduceByDamagePercentage = 65
Config.dropOff = {
    -- Minimum amount of available drop off locations per heist
    minLocations = 2,
    -- Maximum amount of available drop off locations per heist
    maxLocations = 3,
    -- Whether or not to (almost) instantly delete the vehicle when dropping it off
    instantlyDeleteVehicle = false,
    blips = {
        primary = {
            sprite = 161,
            color = 46,
            scale = 1.0,
            alpha = 150,
            shortRange = false,
        },
        secondary = {
            sprite = 524,
            color = 46,
            scale = 1.0,
            alpha = 255,
            shortRange = false,
        }
    },
    -- All available drop off locations
    locations = {
        { x = 1274.95, y = -3239.77, z = 5.88 },
        { x = -302.86, y = -2723.41, z = 6.01 },
        { x = -371.68, y = -2273.67, z = 7.60 },
        { x = 452.45, y = -2755.19, z = 6.05 },
        { x = -450.44, y = -2442.52, z = 6.00 },
        { x = 489.70, y = -2227.92, z = 5.91 },
        { x = -161.13, y = 928.02, z = 235.65 },
        { x = 2469.17, y = 1589.04, z = 32.72 },
        { x = 363.70, y = 3411.08, z = 36.40 },
        { x = 3803.85, y = 4451.05, z = 4.25 },
        { x = 2150.34, y = 4797.62, z = 41.13 },
        { x = 1905.25, y = 4924.22, z = 48.87 },
        { x = -197.12, y = 6536.59, z = 11.09 },
        { x = -1585.75, y = 5157.74, z = 19.57 },
        { x = 143.53, y = -2445.9, z = 5.99 },
        { x = -38.46, y = -2547.16, z = 6.00 },
        { x = -224.98, y = -2657.44, z = 6.00 },
        { x = -566.59, y = -2341.45, z = 13.83 },
        { x = -853.87, y = -1257.78, z = 4.99 },
        { x = -81.51, y = 361.99, z = 112.46 },
        { x = -1558.67, y = -247,35, z = 48.28 },
    },
}

-- Color of the support vehicle
Config.supportColor = { r = 0, g = 0, b = 0 }

-- Possible vehicle models for the support vehicle
Config.supportVehicles = {
    'baller2',
    'kuruma',
    'buffalo2',
    'dubsta2',
    'stanier',
    'tailgater',
}

-- Ped models that the support can have
Config.supportPeds = {
    's_m_m_chemsec_01'
}


-- How much health all the npcs will have (normal npc's have 100)
Config.npcHealth = 200

-- Whether or not all the npcs suffer from critical hits (aka headshots) - false by default to make the robbery more difficult
Config.npcSuffersCriticalHits = false

-- Integer between 0 and 100
-- Below 20 they barely hit, above 80 incredible aim
Config.npcShootingAccuracy = 40

-- Chance of NPC's having a weapon
Config.weaponChance = 80

Config.weapons = {
    'weapon_minismg',
    'weapon_snspistol',
    'weapon_combatpistol'
}



------------------------------------------------------------------------
-- chance                   = the chance of the event spawning
-- trucks                   = list of all truck models that can be used
-- npcs                     = list of all npc models that can be used (driver and passenger)
-- passengerChance          = the chance of the truck having a passenger
-- bulletproofTiresChance   = the chance of all heist vehicles having bullet proof tires
-- vehicleSlotChance        = the chance of a vehicle spawning in a trailer slot (there always is at least 1 vehicle)
-- supportChance            = the chance of the support vehicle spawning
-- minimumVehicles          = the minimum amount of the vehicles on the trailer (max 3)
-- vehicles                 = {
--      name    = Vehicle name
--      model   = Vehicle model
--      price   = The max amount of money the players will get for dropping off the vehicle
--  }
---------------------------------------------------------------------------
--- Chances of all events must add up to 100 !
Config.events = {
    {
        chance = 20,
        trucks = {
            'phantom3'
        },
        npcs = {
            's_m_m_trucker_01'
        },
        passengerChance = 100,
        bulletproofTiresChance = 100,
        vehicleSlotChance = 70,
        supportChance = 100,
        minimumVehicles = 1,
        vehicles = {
            {
                name = 'Adder',
                model = 'adder',
                price = 40000,
            },
            {
                name = 'Entity XF',
                model = 'entityxf',
                price = 35000,
            },
            {
                name = 'Furia',
                model = 'furia',
                price = 45000,
            },
            {
                name = 'Nero Custom',
                model = 'nero2',
                price = 52000,
            },
            {
                name = 'Nero',
                model = 'nero',
                price = 44000,
            },
            {
                name = 'Cyclone',
                model = 'cyclone',
                price = 45000,
            },
            {
                name = 'T20',
                model = 't20',
                price = 40000,
            },
            {
                name = 'Vacca',
                model = 'vacca',
                price = 29000,
            },
            {
                name = 'Bullet',
                model = 'bullet',
                price = 28000,
            },
            {
                name = 'Itali GTB',
                model = 'italigtb',
                price = 33000,
            },
            {
                name = 'Itali GTB Custom',
                model = 'italigtb2',
                price = 38000,
            },
            {
                name = 'Visione',
                model = 'visione',
                price = 49000,
            },
            {
                name = 'SC1',
                model = 'SC1',
                price = 40000,
            },
            {
                name = 'Taipan',
                model = 'taipan',
                price = 47000,
            },
            {
                name = 'Thrax',
                model = 'thrax',
                price = 55000,
            },
            {
                name = 'Emerus',
                model = 'emerus',
                price = 51000,
            },
            {
                name = 'Entity XXR',
                model = 'entity2',
                price = 54000,
            },
            {
                name = 'Reaper',
                model = 'reaper',
                price = 41000,
            },
            {
                name = 'Voltic',
                model = 'voltic',
                price = 30000,
            },
            {
                name = '811',
                model = 'pfister811',
                price = 39000,
            },
            {
                name = 'Lynx',
                model = 'lynx',
                price = 32000,
            },
            {
                name = 'Autarch',
                model = 'autarch',
                price = 44000,
            },
            {
                name = 'XA-21',
                model = 'xa21',
                price = 40000,
            },
        }
    },
    {
        chance = 35,
        trucks = {
            'phantom3',
            'phantom',
            'hauler',
            'packer',
        },
        npcs = {
            's_m_m_trucker_01'
        },
        passengerChance = 80,
        bulletproofTiresChance = 40,
        vehicleSlotChance = 70,
        supportChance = 40,
        minimumVehicles = 2,
        vehicles = {
            {
                name = 'Sultan RS',
                model = 'sultanrs',
                price = 25000,
            },
            {
                name = 'Schlagen',
                model = 'schlagen',
                price = 30000,
            },
            {
                name = 'Jester Classic',
                model = 'jester3',
                price = 28000,
            },
            {
                name = 'Comet',
                model = 'comet2',
                price = 22000,
            },
            {
                name = 'Comet Retro',
                model = 'comet3',
                price = 27000,
            },
            {
                name = 'Verlierer',
                model = 'verlierer2',
                price = 30000,
            },
            {
                name = 'Omnis',
                model = 'omnis',
                price = 33000,
            },
            {
                name = 'Kuruma',
                model = 'kuruma',
                price = 24000,
            },
            {
                name = 'Space Monkey Blista',
                model = 'blista3',
                price = 25000,
            },
            {
                name = 'Coquette',
                model = 'coquette',
                price = 25000,
            },
            {
                name = 'Banshee',
                model = 'banshee',
                price = 26000,
            },
            {
                name = '9F',
                model = 'ninef',
                price = 26000,
            },
            {
                name = 'Massacro',
                model = 'massacro',
                price = 26000,
            },
            {
                name = 'Massacro Race car',
                model = 'massacro2',
                price = 33000,
            },
            {
                name = 'Dominator GTX',
                model = 'dominator3',
                price = 29000,
            },
            {
                name = 'Brioso R/A',
                model = 'brioso',
                price = 22000,
            },
            {
                name = 'F620',
                model = 'f620',
                price = 23000,
            },
            {
                name = 'Elegy Classic',
                model = 'elegy',
                price = 30000,
            },
            {
                name = 'Ruston',
                model = 'ruston',
                price = 26000,
            },
            {
                name = 'Flash GT',
                model = 'flashgt',
                price = 27000,
            },
            {
                name = 'Elegy RH8',
                model = 'elegy2',
                price = 32000,
            },
        }
    },
    {
        chance = 25,
        trucks = {
            'phantom3'
        },
        npcs = {
            's_m_m_trucker_01'
        },
        passengerChance = 100,
        bulletproofTiresChance = 100,
        vehicleSlotChance = 40,
        supportChance = 100,
        minimumVehicles = 1,
        vehicles = {
            {
                name = 'Turismo Classic',
                model = 'turismo2',
                price = 60000,
            },
            {
                name = 'JB700W',
                model = 'jb7002',
                price = 53000,
            },
            {
                name = 'Torero',
                model = 'torero',
                price = 54000,
            },
            {
                name = 'Cheburek',
                model = 'cheburek',
                price = 15000,
            },
            {
                name = 'Dynasty',
                model = 'dynasty',
                price = 42000,
            },
            {
                name = 'Monroe',
                model = 'monroe',
                price = 40000,
            },
            {
                name = 'Swinger',
                model = 'swinger',
                price = 44000,
            },
            {
                name = 'Cheetah Classic',
                model = 'cheetah2',
                price = 62000,
            },
            {
                name = 'Infernus Classic',
                model = 'infernus2',
                price = 61000,
            },
            {
                name = 'Rapid GT Classic',
                model = 'rapidgt3',
                price = 26000,
            },
            {
                name = 'Savestra',
                model = 'savestra',
                price = 27000,
            },
        }
    },
    {
        chance = 20,
        trucks = {
            'phantom3'
        },
        npcs = {
            's_m_m_trucker_01'
        },
        passengerChance = 100,
        bulletproofTiresChance = 100,
        vehicleSlotChance = 45,
        supportChance = 80,
        minimumVehicles = 1,
        vehicles = {
            {
                name = 'Comet Safari',
                model = 'comet4',
                price = 45000,
            },
            {
                name = 'Drag Tornado',
                model = 'tornado6',
                price = 47000,
            },
            {
                name = 'Apocalypse Issi',
                model = 'issi4',
                price = 37000,
            },
            {
                name = 'Drift Yosemite',
                model = 'yosemite2',
                price = 51000,
            },
            {
                name = 'Lowrider Primo',
                model = 'primo2',
                price = 42000,
            },
            {
                name = 'JB700',
                model = 'jb700',
                price = 58000,
            },
            {
                name = 'Raptor',
                model = 'raptor',
                price = 35000,
            },
        }
    },
}
