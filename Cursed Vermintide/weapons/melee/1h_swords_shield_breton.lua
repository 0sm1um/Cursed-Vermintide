local mod = get_mod("Vermintide Balance Manager")

local push_radius = 1.25 -- 2.5

	NewDamageProfileTemplates = NewDamageProfileTemplates or {}

    -- Bro trust me, that template name is right

    Weapons.one_handed_sword_shield_template_2.actions.action_one.heavy_attack_right.damage_profile_target = "shield_slam_target_os"
    Weapons.one_handed_sword_shield_template_2.actions.action_one.heavy_attack_right.damage_profile_aoe = "shield_slam_aoe_os"
    Weapons.one_handed_sword_shield_template_2.actions.action_one.heavy_attack_right.push_radius = push_radius

    Weapons.one_handed_sword_shield_template_2.actions.action_one.light_attack_shield.damage_profile_target = "shield_slam_target_os"
    Weapons.one_handed_sword_shield_template_2.actions.action_one.light_attack_shield.damage_profile_aoe = "shield_slam_aoe_os"
    Weapons.one_handed_sword_shield_template_2.actions.action_one.light_attack_shield.push_radius = push_radius
