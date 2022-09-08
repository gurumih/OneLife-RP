Config = {}

Config.debug = false

-- If you're using the old QB export set this to false and enable the import in the fxmanifest.lua
Config.useNewQBExport = true

-- ghmattimysql or oxmysql
Config.sqlDriver = 'oxmysql';



-- Distance at which the garage 3d marker should be visible to the player
-- The sale sign must be within this distance of the garage to work! Recommended: 50.0
Config.garageRenderDistance = 50.0

-- If 3d markers should be shown
Config.drawMarkers = true

-- If all hideouts should be visible on the map
Config.showHideoutBlips = false

-- Whether players should go into a "ghost mode" after exiting their hideout to prevent them of getting spawned inside another vehicle/player
-- Ghost mode goes away as soon as the player is not near/inside any other vehicles. It's also forced to be turned off after 10 seconds to prevent exploits
Config.ghostOnExit = true

-- Whether players should be able to store other players vehicles in their hideout
Config.disallowPlayerVehicles = true

Config.maxSpeedInsideHideouts = 6.0

-- Database structure for the table responsible for player owned vehicles
-- tableName = name of the table
-- plateColumn = column name of the vehicle license plate
-- ownerColumn = column name of the owner license/id
Config.ownedVehicles = {
    tableName = 'player_vehicles',
    plateColumn = 'plate',
    ownerColumn = 'citizenid'
}




----------- QB Settings ------------
-- If players should be able to pay with these accounts to purchase their hideout and repair vehicles
Config.qbPayments = {
    payWithCash = true,
    payWithBank = true,
}

-- Whether or not to use built-in QBCore vehicle properties getter and setter
-- (Used for saving and loading vehicle properties like: color, body parts and tunes)
Config.useQBVehiclePropertiesFunctions = false
-------------------------------------


-- Classes of vehicles which could be not permitted to store in a hideout
-- true = Do not allow to store that class
-- false = Allow to store that class
Config.blacklistedClasses = {
    [0] = false, --Compacts
    [1] = false, -- Sedans
    [2] = false, -- SUVs
    [3] = false, -- Coupes
    [4] = false, -- Muscle
    [5] = false, -- Sports classics
    [6] = false, -- Sports
    [7] = false, -- Super
    [8] = false, -- Motorcycles
    [9] = false, -- Off-road
    [10] = true, -- Industrial
    [11] = true, -- Utility
    [12] = false, -- Vans
    [13] = false, -- Cycles
    [14] = true, -- Boats
    [15] = true, -- Helicopters
    [16] = true, -- Planes
    [17] = true, -- Service
    [18] = true, -- Emergency
    [19] = true, -- Military
    [20] = true, -- Commercial
    [21] = true, -- Trains
}

-- All vehicle models which should be blacklisted from being stored in a hideout
Config.blacklistedModels = {
    'police',
    'police2',
    'police3',
    'police4',
    'sheriff',
    'sheriff2',
    'taxi',
    'ambulance',
}


-- https://docs.fivem.net/docs/game-references/controls/
-- inputIndex = index of the input
-- inputName = name of the input to display on the keybind hint
-- scaneraio = The scenario that will be played during the wash
-- duration = How long it should take to wash the vehicle
-- useParticles = Whether or not particles should be created
Config.washCar = {
    enabled = true,
    inputIndex = 47,
    inputName = '~INPUT_DETONATE~',
    scenario = 'WORLD_HUMAN_MAID_CLEAN',
    duration = 10000,
    useParticles = true,
}



-- https://docs.fivem.net/docs/game-references/controls/
-- inputIndex = index of the input
-- inputName = name of the input to display on the keybind hint

-- dict = Animation dict
-- anim = Animation that will be used while repairing

-- Prices:
-- Vehicles have max 1000 engine health as well as max 1000 body health, price you set will be the price that players will
-- have to pay for each healthpoint that the vehicle is missing
Config.repairCar = {
    enabled = true,
    inputIndex = 101,
    inputName = '~INPUT_VEH_ROOF~',
    dict = 'mini@repair',
    anim = 'fixing_a_ped',
    duration = 15000,
    enginePrice = 4.0,
    bodyPrice = 3.0,
    classMultiplier = {
        [0] = 0.7, --Compacts
        [1] = 1.0, -- Sedans
        [2] = 1.0, -- SUVs
        [3] = 0.9, -- Coupes
        [4] = 1.1, -- Muscle
        [5] = 1.8, -- Sports classics
        [6] = 1.5, -- Sports
        [7] = 3.0, -- Super
        [8] = 0.5, -- Motorcycles
        [9] = 1.0, -- Off-road
        [10] = 2.0, -- Industrial
        [11] = 1.5, -- Utility
        [12] = 1.0, -- Vans
        [13] = 0.1, -- Cycles
        [14] = 1.0, -- Boats
        [15] = 1.0, -- Helicopters
        [16] = 1.0, -- Planes
        [17] = 1.5, -- Service
        [18] = 2.0, -- Emergency
        [19] = 3.0, -- Military
        [20] = 1.5, -- Commercial
        [21] = 1.0, -- Trains
    },
    repairableClasses = {
        [0] = true, --Compacts
        [1] = true, -- Sedans
        [2] = true, -- SUVs
        [3] = true, -- Coupes
        [4] = true, -- Muscle
        [5] = true, -- Sports classics
        [6] = true, -- Sports
        [7] = true, -- Super
        [8] = true, -- Motorcycles
        [9] = true, -- Off-road
        [10] = false, -- Industrial
        [11] = false, -- Utility
        [12] = true, -- Vans
        [13] = true, -- Cycles
        [14] = false, -- Boats
        [15] = false, -- Helicopters
        [16] = false, -- Planes
        [17] = false, -- Service
        [18] = false, -- Emergency
        [19] = false, -- Military
        [20] = false, -- Commercial
        [21] = false, -- Trains
    },
}

Config.interiors = {
    ['small'] = {
        name = 'Small garage',
        exits = {
            {x = 1089.5, y = 1276.0, z = 101.25},
        },
        laptop = { x = 1089.86, y = 1282.8, z = 101.0 },
        maxDimensions = { x = 3.5, y = 8.1, z = 3.0},
        slots = {
            [1] = {
                x = 1090.59, y = 1279.45, z = 99.5, h = 125.0,
            }
        },
    },
    ['medium'] = {
        name = 'Big garage',
        exits = {
            {x = 1092.0, y = 1293.30, z = 101.25},
            {x = 1084.5, y = 1293.30, z = 101.25}
        },
        laptop = { x = 1096.24, y = 1304.84, 101.0 },
        maxDimensions = { x = 3.5, y = 8.4, z = 2.8},
        slots = {
            [1] = {
                x = 1084.93, y = 1300.78, z = 99.5, h = 160.0,
            },
            [2] = {
                x = 1089.93, y = 1300.78, z = 99.5, h = 160.0,
            },
            [3] = {
                x = 1093.93, y = 1300.78, z = 99.5, h = 160.0,
            }
        },
    },
    ['workshop'] = {
        name = 'Workshop',
        exits = {
            {x = 1084.5, y = 1323.3, z = 101.25},
        },
        laptop = { x = 1095.95, y = 1335.2, 101.0 },
        maxDimensions = { x = 3.5, y = 8.4, z = 2.8},
        slots = {
            [1] = {
                x = 1083.84, y = 1331.89, z = 99.5, h = 185.0,
            },
        },
    }
}
