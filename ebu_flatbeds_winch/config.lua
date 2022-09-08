-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
Config = {}

Config.license_key = "ebuk_PGvZHF5MM940WNlpVedutPGv09bYLCZk"
--Config.license_key2 = ""

Config.MarkerType       = 25
Config.MarkerColor      = { r = 0, g = 255, b = 100 }
Config.MarkerSize       = { x = 1.0, y = 1.0, z = 1.0 }

Config.CarMarkerSize    = { x = 2.0, y = 2.0, z = 1.0 }
Config.BikeMarkerSize   = { x = 1.0, y = 1.0, z = 1.0 }


Config.bikes        = {8,13}
Config.cars         = {0,1,2,3,4,5,6,7,9,11,12,17,18,10,11,19,20}
Config.large        = {10,11,19,20}
Config.boats        = {14}

Config.ShowMarkers      = true
Config.ShowWinchMarkers = true
Config.Notifications    = true

-- Control list: https://docs.fivem.net/docs/game-references/controls/
Config.ControlKeyDown   = 173    -- Roll bed back. Default: 86 (E)
Config.ControlKeyUp     = 172    -- Roll bed forward. Default: 47 (G)
Config.ControlKeyReset  = 140    -- Secret key to Reset bed position when standing in control circle. Default: 140 (R)
Config.AttachDetachKey  = 51    -- Attach/Detach vehicle. Default: 51 (E)
Config.WinchIn          = 174
Config.WinchOut         = 175

-- Control Messages
Config.WinchText        = '~INPUT_CELLPHONE_UP~/~INPUT_CELLPHONE_DOWN~ for bed ~n~~INPUT_CELLPHONE_LEFT~/~INPUT_CELLPHONE_RIGHT~ for start /stop winch ~n~~INPUT_CONTEXT~ to load the vehicle'
Config.DetachText       = 'Press ~INPUT_CONTEXT~ to detach the vehicle'
Config.AttachText       = 'Press ~INPUT_CONTEXT~ to attach/detach the vehicle'
Config.LoadCarText      = 'Press ~INPUT_CONTEXT~ to load the vehicle'

--NOTIFICATIONS--
Config.NotiLoadMessage          = "Loading..."
Config.NotiUnLoadMessage        = "Unloading..."
Config.NotiLoadCompleteMessage  = "Loading Complete"
Config.NotiBlockedMessage       = "Unloading zone blocked"

-- NON WINCH ONLY (saves resources - Make sure to comment out or remove the reference to the dll in fxmanifest)
Config.nonWinch         = false
Config.ControlText      = '~INPUT_CELLPHONE_UP~/~INPUT_CELLPHONE_DOWN~ for bed'

Config.Trucks = {
    [GetHashKey('1353720154')] = {
        boneName = 'misc_a',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.4, -0.1),
        carHeightOffset = 0.0,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 5.0 --How far backwards from the winch bone to check from
    },
    [GetHashKey('bc205500w')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, 0.0),
        carHeightOffset = -0.1,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('ramtow')] = {
        type = 'rolling',
        boneName = 'misc_f',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, -0.5, 0.0),
        carHeightOffset = 0.1,
        winchBone = 'misc_w',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('c3rollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.6),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('c3pwrollback')] = { 
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.6),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('c3f350rollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.6),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('f550rb')] = {
        staticBed = false,
        boneName = 'misc_z',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.75,-0.55),vector3(1.8,-4.75,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, -0.0, 0.0),
        carHeightOffset = 0.2,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('c3silvrollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.6),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    ['flatbedm2']={
        staticBed = false,
        boneName = 'scoop',
        unloadPos = {vector3(-2.0,2.0,-0.55)},
        scoopfixPos = {vector3(3.2, -4.0, 12.4)},
        carPositions = {vector3(0.0, -2.3, 0.8)},
        bikePositions = {vector3(0.0, 2.3, 0.8)},
        carHeightOffset = 0.8,

    },


    --STATIC BEDS
    [GetHashKey('flatbed')] = {
        type = 'static',
        carloadPos = vector3(0.0, -10.0, -0.55),
        loadPos = {vector3(-2.0, -5.0, -0.55)},
        unloadPos = {vector3(-2.0, 0.0, -0.55)},
        carPosition = vector3(0.0, -2.3, 0.8),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.7,
    },

    --PICKUP TRUCK EXAMPLE
    [GetHashKey('sadler')] = {
        type = 'static',
        carloadPos = vector3(0.0, -5.5, -0.55),
        loadPos = {vector3(-1.5, -3.0, -0.55)},
        unloadPos = {vector3(-1.0, 0.0, -0.55)},
        carPosition = vector3(0.0, -2.2, 0.8),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.6,
    },
}

