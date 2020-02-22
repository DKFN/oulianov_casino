--
-- Onset Mini Games
--
-- BigMistake - DeadlyKungFu.Ninja 

-- This file is how a gamemode registers itself to the framework

local gamemodes = {}

-- Refer to readme for data structure documentation (GamemodeStructure)
OMG.GameManager = {

}

-- Registers a gamemode on its Package start so 
function OMG.GameManager.Register(name, params)

    -- Checking user input
    local gmid = #gamemodes+1
    gamemodes[gmid] = {
        id = gmid,
        name = name,
        params = params,
        dimension = gmid,
        players = {}
    }

    -- TODO: Call the function to add all the event wrappers for the gamemode registred
    print("[OMG] Registred a new gamemode " .. name)
    _.print(gamemodes)
    CallEvent("OMG:"..name..":ACK_REGISTER", json.stringify(gamemodes[gmid]))

    return gmid
end

function OMG.GameManager.GetGamemodes()
    return gamemodes
end

-- TODO: Replace with memoized version for performance
function OMG.GameManager.GetGamemode(name)
    return _.find(gamemodes, function(gamemode)
        return gamemode.name == name
    end)
end

-- TODO: Replace with memoized version for performance
function OMG.GameManager.GetPlayerGamemode(playerid)
    local gm = _.find(gamemodes, function(gamemode)
        return _.find(gamemode.players, function(player)
            return player == playerid
        end)
    end)
    if gm then return gm else return "LOBBBY" end
end

function OMG.GameManager.Remove(name)

end

function OMG.GameManager.PlayerJoinGameMode(name, player)
    local gamemode = OMG.GameManager.GetGamemode(name)
    _.push(gamemode.players, player)

    OMG._Cache.Store("players", name, player)

    SetPlayerDimension(player, gamemode.dimension)

    CallEvent("OMG:"..gamemode.name..":OnPlayerJoin", player)
    CallEvent("OMG:"..gamemode.name..":OnPlayerSteamAuth", player)
    CallRemoteEvent(player, "OMG:"..gamemode.name..":OnPackageStart")
    CallRemoteEvent(player, "OMG:"..gamemode.name..":OnPlayerJoin", player)
    CallRemoteEvent(player, "OMG:_FW:NOTIFY_PLAYERS_IN_GAMEMODE", gamemode.name)
    CallRemoteEvent(player, "OMG:PLAYER_LOAD_GAMEMODE", gamemode.name)
    
    Delay(1000, function()
    end)
end

function OMG.GameManager.PlayerLeaveGameMode(name, player)
    local gamemode = OMG.GameManager.GetGamemode(name)
    gamemode.players = _.filter(gamemode.players, function(p) return p ~= player end)
    gamemodes[gamemode.id] = gamemode

    OMG._Cache.Remove("players", player)

    _cache.players = {}
    SetPlayerDimension(player, 0)
    CallEvent("OMG:"..name..":OnPlayerQuit", player)
    CallRemoteEvent(player, "OMG:"..name..":OnPlayerQuit")
    CallRemoteEvent(player, "OMG:_FW:NOTIFY_PLAYERS_LEAVE_GAMEMODE", name)
end
