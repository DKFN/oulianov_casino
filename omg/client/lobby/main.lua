AddEvent("OnPackageStart", function()
    CallRemoteEvent("OMG:ASK_GAMEMODES")
end)

AddEvent("OMG:OPEN_LOBBY", function()
end)

AddEvent("OnPackageStart", function()
    CallEvent("OMG:LOBBY:StartTimers")
end)
