local mod = get_mod("Vermintide Balance Manager")

Weapons.bw_deus_01_template_1.actions.action_one.default.allowed_chain_actions[1].start_time = 0.6
Weapons.bw_deus_01_template_1.actions.action_one.default.allowed_chain_actions[1].start_time = 0.5
Weapons.bw_deus_01_template_1.actions.action_one.default.total_time = 0.65
Weapons.bw_deus_01_template_1.actions.action_one.default.shot_count = 15
DamageProfileTemplates.staff_magma.default_target.power_distribution_near.attack = 0.12
DamageProfileTemplates.staff_magma.default_target.power_distribution_far.attack = 0.06
PlayerUnitStatusSettings.overcharge_values.magma_basic = 4
ExplosionTemplates.magma.aoe.duration = 3
ExplosionTemplates.magma.aoe.damage_interval = 1
PlayerUnitStatusSettings.overcharge_values.magma_charged_2 = 10
PlayerUnitStatusSettings.overcharge_values.magma_charged = 14
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
mod:add_buff_template("burning_magma_dot", {
    apply_buff_func = "start_dot_damage",
    damage_profile = "burning_dot",
    damage_type = "burninating",
    duration = 2,
    max_stacks = 5,
    name = "burning_magma_dot",
    reapply_buff_func = "reapply_dot_damage",
    refresh_durations = true,
    time_between_dot_damages = 1.5,
    update_func = "apply_dot_damage",
    update_start_delay = 0.5,
    perks = {
        buff_perks.burning,
    },
})
