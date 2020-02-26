
AddRemoteEvent("CheckWeaponSynchro", function(playerid, primary, secondary)
    -- print("Checking weapon synchro for player : "..playerid)
    if Players[playerid] then
        local player = Players[playerid]
        if player.primary ~= primary then
            print("Unsync")
            SetPlayerWeapon(playerid, player.primary, 200, false, 1, true)
        end
        if player.secondary ~= secondary then
            print("Unsync")
            SetPlayerWeapon(playerid, player.secondary, 200, false, 2, true)
        end
    end
end)

AddEvent("SyncClothes", function()
    print("Synching clothes ...")
    for k, v in ipairs(OMG._.GetAllPlayers(TDM_GMID)) do
       print("Synching clothes ..."..v)
       local player = Players[v]
       if player then
           print("On Player : ".._.str(player))
           -- Notify the player of all players clothes
           for k, targetPlayer in ipairs(OMG._.GetAllPlayers(TDM_GMID)) do
               print("Reforing : ".._.str(targetPlayer))
               local tPlayer = Players[targetPlayer]
               if tPlayer then
                   print("TargetPlayer : ".._.str(tPlayer))
                   CallRemoteEvent(targetPlayer, "SetPlayerClothes", v, player.cloth)
                   CallRemoteEvent(v, "SetPlayerClothes", targetPlayer, tPlayer.cloth)
               else
                   print("TargetPlayer not in table")
               end
           end
       end
   end
end)

CreateTimer(function()
    CallEvent("SyncClothes")
end, 15000)
