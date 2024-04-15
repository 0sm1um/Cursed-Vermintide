local mod = get_mod("Vermintide Balance Manager")

local push_radius = 1.25 -- 2.5

Weapons.one_handed_hammer_shield_priest_template.actions.action_one.heavy_attack.damage_profile_target = "shield_slam_target_os"
Weapons.one_handed_hammer_shield_priest_template.actions.action_one.heavy_attack.damage_profile_aoe = "shield_slam_aoe_os"
Weapons.one_handed_hammer_shield_priest_template.actions.action_one.heavy_attack.push_radius = push_radius
