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
    wrapPlayerEvent("OnPlayerWeaponShot")
    wrapPlayerEvent("OnPlayerQuit")
    wrapPlayerEvent("OnPlayerSpawn")
    wrapPlayerEvent("OnPlayerStreamOut")
    wrapPlayerEvent("OnPlayerStreamIn")
    wrapPlayerEvent("OnPlayerPickupHit")
    wrapPlayerEvent("OnPlayerChat")
    wrapPlayerEvent("OnPlayerChatCommand")
    wrapPlayerEvent("OnPlayerInteractDoor")

    
end)


-- AddEvent("OnPlayerDeath", function(victim, ...)
--     CallEvent("OMG:"..safePlayerGMName(victim)..":OnPlayerDeath", victim, ...)
-- end)

-- AddEvent("OnPlayerWeaponShot", function(player, ...)
--     CallEvent("OMG:"..safePlayerGMName(player)..":OnPlayerWeaponShot", player, ...)
-- end)

-- AddEvent("OnPlayerQuit", function(player)
--     OMG.GameManager.PlayerLeaveGameMode(player)
--     CallEvent("OMG:"..safePlayerGMName(player)..":OnPlayerQuit", player)
-- end)

-- AddEvent("OnPlayerSpawn", function(player)
--     CallEvent("OMG:"..safePlayerGMName(player)..":OnPlayerSpawn", player)
-- end)

