local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates.greathammer_lights_os = {
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    shield_break = true,
    armor_modifier = {
      impact = {
        1,
        0.8,
        1,
        1,
        0.75
      },
      attack = {
        1.33, -- 1
        0.8, -- 0.8
        1.5, -- 2
        1,
        0.75, -- 0.75
        0.75
      }
    },
    targets = {
      [2] = {
        attack_template = "light_blunt_tank",
        power_distribution = {
          impact = 0.1,
          attack = 0.1
        },
        boost_curve_type = "tank_curve"
      }
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.66, -- 1
        0.85, -- 0.85
        2, -- 2.5
        1,
        1.33, -- 1
        1.25 -- 1
      },
      impact_armor_power_modifer = {
        1,
        1,
        1,
        1,
        1
      }
    },
    default_target = {
      attack_template = "blunt_smiter",
      boost_curve_coefficient = 2,
	  boost_curve_coefficient_headshot = 1.25,
      power_distribution = {
        impact = 0.25,
        attack = 0.4
      },
      boost_curve_type = "smiter_curve"
    }
  }

NewDamageProfileTemplates.greathammer_heavy_os = {
	stagger_duration_modifier = 1.8,
	critical_strike = {
		attack_armor_power_modifer = {
			1, -- 1
			0.75, -- 0.6
			2,
			1,
			0.75
		},
		impact_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1
		}
	},
	charge_value = "heavy_attack",
	cleave_distribution = {
		attack = 0.45, -- 0.3
		impact = 0.8 -- 0.8
	},
	default_target = {
		boost_curve_type = "tank_curve",
		attack_template = "blunt_tank",
		power_distribution = {
			attack = 0.075, -- 0.05
			impact = 0.125 -- 0.125
		}
	},
	targets = {
		{
			boost_curve_type = "tank_curve",
			attack_template = "heavy_blunt_tank",
			power_distribution = {
				attack = 0.325, -- 0.275
				impact = 0.3
			},
			armor_modifier = {
				attack = {
					1.5, -- 1
					0.8, -- 0.5
					2,
					1,
					0.8
				},
				impact = {
					1.5,
					1,
					1,
					1,
					0.75
				}
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "heavy_blunt_tank",
			power_distribution = {
				attack = 0.25, -- 0.15
				impact = 0.225
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.125, -- 0.075
				impact = 0.2
			}
		}
	},
	armor_modifier = {
		attack = {
			1,
			0.75,
			2,
			1,
			0.75
		},
		impact = {
			1,
			1,
			1,
			1,
			0.75
		}
	}
}

Weapons.two_handed_hammers_template_1.actions.action_one.heavy_attack_right.damage_profile = "greathammer_heavy_os"
Weapons.two_handed_hammers_template_1.actions.action_one.heavy_attack_left.damage_profile = "greathammer_heavy_os"
Weapons.two_handed_hammers_template_1.actions.action_one.light_attack_push_left_up.damage_profile = "greathammer_lights_os"

Weapons.two_handed_hammers_template_1.actions.action_one.light_attack_push_left_up.hit_mass_count = TANK_HIT_MASS_COUNT

Weapons.two_handed_hammers_template_1.actions.action_one.light_attack_right.damage_profile = "greathammer_lights_os"
Weapons.two_handed_hammers_template_1.actions.action_one.light_attack_left.damage_profile = "greathammer_lights_os"
Weapons.two_handed_hammers_template_1.actions.action_one.light_attack_left_up.damage_profile = "greathammer_lights_os"

Weapons.two_handed_hammers_template_1.actions.action_one.heavy_attack_right.anim_time_scale = 1
Weapons.two_handed_hammers_template_1.actions.action_one.heavy_attack_left.anim_time_scale = 1

-- QQ
local light_attack_right_allowed_chain_actions = {
	{
		sub_action = "default_right",
		start_time = 0.7,
		action = "action_one",
		end_time = 1.8,
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 1.8,
		action = "action_one",
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 0.7,
		action = "action_two",
		input = "action_two_hold"
	},
	{
		sub_action = "default",
		start_time = 0,
		action = "action_two",
		end_time = 0.3,
		input = "action_two_hold"
	},
	{
		sub_action = "default",
		start_time = 0,
		action = "action_wield",
		end_time = 0.3,
		input = "action_wield"
	},
	{
		sub_action = "default",
		start_time = 0.75, -- 0.5
		action = "action_wield",
		input = "action_wield"
	}
}

local light_attack_left_allowed_chain_actions = {
	{
		sub_action = "default_left",
		start_time = 0.7,
		action = "action_one",
		end_time = 1.8,
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 1.8,
		action = "action_one",
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 0.7,
		action = "action_two",
		input = "action_two_hold"
	},
	{
		sub_action = "default",
		start_time = 0,
		action = "action_two",
		end_time = 0.3,
		input = "action_two_hold"
	},
	{
		sub_action = "default",
		start_time = 0,
		action = "action_wield",
		end_time = 0.3,
		input = "action_wield"
	},
	{
		sub_action = "default",
		start_time = 0.75,
		action = "action_wield",
		input = "action_wield"
	}
}

Weapons.two_handed_hammers_template_1.actions.action_one.light_attack_right.allowed_chain_actions = light_attack_right_allowed_chain_actions
Weapons.two_handed_hammers_template_1.actions.action_one.light_attack_left.allowed_chain_actions = light_attack_left_allowed_chain_actions
--Weapons.two_handed_hammers_template_1.actions.action_one.light_attack_left_up.damage_profile = "greathammer_lights_os"
