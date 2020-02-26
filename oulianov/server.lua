
AddEvent("OnPackageStart", function()
    CallEvent("BlueMountainsIO:MapLoader:LoadIni", "packages/oulianov_casino/oulianov/lobby_1.ini", 0)
    CallEvent("BlueMountainsIO:MapLoader:LoadIni", "packages/oulianov_casino/oulianov/lobby_testslot.ini", 0)
end)

CreateTimer(function()
    AddPlayerChatAll('Playing on <span color="#006400ff" style="bold" size="13">Oulianov\'s Casino</> | '..GetPlayerCount()..'/'..GetMaxPlayers())
    AddPlayerChatAll('We are still in alpha, please message <span color="#f4f142ff" style="bold" size="13">DeadlyKungFu.Ninja#8294</> if you have bugs')
end, 60000 * 5)
