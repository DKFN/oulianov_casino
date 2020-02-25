-- Onset Gaming Kommunity -- Gungame
-- Authors : DeadlyKungFu.ninja / Mr Jack / Alcayezz

OGK_GG_DEBUG = true

local weaponRefreshTimer = nil
local UIRefreshTImer = nil

function notifyServerOfCurrentWeapon()
	local equipped_slot = GetPlayerEquippedWeaponSlot()
	local weapon, ammo = GetPlayerWeapon() -- Do not put equipped slot as we swap users slot as hack
	CallRemoteEvent("OGKGG:PlayerCheckWeaponSynchro", weapon, equipped_slot)	
end

-- Watchers
local shift_delay_id
function weapon_refresher()
	weaponRefreshTimer = CreateTimer(function()
		notifyServerOfCurrentWeapon()
    end, 70)
end

function sprint_watchter()
end

function ui_refresher()
	UIRefreshTImer = CreateTimer(function()
		CallRemoteEvent("OGKGG:GetWeaponName")
	end, 1000) -- 15ms is a bit too much
end


AddEvent("OMG:OGKGG:OnPackageStart", function()
	weapon_refresher()
	ui_refresher()
	MOTDInit()
	-- EnableSnowParticles(true)	
	-- SetLandscapeSnowAlpha(1)
end)

AddEvent("OMG:OGKGG:OnPackageStop", function()
	DestroyTimer(weaponRefreshTimer)
	DestroyTimer(UIRefreshTImer)
end)
