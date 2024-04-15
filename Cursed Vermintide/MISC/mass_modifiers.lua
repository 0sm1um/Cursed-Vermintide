local mod = get_mod("Vermintide Balance Manager")

LINESMAN_HIT_MASS_COUNT = {
	chaos_raider = 0.4, -- 0.6
	skaven_plague_monk = 0.4, -- 0.6
	beastmen_gor = 0.4, -- 0.6
	beastmen_ungor = 0.4, -- 0.6
	chaos_berzerker = 0.4, -- 0.6
	skaven_clan_rat_with_shield = 0.4, -- 0.6
	chaos_marauder_with_shield = 0.4, -- 0.6
	chaos_fanatic = 0.4, -- 0.6
	skaven_slave = 0.4, -- 0.6
	skaven_clan_rat = 0.4, -- 0.6
	chaos_marauder = 0.4 -- 0.6
}

HEAVY_LINESMAN_HIT_MASS_COUNT = {
	skaven_ratling_gunner = 0.5, -- 0.5
	chaos_raider = 0.4, -- 0.6
	skaven_clan_rat_with_shield = 0.4, -- 0.6
	beastmen_bestigor = 0.4, -- 0.6
	chaos_berzerker = 0.4, -- 0.6
	skaven_warpfire_thrower = 0.5,
	skaven_plague_monk = 0.4, -- 0.6
	chaos_marauder_with_shield = 0.4, -- 0.6
	chaos_fanatic = 0.4, -- 0.6
	skaven_slave = 0.4, -- 0.6
	skaven_clan_rat = 0.4, -- 0.6
	beastmen_ungor = 0.4, -- 0.6
	chaos_warrior = 0.5,
	skaven_storm_vermin_commander = 0.5,
	skaven_storm_vermin = 0.5,
	beastmen_gor = 0.4, -- 0.6
	chaos_marauder = 0.4 -- 0.6
}

TANK_HIT_MASS_COUNT = {
	skaven_storm_vermin_with_shield = 0.5, -- 0.5
	chaos_raider = 0.3, -- 0.5
	beastmen_gor = 0.3, -- 0.5
	chaos_warrior = 10,
	chaos_berzerker = 1, -- 0.5
	skaven_clan_rat_with_shield = 0.3, -- 0.5
	beastmen_ungor = 0.55, -- 0.75
	beastmen_bestigor = 0.3, -- 0.5
	chaos_marauder_with_shield = 0.3, -- 0.5
	chaos_fanatic = 0.55, -- 0.75
	skaven_slave = 0.55, -- 0.75
	skaven_storm_vermin_commander = 0.5, -- 0.5
	skaven_storm_vermin = 0.5, -- 0.5
	skaven_plague_monk = 1,
	skaven_clan_rat = 0.3, -- 0.5
	chaos_marauder = 0.3 -- 0.5
}

SHOTGUN_HIT_MASS_COUNT = {
	chaos_raider = 0.6, -- 0.6
	skaven_plague_monk = 0.6, -- 0.6
	beastmen_gor = 0.6, -- 0.6
	beastmen_ungor = 0.6, -- 0.6
	chaos_berzerker = 0.6, -- 0.6
	skaven_clan_rat_with_shield = 0.6, -- 0.6
	chaos_marauder_with_shield = 0.6, -- 0.6
	chaos_fanatic = 0.6, -- 0.6
	skaven_slave = 0.6, -- 0.6
	skaven_clan_rat = 0.6, -- 0.6
	chaos_marauder = 0.6 -- 0.6
}

local list_of_shotguns = {
	"blunderbuss_template_1",
	"grudge_raker_template_1",
	"repeating_pistol_template_1",
	"victor_bountyhunter_career_skill_weapon",
	"wh_deus_01_template_1",
}

--mod:echo("About to apply mass modifiers")
for item_template_name, item_template in pairs(Weapons) do
	--mod:echo("In the loop, doing item name:")
	--mod:echo(tostring(item_template_name))
	local actions = item_template.actions
	for action_name, sub_actions in pairs(actions) do
		--mod:echo("Iterating through action names.")
		--mod:echo(tostring(action_name))
		if action_name == "action_one" then
			for a1_action_names, a1_actions in pairs(sub_actions) do -- These are the possible things "action one" can do
				if a1_actions.hit_mass_count ~= nil then
					--mod:echo("Mass Modifier detected.")
					--mod:echo(tostring(a1_actions.hit_mass_count))
					-- If its heavy linesman
					local length = 0
					for _,i in pairs(a1_actions.hit_mass_count) do
						length = length + 1
					end
					if length == 17 then  -- It must be heavy linesman
						a1_actions.hit_mass_count = HEAVY_LINESMAN_HIT_MASS_COUNT
						--mod:echo("Mass Modifier Replaced")
					elseif length == 15 then -- It must be Tank
						a1_actions.hit_mass_count = TANK_HIT_MASS_COUNT
						--mod:echo("Mass Modifier Replaced")
					elseif length == 11 then -- It must be linesman, but an additional check is needed to see if it is a shotgun.
						a1_actions.hit_mass_count = LINESMAN_HIT_MASS_COUNT
						--mod:echo("Mass Modifier Replaced")
						for _, shotguns in pairs(list_of_shotguns) do
							--mod:echo(_)
							--mod:echo(shotguns)
							--mod:echo(item_template_name)
							--mod:echo(tostring(item_template_name))
							if item_template_name == shotguns then
								a1_actions.hit_mass_count = SHOTGUN_HIT_MASS_COUNT
								--mod:echo("Mass Modifier Replaced (Again)")
							end
						end
					end
				end
			end
		end
	end
end
