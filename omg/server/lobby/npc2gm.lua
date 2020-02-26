
local npcs = {}

local function SearchGamemodeNPCS()
    _.forEach(OMG.GameManager.GetGamemodes(), function(gm)
        if gm.params and gm.params.lobby and gm.params.lobby.npc then
            local npcParams = gm.params.lobby.npc
            if not npcs[gm.id] then
                print("NPC Params", _.str(npcParams))
                npcs[gm.id] = {}
                npcs[gm.id].npcId = CreateNPC(
                    npcParams.pos.x,
                    npcParams.pos.y,
                    npcParams.pos.z,
                    npcParams.pos.yaw
                )
                SetNPCPropertyValue(npcs[gm.id].npcId, "clothId", gm.params.lobby.npc.clothId, true)

                -- TODO: Obviously clientside :D
                -- SetNPCClothingPreset(npcParams.clothId)
                npcs[gm.id].textId = CreateText3D(gm.params.fullName, 20, npcParams.pos.x, npcParams.pos.y, npcParams.pos.z + 120, 0, 0, 0)         
                npcs[gm.id].playerTextId = CreateText3D("by "..gm.params.author.." | "..#gm.players.."/"..gm.params.lobby.maxPlayers, 12, npcParams.pos.x, npcParams.pos.y, npcParams.pos.z + 100, 0, 0, 0)          
                npcs[gm.id].markerId = CreateObject(2, npcParams.pos.x, npcParams.pos.y, npcParams.pos.z - 100)
                SetObjectAttached(npcs[gm.id].markerId, ATTACH_NPC, npcs[gm.id].npcId, 0, 0, - 70)
                npcs[gm.id].gm = gm
            else
                -- Just refresh playercount or something
                SetText3DText(npcs[gm.id].playerTextId, "by "..gm.params.author.." | "..#gm.players.."/"..gm.params.lobby.maxPlayers)
            end
        end
    end)
end
AddEvent("OMG:_FW:NPC2GM:SearchGamemodeNPCS", SearchGamemodeNPCS)

AddRemoteEvent("ÖMG:_FW:NPC2GM:PlayerNPCInterract", function(player, npc)
    local px, py, pz = GetPlayerLocation(player)
    local nx, ny, nz = GetNPCLocation(npc)
    local distance = GetDistance3D(px, py, pz, nx, ny, nz)
    print("Received query from ... "..player)
    if distance <= 150 then
        local npcGamemode = _.find(npcs, function(n) return n.npcId == npc end)
        print("Distnance ... "..distance)
        _.print(npcGamemode)
        if npcGamemode then
            OMG.GameManager.PlayerJoinGameMode(npcGamemode.gm.name, player)
        end
    end
end)

AddRemoteEvent("ÖMG:_FW:ReturnToLobby", function(player)
    Lobby.BackToLobby(player)
end)

AddEvent("OnPackageStart", function()
    Delay(2000, function()
        CallEvent("OMG:_FW:NPC2GM:SearchGamemodeNPCS")
    end)
    CreateTimer(function()
        CallEvent("OMG:_FW:NPC2GM:SearchGamemodeNPCS")
    end, 5000)
end)

