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
