
local playerPosTimer = nil
local playerInLobby = true
local loadStuckWatcher = nil

AddEvent("OnNPCStreamIn", function(npc, player)
    local clothId = GetNPCPropertyValue(npc, "clothId")
    if clothId then
        SetNPCClothingPreset(npc, clothId)
    end
end)

AddEvent("OMG:LOBBY:StartTimers", function()
    playerInLobby = true
    playerPosTimer = CreateTimer(function()
        local px, py, pz = GetPlayerLocation()
        
        for k, v in ipairs(GetStreamedNPC()) do
            local nx, ny, nz = GetNPCLocation(v)
            local distance = GetDistance3D(nx, ny, nz, px, py, pz)
            if distance <= 150 then
                SetNPCOutline(v, true)
            else
                SetNPCOutline(v, false)
            end
        end
    end, 500)
end)

AddEvent("OnKeyPress", function(key)
    if key == "E" and playerInLobby then
        local px, py, pz = GetPlayerLocation()
        local nearestNpc = _.filter(GetStreamedNPC(), function(npc)
            local nx, ny, nz = GetNPCLocation(npc)
            return GetDistance3D(nx, ny, nz, px, py, pz) <= 150
        end)
        if nearestNpc[1] then
            CallRemoteEvent("ÖMG:_FW:NPC2GM:PlayerNPCInterract", nearestNpc[1])
        end
    end

    if key == "F4" and not playerInLLobby then
        CallRemoteEvent("ÖMG:_FW:ReturnToLobby", OMG_DATA.Gamemode)
    end
end)

AddEvent("OMG:LOBBY:StopTimers", function()
    playerInLobby = false
    DestroyTimer(playerPosTimer)
    playerPosTimer = nil
end)

