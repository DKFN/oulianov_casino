local function safeGMName()
    if OMG_DATA.Gamemode then return OMG_DATA.Gamemode else return "LOBBBY" end
end
AddEvent("OnPlayerSpawn", function()
    AddPlayerChat("Received event Player spawn")
    CallEvent("OMG:"..safeGMName()..":OnPlayerSpawn")
end)

AddEvent("OnKeyPress", function(key)
    CallEvent("OMG:"..safeGMName()..":OnKeyPress", key)
end)

AddEvent("OnKeyRelease", function(key)
    CallEvent("OMG:"..safeGMName()..":OnKeyRelease", key)
end)
