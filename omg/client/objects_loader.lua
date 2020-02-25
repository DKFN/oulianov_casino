local function ReplaceObject(replaceId, pakname, meshPath)
	local res = LoadPak(pakname, "/"..pakname.."/", "../../../OnsetModding/Plugins/"..pakname.."/Content")
	AddPlayerChat("Loading of "..pakname..": "..tostring(res))

	res = ReplaceObjectModelMesh(replaceId, "/"..pakname.."/"..meshPath.."")
	AddPlayerChat("ReplaceObjectModelMesh: "..tostring(res))
end

AddEvent("OMG:ReplaceObject", ReplaceObject)