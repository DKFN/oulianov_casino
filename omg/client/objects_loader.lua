
-- TODO: Honestly it kinda sucks, remove
local function ReplaceObject(replaceId, pakname, meshPath)
	local res = LoadPak(pakname, "/"..pakname.."/", "../../../OnsetModding/Plugins/"..pakname.."/Content")
	if not res then
		AddPlayerChat("[OBJECT LOADER] Loading of "..pakname..": "..tostring(res))
	end
	-- AddPlayerChat('<span color="#8800eeff">test</span>')
	res = ReplaceObjectModelMesh(replaceId, "/"..pakname.."/"..meshPath.."")
	-- AddPlayerChat("ReplaceObjectModelMesh: "..tostring(res))
end
AddEvent("OMG:ReplaceObject", ReplaceObject)