local function ReplaceObject(replaceId, pakname, meshPath)
	local res = LoadPak(pakname, "/"..pakname.."/", "../../../OnsetModding/Plugins/"..pakname.."/Content")
	AddPlayerChat("Loading of "..pakname..": "..tostring(res))

	res = ReplaceObjectModelMesh(replaceId, "/"..pakname.."/"..meshPath.."")
	AddPlayerChat("ReplaceObjectModelMesh: "..tostring(res))
end

AddEvent("OnPackageStart", function()
    ReplaceObject(40, "windowstdm", "vitrecote")
    ReplaceObject(46, "pcscreentwo", "ecranpcpol")
    ReplaceObject(47, "pcscreenthree", "ecranpcwri")
    ReplaceObject(30, "pcscreensix", "ecranpcbro")
    ReplaceObject(45, "pcscreenone", "ecranpc")
    ReplaceObject(48, "pcscreenfour", "ecranpcems")
    ReplaceObject(49, "pcscreenfive", "ecranpcmec")
    ReplaceObject(44, "officelamp", "lampe")
    ReplaceObject(41, "murtwotdm", "mur2")
    ReplaceObject(42, "fauxplafondtdm", "fauxplafond")
    ReplaceObject(43, "carpettdm", "carpet")
end)