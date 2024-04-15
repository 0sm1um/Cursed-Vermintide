local mod = get_mod("Vermintide Balance Manager")

--2h Hammer Priest
Weapons.two_handed_hammer_priest_template.actions.action_one.heavy_attack_01.damage_profile = "os_2h_hammer_heavy_1_priest"
Weapons.two_handed_hammer_priest_template.actions.action_one.light_attack_03.damage_profile = "os_2h_hammer_light_3_priest"
Weapons.two_handed_hammer_priest_template.actions.action_one.heavy_attack_02.damage_profile = "os_2h_hammer_heavy_2_priest"
DamageProfileTemplates.priest_hammer_blunt_smiter.armor_modifier.attack[2] = 2.025
DamageProfileTemplates.priest_hammer_blunt_smiter.armor_modifier.attack[6] = 1.2
DamageProfileTemplates.priest_hammer_blunt_smiter.critical_strike.attack_armor_power_modifer[2] = 1.8
DamageProfileTemplates.priest_hammer_heavy_blunt_tank_upper.cleave_distribution.attack = 0.4

local heavy_1_allowed_chain_actions = {
	{
		sub_action = "default_02",
		start_time = 0.65,
		action = "action_one",
		release_required = "action_one_hold",
		end_time = 1.2,
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 1.2,
		action = "action_one",
		input = "action_one"
	},
	{
		sub_action = "default",
		start_time = 0,
		action = "weapon_reload",
		input = "weapon_reload"
	},
	{
		sub_action = "default_from_out_of_screen",
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
		start_time = 0.6, -- 0.5
		action = "action_wield",
		input = "action_wield"
	},
	{
		sub_action = "default_from_offscreen",
		start_time = 0.85,
		action = "action_three",
		input = "action_three"
	}
}

NewDamageProfileTemplates.os_2h_hammer_heavy_1_priest = {
    targets = {
      {
        attack_template = "heavy_blunt_tank",
        power_distribution = {
          impact = 0.3,
          attack = 0.4
        },
        armor_modifier = {
          impact = {
            1.5,
            1,
            1,
            1,
            0.75
          },
          attack = {
            1,
            0.5,
            2,
            1,
            0.75
          }
        },
        boost_curve_type = "tank_curve"
      },
      {
        attack_template = "heavy_blunt_tank",
        power_distribution = {
          impact = 0.225,
          attack = 0.45
        },
        boost_curve_type = "tank_curve"
      }
    },
    default_target = {
      attack_template = "blunt_tank",
      power_distribution = {
        impact = 0.125,
        attack = 0.05
      },
      boost_curve_type = "tank_curve"
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
        0,
        1.5,
        1,
        0.75
      }
    },
    cleave_distribution = {
      impact = 0.4, -- 0.8
      attack = 0.4
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.6,
        2,
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
    stagger_duration_modifier = 1.8
  }

NewDamageProfileTemplates.os_2h_hammer_light_3_priest = {
	stagger_duration_modifier = 1.5,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1
		},
		impact_armor_power_modifer = {
			1,
			1,
			0.5,
			1,
			1
		}
	},
	charge_value = "light_attack",
	cleave_distribution = {
		attack = 0.3,
		impact = 0.8
	},
	default_target = {
		boost_curve_type = "tank_curve",
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.05,
			impact = 0.05
		}
	},
	targets = {
		{
			boost_curve_type = "tank_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.3,
				impact = 0.2
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.3,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.1
			}
		}
	},
	armor_modifier = {
		attack = {
			1,
			0.2,
			1,
			1,
			0.75
		},
		impact = {
			1,
			1,
			0.5,
			1,
			0.75
		}
	}
}

NewDamageProfileTemplates.os_2h_hammer_heavy_2_priest = {
	stagger_duration_modifier = 1.8,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.6,
			2,
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
	charge_value = "heavy_attack",
	cleave_distribution = {
		attack = 0.4,
		impact = 0.4 -- 0.8
	},
	default_target = {
		boost_curve_type = "tank_curve",
		attack_template = "blunt_tank",
		power_distribution = {
			attack = 0.05,
			impact = 0.125
		}
	},
	targets = {
		{
			boost_curve_type = "tank_curve",
			attack_template = "heavy_blunt_tank",
			power_distribution = {
				attack = 0.5,
				impact = 0.3
			},
			armor_modifier = {
				attack = {
					1,
					0.5,
					2,
					1,
					0.75
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
				attack = 0.5,
				impact = 0.225
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.2
			}
		}
	},
	armor_modifier = {
		attack = {
			1,
			0,
			1.5,
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
