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

function OMG._.GetToolBox(gmId)
    local tools = {}
    tools.GetAllPlayers = function() return OMG._.GetAllPlayers(gmId) end
    tools.GetAllObjects = function() return OMG._.GetAllObjects(gmId) end
    tools.GetDimension = function() return gmId end

    -- Redirected functions for convenience in case of misuse
    tools.GetPlayerHeading = function(...) return GetPlayerHeading(...) end
    tools.GetPlayerHealth = function(...) return GetPlayerHealth(...) end
    tools.GetPlayerArmor = function(...) return GetPlayerWeapon(...) end
    tools.GetPlaeyrHeadSize = function(...) return GetPlaeyrHeadSize(...) end
    
    return tools
end
