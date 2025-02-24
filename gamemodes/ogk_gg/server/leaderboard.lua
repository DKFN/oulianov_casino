-- Timer that notifies all client of changes for the leaderboard
function fetchPlayerInformations(playerId, requester)
    local player = players[playerId]
    if player then
        CallRemoteEvent(requester, "OGKGG:LeaderboardReceivePlayerAvatar", playerId, player.image)
    end
end

AddEvent("OGKGG:PushPlayerAvatars", function ()
    for _, v1 in ipairs(GetAllPlayers()) do
        for _, v2 in ipairs(GetAllPlayers()) do
            fetchPlayerInformations(v1, v2)
            fetchPlayerInformations(v2, v1)
        end
    end
end)

CreateTimer(function ()
    for _, v in ipairs(GetAllPlayers()) do
        CallEvent("OGKGG:PushPlayerStats", v)
    end
end, 2000)

CreateTimer(function ()
    print("Pushing pictures to players ...")
    CallEvent("OGKGG:PushPlayerAvatars")
end, 120000)


AddEvent("OGKGG:PushPlayerStats", function(playerid)
    -- print("Pushing game state to players ...")
    for _, v in ipairs(GetAllPlayers()) do
        local player = players[v]
        if player then
            CallRemoteEvent(playerid, "OGKGG:LeaderboardReceivePlayerStats", v, json.stringify({
                lvl = player.weapon,
                country = player.country,
                name = GetPlayerName(v),
                id = v
            }))
        end
    end
end)

-- End player avatars
