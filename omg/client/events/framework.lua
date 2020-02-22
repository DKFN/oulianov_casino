AddEvent("OnPackageStart", function()
    
end)


AddRemoteEvent("OMG:RECEIVE_GAMEMODES", function(gamemodes)
    AddPlayerChat("Received gms"..gamemodes)
    OMG_DATA.Gamemodes = json.parse(gamemodes)
    CallEvent("OMG:OPEN_LOBBY")
end)

AddRemoteEvent("OMG:_FW:NOTIFY_PLAYERS_IN_GAMEMODE", function(gamemode)
    OMG_DATA.Gamemode = gamemode
    AddPlayerChat("Calling ".."OMG:"..gamemode..":OnPackageStart")
    CallEvent("OMG:"..gamemode..":OnPackageStart")
end)


AddRemoteEvent("OMG:_FW:NOTIFY_PLAYERS_LEAVE_GAMEMODE", function(gamemode)
    OMG_DATA.Gamemode = nil
    CallEvent("OMG:"..gamemode..":OnPackageStop")
end)
