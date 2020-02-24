AddEvent("OnPackageStart", function()
    CallRemoteEvent("OMG:ASK_GAMEMODES")
end)

AddEvent("OMG:OPEN_LOBBY", function()
    AddPlayerChat("Open Lobby")
    AddPlayerChat("Gamemode Data : "..json.stringify(OMG_DATA.Gamemodes))
end)

AddEvent("OnPackageStart", function()
    CallEvent("OMG:LOBBY:StartTimers")
end)
