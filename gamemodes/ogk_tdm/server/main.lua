Players = {}
local teams = {
    rebels = {
        points = 0,
        players = {},
        spawns = {
            { 95023.0, 49480.0, 2699.0, 0 },
            { 93634.0, 51194.0, 2668.0, 0 },
            { 93894.0, 50991.0, 2625.0, 0 },
            { 93516.0, 50878.0, 2612.0, 0}
        },
        skins = {
            3, 4, 5, 6
        }
    },
    crs = {
        points = 0,
        players = {},
        spawns = {
            { 93634.0, 51194.0, 2268.0, 0 },
            { 95023, 49480, 2299, 0 },
            { 95285, 48991, 2299, 0 },
            { 94349, 49032, 2299, 0 }
        },
        skins = {
            26, 27, 28
        }
    }
}

local game = {
    launched = nil, -- Timestamp when the game launched,
    ends = nil
}
local gmId
local debug = false

AddEvent("OnPackageStart", function()
    if not OMG then
        print("OMG IS NOT SETUP CORRECTLY")
        print("GAMEMODE WILL NOT WORK")
    end
    gmId = OMG.GameManager.Register("OGKTDM", { 
        author = "DeadlyKungFu.Ninja & Kemro", 
        fullName = "Team deathmatch !" ,
        lobby = {
            npc = {
                clothId = 13,
                pos = { x = 135164.0, y = 191875.0, z = 1239.0 + 60, yaw = 0}
            },
            maxPlayers = 8
        }
    })
    CallEvent('Digital:World:LoadWorld', 'kemro_bod.json', gmId)
end)

AddEvent("OMG:OGKTDM:OnPackageStart", function(data)
    print("Confirmed registration with : "..data)
    print("Say hello, this is the first event from the framework !!")
end)

function SetTeam(playerid, team)
    teams[team].players[#teams[team].players + 1] = playerid
    Players[playerid].team = team
    Players[playerid].cloth = teams[team].skins[Random(1, #teams[team].skins)]
    AddPlayerChat(playerid, "You are in the ".. team .. " team")
    local assigned_spawn = teams[team].spawns[Random(1, #teams[team].spawns)]
    SetPlayerSpawnLocation(playerid, assigned_spawn[1], assigned_spawn[2], assigned_spawn[3] + 500, assigned_spawn[4])
    SetPlayerHealth(playerid, 0)

    -- TODO : Ecrire un script pour faire gaffe que le joueur tombe pas et le recuperer si c'est le cas
    Delay(3000, function()
        SetPlayerLocation(playerid, assigned_spawn[1], assigned_spawn[2], assigned_spawn[3])
    end)
end

function UnsetPlayerTeam(playerid)
    local r = _.filter(teams.crs.players, function(p) 
        print("CMP CRS : "..p.." : "..playerid)
        return p ~= playerid
    end)

    print("Olds crs : ".._.str(teams.crs.players).." new crs : ".._.str(r))
    teams.crs.players = r
    local rp = _.filter(teams.rebels.players, function(p)
        print("CMP TERRO : "..p.." : "..playerid)
        return p ~= playerid
    end)
    print("New terro : ".._.str(teams.rebels.rp))
    teams.rebels.players = rp
end

AddCommand("police", function(playerid)
    UnsetPlayerTeam(playerid)
    SetTeam(playerid, "crs")
end)

AddCommand("terro", function(playerid)
    UnsetPlayerTeam(playerid)
    SetTeam(playerid, "rebels")
end)

AddRemoteEvent("OGKTDM:GivePlayerWeapon", function(playerid, weaponid, slotid)
    local player = Players[playerid]
    -- AddPlayerChat(playerid, "Received weapon "..weaponid.." on slot "..slotid)
    SetPlayerWeapon(playerid, weaponid, 200, slotid == 1, slotid, true)
    if slotid == 1 then
        Players[playerid].primary = weaponid
    elseif slotid == 2 then
        Players[playerid].secondary = weaponid
    end
    -- CallRemoteEvent(playerid, "CloseWeaponMenu")
    Delay(500, function()
        -- EquipPlayerWeaponSlot(playerid, 1)
    end)
end)


AddEvent("OMG:OGKTDM:OnPlayerJoin", function(playerid)
    p = {}
    p.id = playerid
    p.weapon = 1
    p.ingame = false
    p.cloth = 3
    p.points = 0
    p.primary = 1
    p.secondary = 1
    Players[playerid] = p
    SetPlayerSpawnLocation(playerid, 90754.0, 81583.0, 1922.0, 0)
    SetPlayerHealth(playerid, 0)
end)

AddEvent("OMG:OGKTDM:OnPlayerSpawn", function(playerid)
    CallRemoteEvent(playerid, "OMG:PLAYER_LOAD_DONE")
    
    local p = Players[playerid]
    SetPlayerWeapon(playerid, 1, 0, true, 1, true)
    SetPlayerWeapon(playerid, 1, 0, true, 2)
    SetPlayerWeapon(playerid, 1, 0, true, 3)

    if not p.ingame then
        AddPlayerChat(playerid, '===> Welcome on OGK TeamDeathMatch <===')
        AddPlayerChat(playerid, "/kill to kill yourself")
        AddPlayerChat(playerid, "/weapons to change weapon")
        AddPlayerChat(playerid, "Press F2 to browse all OGK servers")

            -- Fin the player with the least weapon
            local terroCount = #teams.rebels.players
            local policeCount = #teams.crs.players

            if terroCount > policeCount then
                SetTeam(playerid, "crs")
            else
                SetTeam(playerid, "rebels")
            end
            Players[playerid].ingame = true;
    end

    CallEvent("SyncClothes")

    SetPlayerHealth(playerid, 9999)
    AddPlayerChat(playerid, "Anti spawn kill activé")
    Delay(2000, function()
        AddPlayerChat(playerid, "Anti spawn kill desativé")
        SetPlayerHealth(playerid, 100)
    end)
    CallRemoteEvent(playerid, "OGKTDM:OpenWeaponMenu")
    _.print(teams)
    _.print(team)
    _.print(p)
    local team = p.team
    local assigned_spawn = teams[team].spawns[Random(1, #teams[team].spawns)]
    SetPlayerLocation(playerid, assigned_spawn[1], assigned_spawn[2], assigned_spawn[3] + 500, assigned_spawn[4])
end)

AddEvent("OMG:OGKTDM:OnPlayerQuit", function(player)
    UnsetPlayerTeam(player)
    Players[player] = nil
end)

-- AddCommand("kill", function(player)
--    SetPlayerHealth(player, 0)
-- end)

CreateTimer(function()
    print("Game state dump")
    _.print(Players)
    _.print(teams)
    _.print(game)
end, 5000)

AddEvent("OMG:OGKTDM:OnPlayerDeath", function(player, instigator)
    if Players[instigator] and Players[player] and player ~= instigator and Players[player].team ~= Players[instigator].team then
        Players[instigator].points = Players[instigator].points + 50
        teams[Players[instigator].team].points = teams[Players[instigator].team].points + 50
        AddPlayerChatAll(GetPlayerName(instigator).." killed "..GetPlayerName(player))
    end

    if player == instigator then
        AddPlayerChatAll(GetPlayerName(player).." suicided")
    end
end)

-- Notify all the players of the points and refresh the game state if needed
CreateTimer(function()
    -- AddPlayerChatAll("Team Police points: "..teams.crs.points.." : Team Terro points: "..teams.rebels.points)

    local message = ""
    local gameState = 0
    local terroCount = #teams.rebels.players
    local policeCount = #teams.crs.players
    
    print("Terro count "..terroCount.." Police count "..policeCount)

    -- if terroCount == 0 then
    if terroCount == 0 or policeCount == 0 then
        gameState = 0
        game.launched = nil
        game.ends = nil
        teams.rebels.points = 0
        teams.crs.points = 0
        message = "WAITING FOR OPPONENT"
    end

    -- if terroCount > 0 then
    if terroCount > 0 and policeCount > 0 then
        gameState = 1
        if not game.launched then
            game.launched = os.time(os.date("!*t"))
            game.ends = os.time(os.date("!*t")) + ( 5 * 60 )
            -- game.ends = os.time(os.date("!*t")) + ( 2 * 60 )
            print("Launching game")
        else
            local now = os.time(os.date("!*t"))
            local left = game.ends - now
            local minutes = math.floor(left / 60)
            local seconds = left % 60
            if left <= 0 and gamestate ~= 2 then
                gameState = 2
                CallEvent("OGKTDM:ResetGame")
            end
            -- print("Seconds left : "..left)
            -- print(""..minutes..":"..seconds)
            message = ""..minutes..":"..seconds
        end
    end
    -- TODO : Win

    if gameState == 2 then
        message = "--:--"
    end

    local gameState = {
        state = gameState, -- Is Game launched
        terroPoints = teams.rebels.points,
        policePoints = teams.crs.points,
        secondsLeft = 0,
        message = message,
    }

    for k,v in ipairs(OMG._.GetAllPlayers(gmId)) do
        CallRemoteEvent(v, "OGKTDM:NotifyGameState", json.stringify(gameState))
    end
end, 1000)

-- Reset the game state a new game starts 
AddEvent("OGKTDM:ResetGame", function()
    local terroPoints = teams.rebels.points
    local policePoints = teams.crs.points

    if terroPoints > policePoints then
        AddPlayerChatAll("Terrorists won the round")
        for k, v in ipairs(GetAllPlayers()) do
            CallRemoteEvent(v, "SetWinState", 1)
        end
    elseif policePoints > terroPoints then
        AddPlayerChatAll("Anti-Police won the round")
        for k, v in ipairs(GetAllPlayers()) do
            CallRemoteEvent(v, "SetWinState", 2)
        end
    end

    teams.rebels.points = 0
    teams.crs.points = 0

    for k, v in ipairs(GetAllPlayers()) do
        SetPlayerHealth(v, 0)
    end

    -- Find Winner
    Delay(3000, function()
        gameState = 0
        game.launched = nil
        game.ends = nil
        for k, v in ipairs(GetAllPlayers()) do
            CallRemoteEvent(v, "SetWinState", 0)
        end
    end)
end)

