local loaderGUI = nil
local gmName = ""
local function OpenLoader()
    loaderGUI = CreateWebUI(0, 0, 0, 0, 9999999, 60)
	LoadWebFile(loaderGUI, "http://asset/oulianov_casino/oulianov/loaderUI/index.html")
	SetWebAlignment(loaderGUI, 0.0, 0.0)
	SetWebAnchors(loaderGUI, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(loaderGUI, WEB_VISIBLE)
end

AddRemoteEvent("OMG:PLAYER_LOAD_GAMEMODE", function(name)
    OpenLoader()
    gmName = name
end)

AddRemoteEvent("OMG:PLAYER_LOAD_DONE", function()
    if loaderGUI then
        DestroyWebUI(loaderGUI)
        loaderGUI = nil
    end
end)

AddEvent("OnWebLoadComplete", function(web)
    if web == loaderGUI then
        ExecuteWebJS(loaderGUI, 'SetGamemodeName("'..gmName..'")')
    end
end)

