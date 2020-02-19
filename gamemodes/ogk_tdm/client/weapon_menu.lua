weaponMenuStep = 0 -- On spawn it is the default menu

AddEvent("OMG:OGKTDM:OnPlayerSpawn", function(playerid)
    weaponMenuStep = 1
end)


function closeMenu()
    ExecuteWebJS(menuGui, "closePlayerWeapon()")
    weaponMenuStep = 0
end

AddEvent("OnKeyPress", function(key)
    -- AddPlayerChat(weaponMenuStep)
    -- AddPlayerChat(key)
    if weaponMenuStep == 2 then
        if key == "1" or key == "Ampersand" then
            CallRemoteEvent("OGKTDM:GivePlayerWeapon", 3, 2)
            closeMenu()
        elseif key == "2" or key == "é" then
            CallRemoteEvent("OGKTDM:GivePlayerWeapon", 4, 2)
            closeMenu()
        elseif key == "3" or key == "Quote" then
            CallRemoteEvent("OGKTDM:GivePlayerWeapon", 2, 2)
            closeMenu()
        elseif key == "4" or key == "Apostrophe" then
            weaponMenuStep = 2
            CallRemoteEvent("OGKTDM:GivePlayerWeapon", 4, 2)
        end
    elseif weaponMenuStep == 1 then
        if key == "1" or key == "Ampersand" then
            weaponMenuStep = 2
            CallRemoteEvent("OGKTDM:GivePlayerWeapon", 12, 1)
        elseif key == "2" or key == "é" then
            weaponMenuStep = 2
            CallRemoteEvent("OGKTDM:GivePlayerWeapon", 11, 1)
        elseif key == "3" or key == "Quote" then
            weaponMenuStep = 2
            CallRemoteEvent("OGKTDM:GivePlayerWeapon", 20, 1)
        elseif key == "4" or key == "Apostrophe" then
            weaponMenuStep = 2
            CallRemoteEvent("OGKTDM:GivePlayerWeapon", 8, 1)
        end
    end
    if key == "F1" then
        if weaponMenuStep == 0 then
            weaponMenuStep = 1
            ExecuteWebJS(menuGui, "openPlayerWeapon()")
        else
            weaponMenuStep = 0
            ExecuteWebJS(menuGui, "closePlayerWeapon()")
        end
	end
    ExecuteWebJS(menuGui, "setWeaponStep('"..weaponMenuStep.."')")
end)
