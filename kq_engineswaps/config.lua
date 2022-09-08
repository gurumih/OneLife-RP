Config = {}
-- Debug mode. Should not be enabled on a live server!
Config.Debug = false

-- If you're using the old QB export set this to false and enable the import in the fxmanifest.lua
Config.UseNewQBExport = true

-- ghmattimysql or oxmysql
Config.SqlDriver = 'oxmysql';

-- Enable if you're using a new version of Oxmysql
Config.UseNewOxmysql = false


-- Key that will be used for interacting
Config.InteractionKeybind = 'E'

-- true = Display values in metric (km/h, kg etc.)
-- false = Display values in imperial (mph, lbs etc.)
Config.UseMetric = true

-- Time in ms it takes to prepare a vehicle for engine swap
Config.PrepDuration = 8000

-- Time in ms it takes to take out the engine
Config.TakeOutDuration = 10000

-- Time in ms it takes to put in a new engine
Config.PutInDuration = 10000

-- Time in ms it takes to drop the old engine
Config.EngineDropDuration = 5000

-- Time it takes to pickup the new engine
Config.EnginePickupDuration = 6000

-- Interval between syncs of all engine swapped vehicles (in ms)
-- Recommended to keep it at minimum of 4000 and maximum of 20000 for big servers with performance issues
Config.SyncInterval = 6000

-- Radius in which vehicles with a swapped engine will be synced
-- If you experience server performance loss it is recommended to set it to a lower value
-- I recommend setting this value to at least 8.0, bigger radius will result in a smoother sync
Config.SyncRadius = 15.0

-- If this is set to true objects that are used during the swap won't have ownership.
-- If you're having issues with the objects not syncing correctly you can turn it off
Config.DontChangeObjectOwnership = false

-- Stop the engine swap if the player working on it dies or goes away from the workshop. Not stopping it might cause problems
Config.StopSwapOnDeath = true

-- A stricter way of deleting objects at the workshops, think of engines and engine lifts.
-- If you encounter any issues with objects being deleted unwantedly you can disable this option
Config.StrictObjectDeletion = true

-- This value will slightly randomize shipment duration of all engines, shipment duration could be either faster or slower
-- by this value. If you want your shipment durations to always be exactly as specified under the engine set this to 0
Config.ShipmentDurationMutator = 5

-- Whether or not to enable the /hood command for opening vehicles hood
Config.UseHoodCommand = true

-- When you press the laptop Backspace button twice you'll get to enjoy Snake, if you really don't like fun you can disable it
Config.EnableSnakeMinigame = true



Config.Blacklists = {
    -- Minimum amount of gears needs to have to be able to be engine swaps (electric vehicle have only 1 or 2 gears, making
    -- them super overpowered with a powerful engine.
    MinimumGears = 3,

    -- List of vehicle classes which should be blacklisted from getting an engine swap (https://wiki.gtanet.work/index.php?title=Vehicle_Classes)
    Classes = {
        8, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21
    },

    -- List of banned vehicle models which may not be swapped
    Models = {
        'voltic',
        'rcbandito',
        'blazer',
        'blazer2',
    }
}


-- Animation that is played while preparing a vehicle for an engine swap as well during the end of a swap
Config.RepairAnim = {
    dict = 'mini@repair',
    anim = 'fixing_a_ped',
}



--[[
    Location: location of the workshop (where vehicle is parked) (please try to keep the heading at 0, 90.0, 180.0, or 270.0)
    PlayerWorkshop: Whether or not this is a player workshop (If anyone no matter their job can use it)
    JobWorkshop: Job name that will be able to use the workshop
    StorageName: Internal workshop name, used to save stock/storage in the database
    UseSharedAccount: Whether or not it should use the balance of the job or players money when ordering an engine
    SharedAccount: Name of the shared account that will be used to purchase engines
    Permissions: [
        SwapJobGrade: Grade of job player will need to perform a swap
        PurchaseEngineJobGrade: Grade of job player will need to purchase engines
    ]
    Laptop: Properties of the laptop prop
    Lift: [
        Prop: Properties of the engine lift prop
        ClearArea: If area should be cleared of any props that could be laying around
        ClearRadius: Radius of the area that will be cleared
        Side: Side of the vehicle where the lift will be located (Should always be on the rigth side of the car, if it's not, replace 1 with -1 or -1 with 1)
        Rotation: Axis of which the vehicle is facing (0 for north/south, 1 for west/east)
    ]
    EngineDropoff: [
        ClearArea: If area should be cleared of any props that could be laying around
        ClearRadius: Radius of the area that will be cleared
    ]
    NewEngine: [
        ClearArea: If area should be cleared of any props that could be laying around
        ClearRadius: Radius of the area that will be cleared
    ]

--]]
Config.Workshops = {
    {
        location = { x = -222.17, y = -1329.1, z = 30.9, h = 90.0},

        playerWorkshop = false,
        jobWorkshop = 'cardealer',
        storageName = 'cardealer',

        useSharedAccount = true,
        sharedAccount = 'cardealer',

        permissions = {
            swapJobGrade = 2,
            purchaseEngineJobGrade = 3,
        },

        laptop = {
            prop = {
                x = -228.7, y = -1329.63, z = 30.85, h = 100.0, model = 'p_laptop_02_s'
            }
        },
        lift = {
            prop = {
                x = -223.87, y = -1321.5, z = 29.93, h = 90.0, model = 'prop_engine_hoist'
            },
            clearArea = true,
            clearRadius = 10.0,
            side = 1, --    1 for right side of the car, -1 for left side of the car
            rotation = 1, --    0 for north/south, 1 for west/east
        },
        engineDropoff = {
            x = -219.7, y = -1321.56, z = 30.93, h = 270.0,
            clearArea = true,
            clearRadius = 3.0,
        },
        newEngine = {
            x = -220.0, y = -1333.2, z = 30.75, h = 300.0,
            clearArea = true,
            clearRadius = 3.0,
        },
    },
    {
        location = { x = 1091.46, y = 1326.53, z = 101.0, h = 270.0},

        playerWorkshop = true,
        jobWorkshop = '',
        storageName = '',

        useSharedAccount = false,
        sharedAccount = '',

        permissions = {
            swapJobGrade = 0,
            purchaseEngineJobGrade = 0,
        },

        laptop = {
            prop = {
                x = 1097.1, y = 1333.42, z = 101.01, h = 270.0, model = 'p_laptop_02_s'
            }
        },
        lift = {
            prop = {
                x = 1090.96, y = 1333.17, z = 100.01, h = 10.0, model = 'prop_engine_hoist'
            },
            clearArea = true,
            clearRadius = 3.0,
            side = -1, --    change between -1 and 1 to toggle between sides of the car, dependant on workshop heading  | The lift must always be on the right side of the vehicle
            rotation = 1, -- 0 for north/south, 1 for west/east
        },
        engineDropoff = {
            x = 1088.56, y = 1334.12, z = 101.0, h = 0.0,
            clearArea = true,
            clearRadius = 2.0,
        },
        newEngine = {
            x = 1095.97, y = 1323.8, z =  100.785, h = 70.0,
            clearArea = true,
            clearRadius = 2.0,
        },
    }
}


-- This will be the sound the vehicle makes after you take out the engine and still attempt to start it
Config.NoEngine = {
    sound = 'rcbandito'
}

-- Engines will be displayed on the laptop in this order
Config.AvailableEngines = {
    'i4_1.6',
    'i4_1.8',
    'i4_2.0',
    'v6_3.0',
    'v6_3.6',
    'v6_4.0',
    'v6_6.0',
    'v8_4.0',
    'v8_4.3',
    'v8_5.4',
    'v12_5.8',
    'v12_6.0',
}

---------------------------------------------------------------------------------------------
-- <!> ADVANCED <!>
-- If this function is enabled the function responsible for setting the vehicle handling
-- will be switched from the built-in function the function located in editable.lua
-- Do not change this if you do  not what you're doing
Config.UseCustomHandlingSetter = false
---------------------------------------------------------------------------------------------


-- Performance multiplier. Could be an easy way to up the performance of all (swapped)engines at the same time
-- without having to configure all engines separately
-- be careful while setting the maxV multiplier as it strongly influences the power in general
Config.PowerMultiplier = 1
Config.MaxVMultiplier = 1



--[[
    -- Engine --
    Value between the square brackets "[ ]" is the so called "key", please do not use any special symbols in the key
    --
    Name: Engine name
    Power: Abstract power rating (acceleration)
    MaxV: Abstract max speed rating (max speed, but also influences acceleration)
    Mass: Weight of the engine in kg
    Displacement: Size of the engine in liters
    PhysicalSize: Abstract value for how big the engine is. Big engines won't fit in small vehicles
    Sound: Model name of the vehicle that the sound will be used for that engine
    Image: name of the image file that will be used for that engine (located in html/img/engines)
    ShipmentDuration: Time in minutes it will take to receive the engine after placing an order (Mutated with the mutator)
    Price: Price of the engine

    -- If you edit an existing engine all vehicles with that engine will be updated.
    -- Make sure to never change or remove the engine KEY after players have purchased/equipped it.
        If you really want to remove an engine from the game make sure to delete all mentions of it in the database
        If you just want to make the engine unavailable for future purchase or swap remove it from the Config.AvailableEngines

]]--
Config.Engines = {
    ['i4_1.6'] = {
        name = 'I4 1.6L',
        power = 244,
        maxV = 160.0,
        mass = 155.0,
        displacement = 1.6,
        physicalSize = 1,
        sound = 'blista2',
        image = 'i4_3.png',
        shipmentDuration = 20,
        price = 120000,
    },
    ['i4_1.8'] = {
        name = 'I4 1.8L',
        power = 190,
        maxV = 185.0,
        mass = 164.0,
        displacement = 1.8,
        physicalSize = 1,
        sound = 'rebel',
        image = 'i4_2.png',
        shipmentDuration = 20,
        price = 112000,
    },
    ['i4_2.0'] = {
        name = 'I4 2.0L',
        power = 267,
        maxV = 190.0,
        mass = 154.0,
        displacement = 2.0,
        physicalSize = 1,
        sound = 'sultanrs',
        image = 'i4_1.png',
        shipmentDuration = 20,
        price = 124000,
    },
    ['v6_3.0'] = {
        name = 'V6 3.0L',
        power = 279,
        maxV = 200.0,
        mass = 190.0,
        displacement = 3.0,
        physicalSize = 2,
        sound = 'sentinel3',
        image = 'v6_4.png',
        shipmentDuration = 30,
        price = 132000,
    },
    ['v6_3.6'] = {
        name = 'V6 3.6L',
        power = 315,
        maxV = 220.0,
        mass = 239.0,
        displacement = 3.6,
        physicalSize = 2,
        sound = 'gb200',
        image = 'v6_3.png',
        shipmentDuration = 30,
        price = 136000,
    },
    ['v6_4.0'] = {
        name = 'V6 4.0L',
        power = 324,
        maxV = 220.0,
        mass = 248.0,
        displacement = 4.0,
        physicalSize = 3,
        sound = 'jester3',
        image = 'v6_2.png',
        shipmentDuration = 35,
        price = 139000,
    },
    ['v6_6.0'] = {
        name = 'V6 6.0L',
        power = 335,
        maxV = 240.0,
        mass = 278.0,
        displacement = 6.0,
        physicalSize = 3,
        sound = 'massacro',
        image = 'v6_1.png',
        shipmentDuration = 45,
        price = 142000,
    },
    ['v8_4.0'] = {
        name = 'V8 4.0L',
        power = 332,
        maxV = 210.0,
        mass = 339.0,
        displacement = 4.0,
        physicalSize = 4,
        sound = 'schlagen',
        image = 'v8_3.png',
        shipmentDuration = 60,
        price = 144000,
    },
    ['v8_4.3'] = {
        name = 'V8 4.3L',
        power = 450,
        maxV = 450.0,
        mass = 450.0,
        displacement = 4.0,
        physicalSize = 4,
        sound = 'lg30meramgtr',
        image = 'v8_2.png',
        shipmentDuration = 1,
        price = 147000,
    },
    ['v8_5.4'] = {
        name = 'V8 5.4L',
        power = 330,
        maxV = 330.0,
        mass = 390.0,
        displacement = 5.4,
        physicalSize = 5,
        sound = 'w211',
        image = 'v8_1.png',
        shipmentDuration = 1,
        price = 1,
    },
    ['v12_5.8'] = {
        name = 'V12 5.8L',
        power = 450,
        maxV = 450.0,
        mass = 450.0,
        displacement = 5.8,
        physicalSize = 6,
        sound = 'lg30meramgtr',
        image = 'v12_1.png',
        shipmentDuration = 1,
        price = 1,
    },
    ['v12_6.0'] = {
        name = 'V12 6.0L',
        power = 400,
        maxV = 350.0,
        mass = 350.0,
        displacement = 6.0,
        physicalSize = 6,
        sound = 'XA21',
        image = 'v12_2.png',
        shipmentDuration = 1,
        price = 1,
    },
}
