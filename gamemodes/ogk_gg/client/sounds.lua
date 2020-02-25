-- Onset Gaming Kommunity -- Gungame
-- Authors : DeadlyKungFu.ninja / Mr Jack / Alcayezz
AddRemoteEvent("OGKGG:PlayLevelUp", function()
    local sound = CreateSound("gamemodes/ogk_gg/sounds/smb/smb_powerup.wav")
    SetSoundVolume(sound, 0.3)
    if sound == false then
        AddPlayerChat("Error playing sound")
    end    
end)

AddRemoteEvent("OGKGG:PlayPickupSound", function()
    local sound = CreateSound("gamemodes/ogk_gg/sounds/smb/smb_1-up.wav")
    SetSoundVolume(sound, 0.3)
    if sound == false then
        AddPlayerChat("Error playing sound")
    end    
end)

AddRemoteEvent("OGKGG:PlayerIsWinner", function()
    local sound = CreateSound("gamemodes/ogk_gg/sounds/smb/smb_stage_clear.wav")
    SetSoundVolume(sound, 0.3)
end)

AddRemoteEvent("OGKGG:PlayerIsLooser", function()
    local sound = CreateSound("gamemodes/ogk_gg/sounds/smb/smb_gameover.wav")
    SetSoundVolume(sound, 0.3)
end)

AddRemoteEvent("OGKGG:GameRestarting", function()
    local sound = CreateSound("gamemodes/ogk_gg/sounds/quake/prepare.wav")
    SetSoundVolume(sound, 0.3)
end)

local hsInstance
AddRemoteEvent("TrueDmgHeadShot", function()
    if hsInstance then
        DestroySound(hsInstance)
    end 
    hsInstance = CreateSound("gamemodes/ogk_gg/sounds/quake/headshot.wav")
    SetSoundVolume(hsInstance, 0.3)
end)
