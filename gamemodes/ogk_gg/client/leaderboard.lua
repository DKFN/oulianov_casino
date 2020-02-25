-- Onset Gaming Kommunity -- Gungame
-- Authors : DeadlyKungFu.ninja / Mr Jack / Alcayezz

-- Ingame Leaderboard
function GameLeaderboardInit() 
    leaderboard = CreateWebUI(0.0, 0.0, 0.0, 0.0, 5, 3)
	LoadWebFile(leaderboard, "http://asset/oulianov_casino/gamemodes/ogk_gg/gui/hud_leaderboard.html")
	SetWebAlignment(leaderboard, 0.0, 0.0)
	SetWebAnchors(leaderboard, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(leaderboard, WEB_VISIBLE)
end

AddEvent("OMG:OGKGG:OnPackageStop", function()
	DestroyWebUI(leaderboard)
	leaderboard = nil
end)

AddRemoteEvent("OGKGG:LeaderboardReceivePlayerStats", function(playerid, data)
    ExecuteWebJS(leaderboard, "LeaderBoardReceiveData("..playerid..", '"..data.."')");
end)


AddRemoteEvent("OGKGG:LeaderboardReceivePlayerAvatar", function(playerid, image)
    ExecuteWebJS(leaderboard, "LeaderBoardReceiveAvatar("..playerid..", '"..image.."')");
end)

AddRemoteEvent("OGKGG:PlayerQuit", function(playerid)
    ExecuteWebJS(leaderboard, "LeaderBoardClearData("..playerid..")");
end)