
local playerPosTimer = nil

AddEvent("OnNPCStreamIn", function(npc, player)
    local clothId = GetNPCPropertyValue(npc, "clothId")
    if clothId then
        SetNPCClothingPreset(npc, clothId)
    end
end)

AddEvent("OMG:LOBBY:StartTimers", function()
    playerPosTimer = CreateTimer(function()
        local px, py, pz = GetPlayerLocation()
        
        for k, v in ipairs(GetStreamedNPC()) do
            local nx, ny, nz = GetNPCLocation(v)
            local distance = GetDistance3D(nx, ny, nz, px, py, pz)
            if distance <= 100 then
                SetNPCOutline(v, true)
            else
                SetNPCOutline(v, false)
            end
        end
    end, 500)
end)


AddEvent("OMG:LOBBY:StopTimers", function()
    DestroyTimer(playerPosTimer)
    playerPosTimer = nil
end)

