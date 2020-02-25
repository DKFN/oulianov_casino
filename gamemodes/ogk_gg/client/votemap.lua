-- Onset Gaming Kommunity -- Gungame
-- Authors : DeadlyKungFu.ninja / Mr Jack / Alcayezz

function InitVotemap()
    votemap = CreateWebUI(0.0, 0.0, 0.0, 0.0, 5, 24)
	LoadWebFile(votemap, "http://asset/oulianov_casino/gamemodes/ogk_gg/gui/votemap.html")
	SetWebAlignment(votemap, 0.0, 0.0)
	SetWebAnchors(votemap, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(votemap, WEB_VISIBLE)
end

AddRemoteEvent("OGKGG:InitVotemap", function()
    SetWebVisibility(scoreboard, WEB_HIDDEN)
    InitVotemap()
    CallRemoteEvent("OGKGG:GetVotemapChoices")
    SetInputMode(INPUT_UI)
end)

AddRemoteEvent("OGKGG:SendVotemapChoices", function(data)
    Delay(1000, function()
        ExecuteWebJS(votemap, "ReceiveVotemapData('"..data.."')")
    end)
end)

AddRemoteEvent("OGKGG:VotemapVotesStatus", function(status)
    if votemap then
        ExecuteWebJS(votemap, "ReceiveVotesData('"..status.."')")
    end
end)

AddEvent("VoteForMap", function(mapChoice)
    AddPlayerChat(mapChoice)
    CallRemoteEvent("OGKGG:VotemapRegisterVote", mapChoice)
end)

AddRemoteEvent("OGKGG:VotemapStopVoteMap", function()
    SetWebVisibility(votemap, WEB_HIDDEN)
    DestroyWebUI(votemap)
    votemap = nil
    SetInputMode(INPUT_GAME)
end)

AddEvent("OMG:OGKGG:OnPackageStop", function()
    if votemap then
        DestroyWebUI(votemap)
        votemap = nil
    end
end)
