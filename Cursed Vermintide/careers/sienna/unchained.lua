local mod = get_mod("Cursed Vermintide")

table.insert(PassiveAbilitySettings.bw_3.buffs, "sienna_unchained_health_to_ult")
PassiveAbilitySettings.bw_3.perks = {
    {
        display_name = "career_passive_name_bw_3b",
        description = "career_passive_desc_bw_3b"
    },
    {
        display_name = "career_passive_name_bw_3c",
        description = "career_passive_desc_bw_3c_2"
    },
    {
        display_name = "career_passive_name_bw_3d",
        description = "career_passive_desc_bw_3d_2"
    }
}
mod:add_text("career_passive_name_bw_3d", "Reckless")
mod:add_text("career_passive_desc_bw_3d_2", "When Sienna overcharges she starts, 4 times per second, exchanging 1/20th of her health for 3.33% ability cooldown.")

local health_mod_passive_abandon = 3
local health_mod_abandon = 0.75

-- See Stagger THP Hooks for UC DR Ult interaction

------------------
-- Level 05 Row --
------------------

-- Vanguard
--[[
mod:modify_talent("bw_unchained", 1, 1, {
	description = "vanguard_desc"
})
mod:modify_talent_buff_template("bright_wizard", "sienna_unchained_vanguard", {
    bonus = thp_on_headshot_or_crit
})
--]]
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

-- Reaper
--[[
mod:modify_talent("bw_unchained", 1, 2, {
	description = "strong_reaper_desc"
})

mod:add_talent_buff_template("bright_wizard", "strong_reaper_desc", {
    multiplier = -0.05,
    name = "reaper",
    max_targets = 5,
    buff_func = "strong_heal_damage_targets_on_melee",
    event = "on_player_damage_dealt",
    bonus = 0.25,
    perk = buff_perks.linesman_healing
})
--]]
--[[
    	sienna_unchained_health_to_ult = {
		buffs = {
			{
				buff_to_add = "sienna_unchained_health_to_cooldown_buff",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks",
				chunk_size = 40,
				max_stacks = 1
			}
		}
	},
	sienna_unchained_health_to_cooldown_buff = {
		buffs = {
			{
				update_func = "sienna_unchained_health_to_cooldown_update",
				icon = "sienna_unchained_attack_speed_on_high_overcharge",
				frequency = 0.5
			}
		}
	},
    --]]

mod:modify_talent("bw_unchained", 5, 2, {
    buffs = {}
})

BuffFunctionTemplates.functions.sienna_unchained_health_to_cooldown_update = function (unit, buff, params)
    local t = params.t
    local frequency = 0.25

    if not buff.timer or buff.timer <= t then
        buff.timer = t + frequency
        local career_extension = ScriptUnit.has_extension(unit, "career_system")
        local talent_extension = ScriptUnit.extension(unit, "talent_system")

        if talent_extension:has_talent("sienna_unchained_health_to_ult") then
            if career_extension and career_extension:current_ability_cooldown_percentage() > 0 then
                career_extension:reduce_activated_ability_cooldown_percent(0.1)

                local health_extension = ScriptUnit.has_extension(unit, "health_system")
                local damage = health_extension:get_max_health() / 20 * health_mod_abandon

                DamageUtils.add_damage_network(unit, unit, damage, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, unit)
            end
        else
            if career_extension and career_extension:current_ability_cooldown_percentage() > 0 then
                career_extension:reduce_activated_ability_cooldown_percent(0.1)

                local health_extension = ScriptUnit.has_extension(unit, "health_system")
                local damage = health_extension:get_max_health() / 20 * health_mod_passive_abandon

                DamageUtils.add_damage_network(unit, unit, damage, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, unit)
            end
        end
    end
end

mod:modify_talent("bw_unchained", 4, 2, {
	buffs = {
        "sienna_unchained_increased_vent_speed"
    }
})

mod:add_text("sienna_unchained_increased_vent_speed_desc_2", "Increases rate of venting overcharge by 30.0%%.")

