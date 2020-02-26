
menuGui = nil
function CreateGUI()
    menuGui = CreateWebUI(0, 0, 0, 0, 1, 60)
	LoadWebFile(menuGui, "http://asset/oulianov_casino/gamemodes/ogk_tdm/gui/build/index.html")
	SetWebAlignment(menuGui, 0.0, 0.0)
	SetWebAnchors(menuGui, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(menuGui, WEB_HITINVISIBLE)
end

AddEvent("OMG:OGKTDM:OnPackageStart", function()
	CreateGUI()
end)

AddRemoteEvent("OGKTDM:CloseWeaponMenu", function()
	--print("Closing weapon menu")
	weaponMenuStep = 0
	ExecuteWebJS(menuGui, "closePlayerWeapon()")
end)


AddRemoteEvent("OGKTDM:OpenWeaponMenu", function()
	weaponMenuStep = 1
	ExecuteWebJS(menuGui, "openPlayerWeapon()")
end)

AddRemoteEvent("OGKTDM:NotifyGameState", function(data)
	--AddPlayerChat("Game state: "..data)
	if menuGui then
		ExecuteWebJS(menuGui, "setGameState('"..data.."');")
	end
end)

AddRemoteEvent("OGKTDM:SetWinState", function(winState)
	ExecuteWebJS(menuGui, "setWinState('"..winState.."');")
end)

AddEvent("OMG:OGKTDM:OnPackageStop", function()
	DestroyWebUI(menuGui)
end)


CreateTimer(function()
	local weapon, total, inmag = GetPlayerWeapon()
	local health = GetPlayerHealth()
	if menuGui then
		ExecuteWebJS(menuGui, "updatePlayerHud('"..json.stringify({weapon = weapon, ammo = inmag, health = health}).."');")
	end
end, 50)
