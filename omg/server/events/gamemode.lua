-- This is the router file for all events

AddEvent("OnPlayerDeath", function(victim, ...)
    local gamemode = OMG.GameManager.GetPlayerGamemode(victim)
    CallEvent("OMG:"..gamemode.name..":OnPlayerDeath", victim, ...)
end)

AddEvent("OnPlayerWeaponShot", function(player, ...)
    local gamemode = OMG.GameManager.GetPlayerGamemode(player)
    CallEvent("OMG:"..gamemode.name..":OnPlayerWeaponShot", player, ...)
end)

AddEvent("OnPlayerQuit", function(player)
    local gamemode = OMG.GameManager.GetPlayerGamemode(player)
    OMG.GameManager.PlayerLeaveGameMode(player)
    CallEvent("OMG:"..gamemode.name..":OnPlayerQuit", player)
end)

AddEvent("OnPlayerSpawn", function(player)
    local gamemode = OMG.GameManager.GetPlayerGamemode(player)
    if not gamemode then
        print("[OMG] Player in lobby " .. player)
        return
    end
    print("Player spawned in gamemode")
    CallEvent("OMG:"..gamemode.name..":OnPlayerSpawn", player)
end)

