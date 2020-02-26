local function safeGMName()
    if OMG_DATA.Gamemode then return OMG_DATA.Gamemode else return "LOBBBY" end
end

local function wrapPlayerEvent(eventName)
    AddEvent(eventName, function(id, ...)
        CallEvent("OMG:"..safeGMName()..":"..eventName, id, ...)
    end)
end

AddEvent("OnPackageStart", function()
    wrapPlayerEvent("OnPlayerSpawn")
    wrapPlayerEvent("OnKeyPress")
    wrapPlayerEvent("OnKeyRelease")
end)