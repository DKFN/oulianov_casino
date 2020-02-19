-- Bootstrap code to cerate the gamemode container
local gmId
AddEvent("OnPackageStart", function()
    if not OMG then
        print("OMG IS NOT SETUP CORRECTLY")
        print("GAMEMODE WILL NOT WORK")
    end
    gmId = OMG.GameManager.Register("TEST", { author = "test", fullName = "Super gm of crazyness test" })
end)

AddEvent("OMG:TEST:OnPackageStart", function(data)
    print("Confirmed registration with : "..data)
    print("Say hello, this is the first event from the framework !!")
end)

AddEvent("OMG:TEST:OnPlayerJoin", function(player)
    print("Player joined gamemode : "..player)
    SetPlayerHealth(player, 0)
    SetPlayerSpawnLocation(player, -79294.234375, -165837.1875, 3313.8293457031, 0)
end)

AddEvent("OMG:TEST:OnPlayerDeath", function(victim, instigator)
    AddPlayerChat(victim, "LOL U DED BY "..instigator)
end)

AddEvent("OMG:TEST:OnPlayerWeaponShot", function(player, wpn)
    print(OMG._.GetAllPlayers(gmId))
    AddPlayerChat(player, "U MAD ??? "..GetPlayerName(player).. " WHY U SHOOT ??")
end)

AddEvent("OMG:TEST:OnPlayerSpawn", function(player)
    print("Received spawn"..player)
    SetPlayerWeapon(player, 5, 500, true, 1, true)
end)


CreateTimer(function()
    print("[TEST GM] Searching all players inside gamemode")
    for k, v in ipairs(OMG._.GetAllPlayers(gmId)) do
        print(v)
    end
end, 1000)
