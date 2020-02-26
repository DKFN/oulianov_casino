AddEvent("OnPlayerJoin", function(player)
    AddPlayerChatAll('<span color="#f4f142ff" style="bold" size="13">'..GetPlayerName(player)..'</> joined the server')
    Lobby.OnPlayerJoin(player)
end)

AddRemoteEvent("OMG:ASK_GAMEMODES", function(player)
    -- print("Asking gamemodes")
    CallRemoteEvent(player, "OMG:RECEIVE_GAMEMODES", json.stringify(OMG.GameManager.GetGamemodes()))
end)
