
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
                npcs[gm.id].textId = CreateText3D(gm.params.fullName, 20, npcParams.pos.x, npcParams.pos.y, npcParams.pos.z + 100, 0, 0, 0)          
                npcs[gm.id].markerId = CreateObject(2, npcParams.pos.x, npcParams.pos.y, npcParams.pos.z - 100)
                SetObjectAttached(npcs[gm.id].markerId, ATTACH_NPC, npcs[gm.id].npcId, 0, 0, - 70)
                
                
            else
                -- Just refresh playercount or something
            end
        end
    end)
end
AddEvent("OMG:_FW:NPC2GM:SearchGamemodeNPCS", SearchGamemodeNPCS)

AddEvent("OnPackageStart", function()
    Delay(2000, function()
        CallEvent("OMG:_FW:NPC2GM:SearchGamemodeNPCS")
    end)
    CreateCountTimer(function()
        CallEvent("OMG:_FW:NPC2GM:SearchGamemodeNPCS")
    end, 5000, 100)
end)

