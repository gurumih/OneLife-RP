Config = {}

-- 3D Text Overlays
-- You can find a key binding control index here: https://docs.fivem.net/docs/game-references/controls/
-- The script is using control type 0 (PLAYER_CONTROL)
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "[E] otwórz garaż"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "[E] otwórz odcholownk"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "[E] schowaj pojazd"

-- General Config
Config.CurrencySymbol = "£"
Config.SaveVehicleDamage = true -- Setting this to false will restore the vehicles body and engine damage when putting it in a garage

-- Garages Config
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = true
}
Config.GarageVehicleReturnCost = 2500
Config.GarageVehicleTransferCost = 2500
Config.GarageShowBlips = true
Config.GarageBlipId = 357
Config.GarageBlipColour = 0
Config.GarageBlipScale = 0.6
Config.GarageUniqueBlips = false
Config.GarageLocations = { -- IMPORTANT - Every garage name must be unique      

  ['Legion Square'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles` 
    coords = vector3(215.09, -805.17, 30.81),
    spawn = vector4(212.42, -798.77, 30.88, 336.61),
    distance = 15,
    type = "car"
  },
  ['Islington South'] = {
    coords = vector3(273.0, -343.85, 44.91),
    spawn = vector4(270.75, -340.51, 44.92, 342.03),
    distance = 15,
    type = "car"
  },
  ['Forum DR.'] = {
    coords = vector3(-24.94, -1436.33, 30.03),
    spawn = vector4(-24.94, -1436.33, 30.03, 183.59),
    distance = 5,
    type = "car"
  },
  ['Tequila'] = {
    coords = vector3(-551.66, 304.74, 83.22),
    spawn = vector4(-551.66, 304.74, 83.22, 264.68),
    distance = 5,
    type = "car"
  },
  ['Doki'] = {
    coords = vector3(865.62, -3197.89, 5.37),
    spawn = vector4(865.62, -3197.89, 5.37, 180.09),
    distance = 5,
    type = "car"
  },
  ['Pietras'] = {
    coords = vector3(-3213.03, 832.58, 8.93),
    spawn = vector4(-3213.03, 832.58, 8.93, 208.06),
    distance = 5,
    type = "car"
  },
  ['The Chechen Bratava'] = {
    coords = vector3(115.84, 1212.23, 207.17),
    spawn = vector4(115.84, 1212.23, 207.17, 7.42),
    distance = 5,
    type = "car"
  },
  ['Ballas'] = {
    coords = vector3(102.47, -1963.77, 20.84),
    spawn = vector4(105.64, -1941.33, 20.18, 53.24),
    distance = 3,
    type = "car"
  },
  ['vanilla'] = {
    coords = vector3(164.85, -1283.3, 29.3),
    spawn = vector4(163.75, -1282.68, 29.2, 68.57),
    distance = 6,
    type = "car"
  },
  ['Mechanic'] = {
    coords = vector3(-384.74, -134.29, 38.69),
    spawn = vector4(-384.74, -134.29, 38.69, 322.22),
    distance = 5,
    type = "car"
  },
  ['kobe'] = {
    coords = vector3(-1529.41, 87.46, 56.65),
    spawn = vector4(-1529.41, 87.46, 56.65, 278.27),
    distance = 15,
    type = "car"
  },
  ['choinka'] = {
    coords = vector3(-1095.97, 358.39, 68.57),
    spawn = vector4(-1095.97, 358.39, 68.5, 357.07),
    distance = 5,
    type = "car"
  },
  ['zuber'] = {
    coords = vector3(-2596.57, 1922.52, 167.33),
    spawn = vector4(-2596.57, 1922.52, 167.33, 9.73),
    distance = 5,
    type = "car"
  },
  ['mechanic sandy'] = {
    coords = vector3(50.06, 6460.85, 31.43),
    spawn = vector4(50.06, 6460.85, 31.43, 214.95),
    distance = 5,
    type = "car"
  },
  ['lucifer'] = {
    coords = vector3(-887.65, 357.06, 84.88),
    spawn = vector4(-887.65, 357.06, 84.88, 2.63),
    distance = 3,
    type = "car"
  },
  ['calo'] = {
    coords = vector3(-105.2, 822.43, 235.73),
    spawn = vector4(-105.2, 822.43, 235.73, 19.14),
    distance = 3,
    type = "car"
  },
  ['Grove Street'] = {
    coords = vector3(14.66, -1728.52, 29.3),
    spawn = vector4(23.93, -1722.9, 29.3, 310.58),
    distance = 15,
    type = "car"
  },
  ['Mirror Park'] = {
    coords = vector3(1032.84, -765.1, 58.18),
    spawn = vector4(1023.2, -764.27, 57.96, 319.66),
    distance = 15,
    type = "car"
  },
  ['Beach'] = {
    coords = vector3(-1248.69, -1425.71, 4.32),
    spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
    distance = 15,
    type = "car"
  },
  ['Great Ocean Highway'] = {
    coords = vector3(-2961.58, 375.93, 15.02),
    spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
    distance = 15,
    type = "car"
  },
  ['Sandy South'] = {
    coords = vector3(217.33, 2605.65, 46.04),
    spawn = vector4(216.94, 2608.44, 46.33, 14.07),
    distance = 15,
    type = "car"
  },
  ['Sandy North'] = {
    coords = vector3(1878.44, 3760.1, 32.94),
    spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
    distance = 15,
    type = "car"
  },
  ['North Vinewood Blvd'] = {
    coords = vector3(365.21, 295.65, 103.46),
    spawn = vector4(364.84, 289.73, 103.42, 164.23),
    distance = 15,
    type = "car"
  },
  ['Grapeseed'] = {
    coords = vector3(1713.06, 4745.32, 41.96),
    spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
    distance = 15,
    type = "car"
  },
  ['Paleto Bay'] = {
    coords = vector3(107.32, 6611.77, 31.98),
    spawn = vector4(110.84, 6607.82, 31.86, 265.28),
    distance = 15,
    type = "car"
  },
  ['Boats'] = {
    coords = vector3(-795.15, -1510.79, 1.6),
    spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
    distance = 20,
    type = "sea"
  },
  ['Hangar'] = {
    coords = vector3(-1243.49, -3391.88, 13.94),
    spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
    distance = 20,
    type = "air"
  },
  ['Police'] = {
    coords = vector3(-574.1, -101.78, 33.75),
    spawn = vector4(-574.1, -101.78, 33.75, 16.93),
    distance = 5,
    type = "car"
  },
  ['DOJ'] = {
    coords = vector3(-493.05, -188.8, 37.29),
    spawn = vector4(-493.05, -188.8, 37.29, 19.36),
    distance = 18,
    type = "car"
  },
  ['Veyss'] = {
    coords = vector3(-1795.03, 456.77, 128.31),
    spawn = vector4(-1795.8, 456.38, 128.31, 91.24),
    distance = 5,
    type = "car"
  },
  ['The Lost MC'] = {
    coords = vector3(986.39, -138.66, 72.57),
    spawn = vector4(986.39, -138.66, 72.57, 59.39),
    distance = 5,
    type = "car"
  }
}

-- Private Garages
Config.PrivGarageCreateCommand = "createprivategarage"
Config.PrivGarageCreateJobRestriction = {"realestate"}

-- Job Garages
Config.JobGarageShowBlips = true
Config.JobGarageBlipId = 357
Config.JobGarageBlipColour = 0
Config.JobGarageBlipScale = 0.6
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- admin only
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- admin only
Config.JobGarageUniqueBlips = false
Config.JobGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ['ochrona'] = {
    coords = vector3(1223.29, -731.79, 59.85),
    spawn = vector4(1223.29, -731.79, 59.85, 128.23),
    distance = 2,
    job = "ochrona",
    type = "car"
  },
  ['Policja'] = {
    coords = vector3(-614.25, -118.65, 33.75),
    spawn = vector4(-614.25, -118.65, 33.75, 200.31),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Molo LS'] = {
    coords = vector3(-1634.62, -1157.62, -0.35),
    spawn = vector4(-1634.62, -1157.61, 0.25, 132.94),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Molo Male'] = {
    coords = vector3(-2142.1, -533.41, -0.34),
    spawn = vector4(-2142.11, -533.42, -0.12, 118.3),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Kanal 1'] = {
    coords = vector3(-723.23, -1364.44, -0.47),
    spawn = vector4(-723.23, -1364.44, -0.47, 139.66),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Kanal 2'] = {
    coords = vector3(601.0, -2309.04, -0.47),
    spawn = vector4(601.0, -2309.04, -0.47, 173.0),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Doki'] = {
    coords = vector3(1305.85, -3345.04, 0.82),
    spawn = vector4(1305.78, -3345.1, 0.56, 192.71),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Latarnia'] = {
    coords = vector3(3374.01, 5189.05, -0.47),
    spawn = vector4(3374.01, 5189.05, -0.47, 271.87),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Paletto'] = {
    coords = vector3(-486.21, 6496.4, -0.47),
    spawn = vector4(-486.2, 6496.4, -0.47, 22.87),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Molo Sandy'] = {
    coords = vector3(-1601.84, 5260.54, -0.47),
    spawn = vector4(-1601.84, 5260.54, -0.47, 18.8),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Molo Chumash'] = {
    coords = vector3(-3428.98, 947.37, -0.77),
    spawn = vector4(-3428.98, 947.37, -0.79, 93.03),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Tama'] = {
    coords = vector3(1689.8, 34.8, 159.56),
    spawn = vector4(1689.79, 34.79, 159.59, 270.29),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Sandy'] = {
    coords = vector3(1332.94, 4266.25, 29.58),
    spawn = vector4(1332.96, 4266.28, 29.53, 262.19),
    distance = 5,
    job = "police",
    type = "car"
  },
  ['PD Sandy 2'] = {
    coords = vector3(1578.88, 3927.16, 29.52),
    spawn = vector4(1578.87, 3927.16, 29.46, 81.85),
    distance = 5,
    job = "police",
    type = "car"
  },
}


-- Gang Garages
Config.GangGarageShowBlips = true
Config.GangGarageBlipId = 357
Config.GangGarageBlipColour = 0
Config.GangGarageBlipScale = 0.6
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- admin only
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- admin only
Config.GangGarageUniqueBlips = false
Config.GangGarageLocations = { -- IMPORTANT - Every garage name must be unique
}
-- Impound
Config.ImpoundCommand = "iv"
Config.ImpoundJobRestriction = {"police"}
Config.ImpoundShowBlips = true
Config.ImpoundBlipId = 68
Config.ImpoundBlipColour = 0
Config.ImpoundBlipScale = 0.6
Config.ImpoundUniqueBlips = false
Config.ImpoundLocations = { -- IMPORTANT - Every impound name must be unique
  ['Impound A'] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = vector4(408.44, -1630.88, 29.29, 136.88),
    distance = 15
  },
  ['Impound B'] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 15
  }
}

-- Staff Commands
Config.ChangeVehiclePlate = "vplate" -- admin only
Config.DeleteVehicleFromDB = "dvdb" -- admin only
