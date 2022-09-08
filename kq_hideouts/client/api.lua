-- Called after players enters their hideout (with or without a vehicle)
function OnEnterHideout(hideout)
    -- print('Entering ' .. hideout.name)
end

-- Called after player goes outside their hideout (with or without a vehicle)
function OnExitHideout(hideout)
    -- print('Exiting ' .. hideout.name)
end

-- Called after player stores a vehicle in their hideout
function OnVehicleStored(hideout, vehicle)
    -- print('Vehicle stored ' .. vehicle)
end

-- Called after player opens the hideout purchase menu
function OnOpenPurchaseMenu(hideout)
    -- print('Opened purchase menu ' .. hideout.name)
end

-- Called after purchase of a hideout
function OnHideoutPurchase(hideout)
    -- print('Hideout purchased ' .. hideout.name)
end

-- Called after player closes the purchase menu
function OnClosePurchaseMenu()
    -- print('Purchase menu closed')
end

-- Called after hideout vehicle spawns (Happens when player enters their hideout)
function OnVehicleSpawn(vehicle)
    -- print('Vehicle spawned ' .. vehicle)
end

-- Called after player starts washing their vehicle
function OnVehicleWashStart(vehicle)
    -- print('Starting washing ' .. vehicle)
end

-- Called after player is done washing their vehicle
function OnVehicleWashEnd(vehicle)
    -- print('Washing finished ' .. vehicle)
end

-- Called after player starts repairing their vehicle
function OnVehicleRepairStart(vehicle)
    -- print('Starting repairing ' .. vehicle)
end

-- Called after player is done repairing their vehicle (success can be false if player has not enough money to repair)
function OnVehicleRepairEnd(success, vehicle)
    -- print('Repairing finished ' .. vehicle)
end


--[[
    Functions which you can use to get variables

    Returns whether or not player is inside a hideout
        function: GetInside()
        returns: If player is inside a hideout it will return the hideouts key.
            if player is not inside a hideout it will return `nil`

    Returns all owned hideouts
        function: GetOwnedHideouts()
        returns: Returns a table of all player owned hideouts (Same values as in the database table kq_hideouts)



]]--


-- Functions which are used but you may edit to your likings

-- This function displays all tooltip messages/notifications (top left)
-- You could edit it if you're using a custom notifications system
function ShowTooltip(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end