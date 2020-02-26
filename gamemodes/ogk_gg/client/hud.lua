-- Onset Gaming Kommunity -- Gungame
-- Authors : DeadlyKungFu.ninja / Mr Jack / Alcayezz / Alcayezz

function HUDInit() 
    hud = CreateWebUI(0.0, 0.0, 0.0, 0.0, 5, 24)
	LoadWebFile(hud, "http://asset/oulianov_casino/gamemodes/ogk_gg/gui/ui.html")
	SetWebAlignment(hud, 0.0, 0.0)
	SetWebAnchors(hud, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(hud, WEB_VISIBLE)
end

local function AddFrag(killer, weapon, victim)
	local jsweapon
	if weapon then
		jsweapon = weapon
	else
		jsweapon = '0'
	end
	ExecuteWebJS(hud, "killfeed.registerKill('"..killer.."', '"..victim.."','"..jsweapon.."')")
end
AddRemoteEvent("OGKGG:AddFrag", AddFrag) 

local function PlayerChangeLevel(newLevel)
	if hud then
		ExecuteWebJS(hud, "ChangePlayerLevel('"..newLevel.."')")	
	end
end
AddRemoteEvent("OGKGG:PlayerChangeLevel", PlayerChangeLevel)

AddRemoteEvent("WarnDesynchro", function()
	ExecuteWebJS(hud, "Warn('<span style=\"color:orange\">[LEVEL UP]</span>')")
end)

AddRemoteEvent("OGKGG:GameRestarting", function()
	ExecuteWebJS(hud, "Warn('<span style=\"color:orange\">[WARNING]</span> GAME STARTING')")
	SetWebVisibility(hud, WEB_VISIBLE)
	SetWebVisibility(leaderboard, WEB_VISIBLE)
end)

local function SetUIData(weapon_name, weapon_next, current_map)
	local ply_health = GetPlayerHealth()
	local weapon, ammo, inmag = GetPlayerWeapon()
	local armor = GetPlayerArmor()	
	if hud then
		ExecuteWebJS(hud, "RefreshPlayerBar("..ply_health..","..inmag.. ",'" .. weapon_name .. "','" .. weapon_next .. "','" .. current_map .. "'," .. armor .. ")")
	end
end
AddRemoteEvent("OGKGG:SetUIData", SetUIData)

AddEvent("OnWebLoadComplete", function(web)
	if web == hud then	
		ExecuteWebJS(hud, "DisplayHit('left')")
		ExecuteWebJS(hud, "DisplayHit('right')")
		ExecuteWebJS(hud, "DisplayHit('front')")
		ExecuteWebJS(hud, "DisplayHit('back')")
	end
end)

AddEvent("OMG:OGKGG:OnPackageStop", function()
    if hud then
        DestroyWebUI(hud)
        hud = nil
    end
end)
