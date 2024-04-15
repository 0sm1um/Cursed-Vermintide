local mod = get_mod("Vermintide Balance Manager")

--2h Sword
--bop
Weapons.two_handed_swords_template_1.actions.action_one.light_attack_bopp.anim_time_scale = 1.35
--Heavies
--DamageProfileTemplates.heavy_slashing_linesman.targets[2].power_distribution.attack = 0.4
--DamageProfileTemplates.heavy_slashing_linesman.targets[2].armor_modifier = { attack = { 1, 0.4, 2, 1, 1 }, impact = { 1, 0.5, 0.5, 1, 1} }
--DamageProfileTemplates.heavy_slashing_linesman.targets[3].power_distribution.attack = 0.25
--DamageProfileTemplates.heavy_slashing_linesman.targets[4].power_distribution.attack = 0.20
--DamageProfileTemplates.heavy_slashing_linesman.default_target.power_distribution.attack = 0.14
NewDamageProfileTemplates.two_handed_sword_heavy_os = {
	armor_modifier = {
		attack = {
			1,
			0.25,
			1.5,
			0.6,
			0.25
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			1
		}
	},
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			2,
			1,
			0.5
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			0.5,
			1,
			1
		}
	},
	charge_value = "heavy_attack",
	cleave_distribution = {
		attack = 0.6, -- 0.8
		impact = 0.4
	},
	default_target = {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 0.25,
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.1,
			impact = 0.05
		}
	},
	targets = {
		{
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.4,
				impact = 0.275
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.325,
				impact = 0.15
			},
			armor_modifier = {
				attack = {1,
						0.25,
						2,
						1,
						0.25},
				impact = { 1, 0.5, 0.5, 1, 1}
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.25,
				impact = 0.1
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.15,
				impact = 0.075
			}
		}
	}
}

--lights
--DamageProfileTemplates.medium_slashing_linesman.targets[1].power_distribution.attack = 0.275
--DamageProfileTemplates.medium_slashing_linesman.targets[2].power_distribution.attack = 0.2
--DamageProfileTemplates.medium_slashing_linesman.targets[3].power_distribution.attack = 0.15
--DamageProfileTemplates.medium_slashing_linesman.targets[1].boost_curve_coefficient_headshot = 2
--DamageProfileTemplates.medium_slashing_linesman.targets[2].boost_curve_coefficient_headshot = 2
--DamageProfileTemplates.medium_slashing_linesman.targets[3].boost_curve_coefficient_headshot = 2
--DamageProfileTemplates.medium_slashing_linesman.default_target.power_distribution.attack = 0.1
--DamageProfileTemplates.medium_slashing_linesman.cleave_distribution.impact = 0.4
NewDamageProfileTemplates.two_handed_sword_light_os = {
	armor_modifier = {
		attack = {
			1,
			0,
			1.5,
			1,
			0
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			1
		}
	},
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			2,
			1,
			0.5
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			0.5,
			1,
			1
		}
	},
	charge_value = "light_attack",
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 1.5,
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.125,
			impact = 0.05
		}
	},
	targets = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.266,
				impact = 0.15
			}
		},
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.2,
				impact = 0.125
			}
		},
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.15,
				impact = 0.1
			}
		}
	}
}

NewDamageProfileTemplates.greatsword_bopp_os = {
    shield_break = true,
    targets = {
      [2] = {
        attack_template = "stab_smiter",
        power_distribution = {
          impact = 0.1,
          attack = 0.2
        },
        boost_curve_type = "smiter_curve"
      }
    },
    armor_modifier = {
      impact = {
        1,
        1,
        1,
        1,
        0.75
      },
      attack = {
        1,
        0.5,
        1.5,
        1,
        0.75
      }
    },
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.5,
        1.5,
        1,
        1
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
      boost_curve_coefficient_headshot = 1.5, -- 0.75
      boost_curve_coefficient = 0.75,
      boost_curve_type = "smiter_curve",
      power_distribution = {
        impact = 0.25,
        attack = 0.65
      },
      attack_template = "heavy_slashing_smiter"
    }
  }

Weapons.two_handed_swords_template_1.actions.action_one.light_attack_right.damage_profile = "two_handed_sword_light_os"
Weapons.two_handed_swords_template_1.actions.action_one.light_attack_bopp.damage_profile = "greatsword_bopp_os"


-- QQ
Weapons.two_handed_swords_template_1.actions.action_one.light_attack_left.damage_profile = "two_handed_sword_light_os"
Weapons.two_handed_swords_template_1.actions.action_one.light_attack_right.damage_profile = "two_handed_sword_light_os"
Weapons.two_handed_swords_template_1.actions.action_one.heavy_attack_left.damage_profile = "two_handed_sword_heavy_os"
Weapons.two_handed_swords_template_1.actions.action_one.heavy_attack_right.damage_profile = "two_handed_sword_heavy_os"

local heavy_attack_left_chain = {
	{
		sub_action = "default_right",
		start_time = 0.65,
		action = "action_one",
		release_required = "action_one_hold",
		input = "action_one"
	},
	{
		sub_action = "default_right",
		start_time = 0.6,
		action = "action_one",
		release_required = "action_one_hold",
		input = "action_one_hold"
	},
	{
		sub_action = "default",
		start_time = 1.05,
		action = "action_one",
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 0.5,
		action = "action_two",
		input = "action_two_hold"
	},
	{
		sub_action = "default",
		start_time = 0.85,
		action = "action_wield",
		input = "action_wield"
	}
}

local heavy_attack_right_chain = {
	{
		sub_action = "default_left",
		start_time = 0.65,
		action = "action_one",
		release_required = "action_one_hold",
		input = "action_one"
	},
	{
		sub_action = "default_left",
		start_time = 0.8,
		action = "action_one",
		release_required = "action_one_hold",
		input = "action_one_hold"
	},
	{
		sub_action = "default",
		start_time = 1.05,
		action = "action_one",
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 0.5,
		action = "action_two",
		input = "action_two_hold"
	},
	{
		sub_action = "default",
		start_time = 0.85,
		action = "action_wield",
		input = "action_wield"
	}
}

Weapons.two_handed_swords_template_1.actions.action_one.heavy_attack_left.allowed_chain_actions = heavy_attack_left_chain
Weapons.two_handed_swords_template_1.actions.action_one.heavy_attack_right.allowed_chain_actions = heavy_attack_right_chain