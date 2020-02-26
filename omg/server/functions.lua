OMG._ = {}

-- Get all the players unside the gamemode (Unsafe in some events)
function OMG._.GetAllPlayers_UNSAFE(gmId)
    print("Getting all players for ")
    _.print(gmId)
    -- print("Getting all players for "..gmId)
    local ret = OMG.GameManager.GetGamemodes()[gmId].players
    _.print(ret)
    print("END")
    return ret
end

function OMG._.GetAllPlayers(gmId)
    return OMG.GameManager.GetGamemodes()[gmId].players
end

function OMG._.GetAllObjects(gmId)
    -- return OMG.GameManager.GetGamemodes()[gmId].players
end

function OMG._.AddPlayerChatAll(gmId, ...)
    local rest = ...
    local players = OMG.GameManager.GetGamemodes()[gmId].players
    _.forEach(players, function(p)
        AddPlayerChat(p, rest)
    end)
end

function OMG._.GetToolBox(gmId)
    local data = _.assign({}, OMG.GameManager.GetGamemode(gmId))

    data.GetAllPlayers = function() return OMG._.GetAllPlayers(gmId) end
    data.GetAllObjects = function() return OMG._.GetAllObjects(gmId) end
    data.AddPlayerChatAll = function(...) return OMG._.AddPlayerChatAll(gmId, ...) end
    data.GetDimension = function() return gmId end

    -- Redirected functions for convenience in case of misuse
    data.GetPlayerHeading = function(...) return GetPlayerHeading(...) end
    data.GetPlayerHealth = function(...) return GetPlayerHealth(...) end
    data.GetPlayerArmor = function(...) return GetPlayerWeapon(...) end
    data.GetPlaeyrHeadSize = function(...) return GetPlayerHeadSize(...) end
    
    return data
end
