if OMG_DEBUG == true then
    -- Usage: /gm <register_name>
    AddCommand("gm", function(player, name)
        AddPlayerChat(player, name)
        Lobby.JoinGameMode(name, player)
    end)

    -- User: /lobby
    AddCommand("lobby", function(player)
        AddPlayerChat(player, "Returning to lobby")
        Lobby.BackToLobby(player)
    end)

    AddCommand("kill", function(player)
        SetPlayerHealth(player, 0)
    end)
end

CreateTimer(function()
    --_.print(OMG.GameManager.GetGamemodes())
end, 2000)
