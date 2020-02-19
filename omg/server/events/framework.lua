AddEvent("OnPlayerJoin", function(player)
    Lobby.OnPlayerJoin(player)
end)

AddRemoteEvent("OMG:ASK_GAMEMODES", function(player)
    print("Asking gamemodes")
    CallRemoteEvent(player, "OMG:RECEIVE_GAMEMODES", json.stringify(OMG.GameManager.GetGamemodes()))
end)
