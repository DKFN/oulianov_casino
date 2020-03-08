AddEvent("OnPlayerJoin", function(player)
    AddPlayerChatAll('<span color="#f4f142ff" style="bold" size="13">'..GetPlayerName(player)..'</> joined the server')
    Lobby.OnPlayerJoin(player)
end)

AddEvent("OnPlayerQuit", function(player)
    AddPlayerChatAll('<span color="#f4f142ff" style="bold" size="13">'..GetPlayerName(player)..'</> left the server')
    local gamemode = OMG.GameManager.GetPlayerGamemode(player)
    if gamemode then
        OMG.GameManager.PlayerLeaveGameMode(gamemode.name, player)
    end
end)


AddEvent("OnPlayerChat", function(player, text)
    local gamemode = OMG.GameManager.GetPlayerGamemode(player)
    local gmText = "LOBBY"
    if gamemode then
        gmText = gamemode.name
    end
    AddPlayerChatAll('[<span color="#006400ff" style="bold" size="13">'..gmText..'</>] <span color="#f4f142ff" style="bold" size="13">'..GetPlayerName(player)..'</> : '..text..'')
end)


AddRemoteEvent("OMG:ASK_GAMEMODES", function(player)
    -- print("Asking gamemodes")
    CallRemoteEvent(player, "OMG:RECEIVE_GAMEMODES", json.stringify(OMG.GameManager.GetGamemodes()))
end)
