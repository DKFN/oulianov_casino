local function safeGMName()
    if OMG_DATA.Gamemode then return OMG_DATA.Gamemode else return "LOBBBY" end
end

local function wrapEvent(eventName)
    AddEvent(eventName, function(id, ...)
        CallEvent("OMG:"..safeGMName()..":"..eventName, id, ...)
    end)
end

AddEvent("OnPackageStart", function()
    wrapEvent("OnPlayerSpawn")
    wrapEvent("OnKeyPress")
    wrapEvent("OnKeyRelease")
    wrapEvent("OnRenderHUD")
    wrapEvent("OnObjectStreamIn")
    wrapEvent("OnPlayerStreamIn")
end)