AddEvent("OnPlayerSpawn", function()
    AddPlayerChat("Received event Player spawn")
    CallEvent("OMG:"..OMG_DATA.Gamemode..":OnPlayerSpawn")
end)

AddEvent("OnKeyPress", function(key)
    AddPlayerChat("Key "..key.." for "..OMG_DATA.Gamemode)
    CallEvent("OMG:"..OMG_DATA.Gamemode..":OnKeyPress", key)
end)

AddEvent("OnKeyRelease", function(key)
    AddPlayerChat("Key "..key.." for "..OMG_DATA.Gamemode)
    CallEvent("OMG:"..OMG_DATA.Gamemode..":OnKeyRelease", key)
end)
