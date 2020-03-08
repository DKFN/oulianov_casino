-- This is the router file for all events
local function safePlayerGMName(playerid)
    local gamemode = OMG.GameManager.GetPlayerGamemode(playerid)
    if gamemode and gamemode.name then return gamemode.name else return "LOBBY" end
end

local function wrapPlayerEvent(eventName)
    AddEvent(eventName, function(id, ...)
        CallEvent("OMG:"..safePlayerGMName(id)..":"..eventName, id, ...)
    end)
end

AddEvent("OnPackageStart", function()

    -- Player events
    wrapPlayerEvent("OnPlayerDeath")
    wrapPlayerEvent("OnPlayerDamage")
    wrapPlayerEvent("OnPlayerWeaponShot")
    wrapPlayerEvent("OnPlayerQuit")
    wrapPlayerEvent("OnPlayerSpawn")
    wrapPlayerEvent("OnPlayerStreamOut")
    wrapPlayerEvent("OnPlayerStreamIn")
    wrapPlayerEvent("OnPlayerPickupHit")
    wrapPlayerEvent("OnPlayerChat")
    wrapPlayerEvent("OnPlayerChatCommand")
    wrapPlayerEvent("OnPlayerInteractDoor")

    wrapPlayerEvent("OnPlayerEnterVehicle")
    wrapPlayerEvent("OnPlayerLeaveVehicle")
    wrapPlayerEvent("OnPlayerStateChange")


end)
