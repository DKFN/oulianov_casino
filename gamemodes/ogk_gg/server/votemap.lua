-- Onset Gaming Kommunity -- Gungame
-- Authors : DeadlyKungFu.ninja / Mr Jack / Alcayezz

local votes = {}
AddRemoteEvent("OGKGG:GetVotemapChoices", function(player)
    print("Began Votemap for "..player)
    local playerCount = GetPlayerCount()    
    local allMaps = _.map(avaible_map, function(mapName)
        local mapMax = spawns_max[mapName]
        local mapMin = map_min_players[mapName]
        local author = map_author[mapName]
        return {
            available = mapMax >= playerCount and mapMin <= playerCount,
            name = mapName,
            author = author,
        }
    end)
    local mapsString = json.stringify(allMaps)
    CallRemoteEvent(player, "OGKGG:SendVotemapChoices", mapsString)
    print(mapsString)
end)

AddRemoteEvent("OGKGG:VotemapRegisterVote", function(playerId, mapChoice)
    votes[playerId] = mapChoice
end)

local refreshTimer
AddEvent("OGKGG:StartVoteMap", function()
    for _, v in ipairs(OMG._.GetAllPlayers(GG_GMID)) do
        CallRemoteEvent(v, "OGKGG:InitVotemap")
    end

    refreshTimer = CreateTimer(function()
        local status = json.stringify(votes)
        for _, v in ipairs(OMG._.GetAllPlayers(GG_GMID)) do
           CallRemoteEvent(v, "OGKGG:VotemapVotesStatus", status)
        end
    end, 500)

    Delay(20000, function()
        CallEvent("OGKGG:StopVoteMap")
    end)
end)

AddEvent("OGKGG:StopVoteMap", function()
    print("Votemap stopped electing ...")
    if #votes ~= 0 then
        local voteCounts = {}
        _.forEach(votes, function(mapName)
            if voteCounts[mapName] then
                voteCounts[mapName] = voteCounts[mapName] + 1
            else
                voteCounts[mapName] = 1
            end
        end)
        _.print(voteCounts)
        local winnerMapMax = 0
        local winnerMap = current_map -- Assign to random elected one
        _.forEach(voteCounts, function(v, k)
            if v > winnerMapMax then
                winnerMapMax = v
                winnerMap = k
            end
        end)
        -- TODO: Rework: Is bad there
        -- local electedNewMap = _.first)
        current_map = winnerMap
        print("Votemap after vote results "..winnerMap)
    else
        -- Electing random maps
        local next_map = Random(1, avaible_map_count)

        print("Last map : "..last_map.." Next : "..next_map.."")
        if(next_map ~= last_map) then
            current_map = avaible_map[next_map]
            
            local max_players_next = spawns_max[current_map]
            local player_count = #OMG._.GetAllPlayers(GG_GMID)

            if max_players_next < player_count or map_min_players[current_map] > player_count then
                CallEvent('OGKGG:StopVoteMap')
                return
            end
            last_map = next_map   
        else
            CallEvent('OGKGG:StopVoteMap')
            return
        end
        OMG._.AddPlayerChatAll(GG_GMID, "Next map if no vote is : " .. avaible_map[next_map])
    end
    
    print("Restting")
    votes = {}
    DestroyTimer(refreshTimer)
    refreshTimer = nil
    for _, v in ipairs(OMG._.GetAllPlayers(GG_GMID)) do
        SetPlayerHealth(v, 0)
        CallRemoteEvent(v, "OGKGG:VotemapStopVoteMap")
        CallRemoteEvent(v, "OGKGG:GameRestarting")
     end
end)
