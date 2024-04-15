local mod = get_mod("Vermintide Balance Manager")

local slowdown = {
    {
        start_time = 0,
        external_multiplier = 0.9,
        buff_name = "planted_decrease_movement"
    }
}

local slowdown_2 = {
    {
        start_time = 0,
        external_multiplier = 0.9,
        end_time = 0.2,
        buff_name = "planted_decrease_movement"
    },
    {
        start_time = 0.2,
        external_multiplier = 1.2,
        end_time = 0.35,
        buff_name = "planted_fast_decrease_movement"
    },
    {
        start_time = 0.35,
        external_multiplier = 0.9,
        end_time = 0.5,
        buff_name = "planted_fast_decrease_movement"
    }
}

Weapons.two_handed_axes_template_2.actions.action_one.default.buff_data = slowdown
Weapons.two_handed_axes_template_2.actions.action_one.default_left.buff_data = slowdown
Weapons.two_handed_axes_template_2.actions.action_one.default_right.buff_data = slowdown
Weapons.two_handed_axes_template_2.actions.action_one.light_attack_right_upward.buff_data = slowdown_2
Weapons.two_handed_axes_template_2.actions.action_one.light_attack_left_upward.buff_data = slowdown_2
Weapons.two_handed_axes_template_2.actions.action_one.light_attack_left.buff_data = slowdown_2
Weapons.two_handed_axes_template_2.actions.action_one.light_attack_bopp.buff_data = slowdown_2

Weapons.two_handed_axes_template_2.actions.action_one.light_attack_right_upward.hit_mass_count = LINESMAN_HIT_MASS_COUNT
Weapons.two_handed_axes_template_2.actions.action_one.light_attack_left_upward.hit_mass_count = LINESMAN_HIT_MASS_COUNT
Weapons.two_handed_axes_template_2.actions.action_one.light_attack_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT
Weapons.two_handed_axes_template_2.actions.action_one.light_attack_bopp.hit_mass_count = LINESMAN_HIT_MASS_COUNT

Weapons.two_handed_axes_template_2.actions.action_one.heavy_attack_down_first.anim_time_scale = 1.2 * Weapons.two_handed_axes_template_2.actions.action_one.heavy_attack_down_first.anim_time_scale
Weapons.two_handed_axes_template_2.actions.action_one.heavy_attack_down_second.anim_time_scale = 1.1 * Weapons.two_handed_axes_template_2.actions.action_one.heavy_attack_down_second.anim_time_scale

AttackTemplates.heavy_slashing_smiter_hs.headshot_sound = "executioner_sword_critical"

Weapons.two_handed_axes_template_2.actions.action_one.heavy_attack_down_first.uninterruptible = true
Weapons.two_handed_axes_template_2.actions.action_one.heavy_attack_down_second.uninterruptible = true

