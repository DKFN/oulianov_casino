AddEvent("OnPackageStart", function()
    CreateTimer(function()
        --AddPlayerChat("Checking synchro")
        local primary = GetPlayerWeapon(1)
        local secondary = GetPlayerWeapon(2)
        CallRemoteEvent("CheckWeaponSynchro", primary, secondary)
    end, 560)        
end)

AddRemoteEvent("SetPlayerClothes", function(playerID, clothId)
    SetPlayerClothingPreset(playerID, clothId)
end)

