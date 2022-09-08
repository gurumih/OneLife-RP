Config = {}
Config.StartingApartment = true -- Enable/disable starting apartments (make sure to set default spawn coords)
Config.Interior = vector3(-814.89, 181.95, 76.85) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-813.97, 176.22, 76.74, -7.5) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-812.23, 182.54, 76.74, 156.5) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-813.46, 178.95, 76.85, 174.5) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true -- Define if the player can delete the character or not

Config.DefaultNumberOfCharacters = 2 -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:9d34adbd2dc7fc071eb55b4d175d4025c42d81e7", numberOfChars = 5 },
    { license = "license:c09c9fe3dd06834554a87c3a4a64ed1bfba3d283", numberOfChars = 5 },
    { license = "license:06eef477d146dc2b8bdbe11737561ea76caab3e9", numberOfChars = 3 },
    { license = "license:33a25529e0440c969662d2af860f48f52bd2de9b", numberOfChars = 5 },
}
