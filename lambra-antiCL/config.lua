Config = {}

Config.DisplaySettings = {
    time = 15000, -- time in ms for the ped being displayed
    license = true -- set this to false so it wont show the license
}


Config.PedSettings = {
    collision = false, --set true to enable the ped collision
    pedAlpha = 200, --invisibility of the ped, 0 to 255
    boardAlpha = 200, --invisibility of the board, 0 to 255
    drawText = true --disabling this wont draw a 3d text
}

Locales = {
    ["pressinfo"] = "[~b~E~w~] Copy ~y~Info",
    ["detailClipboard"] = "Details copied to clipboard"
}

function DrawNotify(text, type)
    --Depending on your notification system you can work with type
    -- There are 3 types
    -- "error"
    -- "success"
    -- nil (for information))

    SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end