
local pendingPlayers = {}
Lobby = {
    location = {x = -78760.0, y = -159876.0, z = 3313 + 100, yaw = -180}
}

function Lobby.OnPlayerJoin(player)
    SetPlayerSpawnLocation(player, Lobby.location.x, Lobby.location.y, Lobby.location.z, 0)
    SetPlayerLocation(player, Lobby.location.x, Lobby.location.y, Lobby.location.z, Lobby.location.yaw)
    SetPlayerPropertyValue(player, "cloth", 3, true)
    
    _.push(pendingPlayers, player)
end

function Lobby.JoinGameMode(gamemodeName, player)
    _.remove(pendingPlayers, function(player)
        return player == player
    end)
    OMG.GameManager.PlayerJoinGameMode(gamemodeName, player)
end

function Lobby.BackToLobby(player)
    local gamemode = OMG.GameManager.GetPlayerGamemode(player)
    OMG.GameManager.PlayerLeaveGameMode(gamemode.name, player)
    SetPlayerSpawnLocation(player, Lobby.location.x, Lobby.location.y, Lobby.location.z, 0)
    SetPlayerLocation(player, Lobby.location.x, Lobby.location.y, Lobby.location.z, 0)

    SetPlayerHealth(player, 100)
    SetPlayerArmor(player, 0)
    SetPlayerWeapon(player, 1, 0, true, 1, 0)
    SetPlayerWeapon(player, 1, 0, true, 2, 0)
    SetPlayerWeapon(player, 1, 0, true, 3, 0)

    CallRemoteEvent(player, "OMG:PLAYER_LOAD_DONE")
end
