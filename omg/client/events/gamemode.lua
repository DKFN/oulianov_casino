local function safeGMName()
    if OMG_DATA.Gamemode then return OMG_DATA.Gamemode else return "LOBBBY" end
end

local function wrapEvent(eventName)
    AddEvent(eventName, function(id, ...)
        CallEvent("OMG:"..safeGMName()..":"..eventName, id, ...)
    end)
end

AddEvent("OnPackageStart", function()

    -- Collision
    wrapEvent("OnCollisionEnter")
    wrapEvent("OnCollisionLeave")

    -- Game 
    -- OnGameTick is not wrapped for performance issue
    wrapEvent("OnSteamOverlayActivated")
    wrapEvent("OnRenderHUD")
    wrapEvent("OnShowMainMenu")
    wrapEvent("OnHideMainMenu")

    -- Player
    wrapEvent("OnPlayWeaponHitEffects")
    wrapEvent("OnPlayerStreamIn")
    wrapEvent("OnPlayerStreamOut")
    wrapEvent("OnPlayerSwitchCamera")
    wrapEvent("OnPlayerEnterWater")
    wrapEvent("OnPlayerLeaveWater")
    wrapEvent("OnPlayerDeath")
    wrapEvent("OnPlayerChatCommand")
    wrapEvent("OnPlayerChat")
    wrapEvent("OnPlayerSpawn")
    wrapEvent("OnPlayerCrouch")
    wrapEvent("OnPlayerEndCrouch")
    wrapEvent("OnPlayerEndFall")
    wrapEvent("OnPlayerFall")
    wrapEvent("OnPlayerTalking")

    -- Weapon
    wrapEvent("OnPlayerWeaponShot")
    wrapEvent("OnPlayerReloaded")

    -- Parachute
    wrapEvent("OnPlayerParachuteLand")
    wrapEvent("OnPlayerSkydiveCrash")
    wrapEvent("OnPlayerCancelSkydive")
    wrapEvent("OnPlayerSkydive")
    wrapEvent("OnPlayerParachuteOpen")
    wrapEvent("OnPlayerParachuteClose")

    -- Key 
    wrapEvent("OnKeyPress")
    wrapEvent("OnKeyRelease")

    -- NPC
    wrapEvent("OnNPCStreamIn")
    wrapEvent("OnNPCStreamOut")

    -- Object
    wrapEvent("OnObjectStreamIn")
    wrapEvent("OnObjectStreamOut")
    wrapEvent("OnObjectHit")
    wrapEvent("OnPlayerEndEditObject")
    wrapEvent("OnPlayerBeginEditObject")

    -- Packages
    -- Start and Stop is managed by the GM Manager
    wrapEvent("OnScriptError")

    -- Pickup
    wrapEvent("OnPickupStreamIn")
    wrapEvent("OnPickupStreamOut")

    -- Text3D
    wrapEvent("OnText3DStreamIn")

    -- Vehicle 
    wrapEvent("OnPlayerStartEnterVehicle")
    wrapEvent("OnPlayerStartExitVehicle")
    wrapEvent("OnPlayerEnterVehicle")
    wrapEvent("OnPlayerLeaveVehicle")

    -- WebUI
    wrapEvent("OnWebLoadComplete")

    -- Sound
    wrapEvent("OnSoundUpdateMeta")
    wrapEvent("OnSoundFinished")

    -- Network
    wrapEvent("OnObjectNetworkUpdatePropertyValue")
    wrapEvent("OnPlayerNetworkUpdatePropertyValue")
    wrapEvent("OnVehicleNetworkUpdatePropertyValue")
    wrapEvent("OnNPCNetworkUpdatePropertyValue")
    wrapEvent("OnText3DNetworkUpdatePropertyValue")
    wrapEvent("OnPickupNetworkUpdatePropertyValue")
    
end)