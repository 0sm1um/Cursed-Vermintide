local mod = get_mod("Cursed Vermintide")

local num_stacks = 3
local stacks_power = 0.1
local num_high_tally_stacks = 4

local skull_splitter_buff = 0.15

-- Trophy Hunter Power Buff
mod:modify_talent_buff_template("dwarf_ranger", "bardin_slayer_passive_stacking_damage_buff_on_hit", {
max_stacks = num_stacks
})

mod:modify_talent_buff_template("dwarf_ranger", "bardin_slayer_passive_stacking_damage_buff", {
stat_buff = "power_level",
multiplier = stacks_power,
max_stacks = num_stacks,
duration = 2
})

--[[
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		attacker_power_level_offset = 0.25,
		damage_profile = "slayer_leap_landing",
		ignore_attacker_unit = true,
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 4,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.radius = 6
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.max_damage_radius = 3
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.damage_profile = "slayer_leap_landing_impact"
--]]

------------------
-- Level 05 Row --
------------------

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
mod:add_talent_buff_template("dwarf_ranger", "bardin_slayer_reaper", {
    multiplier = -0.05,
    name = "reaper",
    buff_func = "heal_damage_targets_on_melee",
    event = "on_player_damage_dealt",
    max_targets = 5,
    bonus = 0.25,
    perks = {
        buff_perks.linesman_healing
    }
})

mod:modify_talent("dr_slayer", 1, 1, {
	description = "strong_reaper_desc",
	buffs = {"bardin_slayer_reaper"}
})

mod:add_talent_buff_template("dwarf_ranger", "bardin_slayer_bloodlust", {
	name = "bloodlust",
    multiplier = 0.45,
    heal_cap = 0.25,
    buff_func = "strong_heal_percentage_of_enemy_hp_on_melee_kill",
    event = "on_kill",
    perks = {
        buff_perks.smiter_healing
    }
})
mod:modify_talent("dr_slayer", 1, 2, {
	buffs = {"bardin_slayer_bloodlust"}
})


-- High Tally

mod:modify_talent_buff_template("dwarf_ranger", "bardin_slayer_passive_increased_max_stacks", {
    max_stacks = num_high_tally_stacks,
    multiplier = stacks_power,
    duration = 2,
    stat_buff = "power_level"
})
mod:add_text("bardin_slayer_passive_increased_max_stacks_desc", "Increases maximum stacks of Trophy Hunter by 1.")

-- Grimnir's Focus
mod:modify_talent_buff_template("dwarf_ranger", "bardin_slayer_damage_reduction_on_melee_charge_action_buff", {
multiplier = -0.3
})
mod:modify_talent("dr_slayer", 5, 2, {
description_values = {
    {
        value_type = "percent",
        value = -0.3
    },
    {
        value = 5
    }
}
})

-- Passive Text
--table.insert(PassiveAbilitySettings.dr_2.buffs, "gs_bardin_slayer_increased_defence")


mod:add_text("career_passive_desc_dr_2a_2", "Hitting an enemy grants a stacking power buff. Increased power by 10%, stacking 3 times. Buff lasts 2 seconds.")
--mod:add_text("career_passive_name_dr_2b", "Trophy Hunter")
--mod:add_text("career_passive_desc_dr_2b_2", "Hitting an enemy grants a stacking power buff. Increased power by 7.5%, stacking 3 times. Buff lasts 2 seconds.")
--]]


--[[
-- Juggernaut Passive
mod:add_talent_buff_template("dwarf_ranger", "gs_bardin_slayer_increased_defence", {
stat_buff = "damage_taken",
multiplier = -0
})

mod:add_text("rebaltourn_career_passive_name_dr_2d", "Juggernaut")
mod:add_text("rebaltourn_career_passive_desc_dr_2d_2", "Reduces damage taken by 10%.")
--]]
