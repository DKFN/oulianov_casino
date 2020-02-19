
local pendingPlayers = {}
Lobby = {}

function Lobby.OnPlayerJoin(player)
    SetPlayerSpawnLocation(player, 168268, -162020, 1243, 0)
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
    SetPlayerHealth(player, 100)
    SetPlayerLocation(player, 168268, -162020, 1243, 0)
    SetPlayerSpawnLocation(player, 168268, -162020, 1243, 0)
end
