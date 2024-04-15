local mod = get_mod("Vermintide Balance Manager")

	NewDamageProfileTemplates = NewDamageProfileTemplates or {}

	local push_radius = 1.25 -- 2.5

	Weapons.one_hand_axe_shield_template_1.actions.action_one.heavy_attack.damage_profile_target = "shield_slam_target_os"
    Weapons.one_hand_axe_shield_template_1.actions.action_one.heavy_attack.damage_profile_aoe = "shield_slam_aoe_os"
    Weapons.one_hand_axe_shield_template_1.actions.action_one.heavy_attack.push_radius = push_radius
