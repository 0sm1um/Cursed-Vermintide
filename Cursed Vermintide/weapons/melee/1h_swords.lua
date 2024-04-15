local mod = get_mod("Vermintide Balance Manager")

Weapons.one_handed_swords_template_1.dodge_count = 4

Weapons.one_handed_swords_template_1.actions.action_one.light_attack_left.damage_profile = "sword_light_1_2_os"
Weapons.one_handed_swords_template_1.actions.action_one.light_attack_right.damage_profile = "sword_light_1_2_os"

NewDamageProfileTemplates.sword_light_1_2_os = {
    -- name = "light_slashing_linesman_finesse",
    default_target = {
      attack_template = "light_slashing_linesman",
      power_distribution = {
        impact = 0.05,
        attack = 0.1
      },
      boost_curve_type = "linesman_curve"
    },
    armor_modifier = {
      impact = {
        1,
        0.3,
        0.5,
        1,
        1
      },
      attack = {
        1,
        0,
        1.5,
        1,
        1
      }
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 2,
        boost_curve_coefficient = 2,
        boost_curve_type = "linesman_curve",
        power_distribution = {
          impact = 0.1,
          attack = 0.2
        },
        attack_template = "light_slashing_linesman_hs"
      },
      {
        boost_curve_coefficient_headshot = 2,
        power_distribution = {
          impact = 0.075,
          attack = 0.166
        },
        attack_template = "light_slashing_linesman",
        boost_curve_type = "linesman_curve"
      }
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.5,
        2.5,
        1,
        1
      },
      impact_armor_power_modifer = {
        1,
        0.5,
        0.5,
        1,
        1
      }
    },
    cleave_distribution = {
      impact = 0.15,
      attack = 0.325
    }
  }

--light 3
Weapons.one_handed_swords_template_1.actions.action_one.light_attack_last.range_mod = 1.4 --1.2
Weapons.one_handed_swords_template_1.actions.action_one.light_attack_last.damage_profile = "sword_light_3_os"
NewDamageProfileTemplates.sword_light_3_os = {
	ignore_stagger_reduction = true,
    targets = {
      [2] = {
        boost_curve_coefficient_headshot = 2,
        power_distribution = {
          impact = 0.075,
          attack = 0.075
        },
        armor_modifier = {
			impact = {
			  1,
			  0.5,
			  1,
			  1,
			  0.75,
			  0.25
			},
			attack = {
			  1,
			  0.65,
			  2.5,
			  1,
			  1,
			  0.6
			}
		},
        boost_curve_type = "smiter_curve",
        attack_template = "slashing_smiter"
      }
    },
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        1,
        2.75,
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
    shield_break = true,
    default_target = {
      boost_curve_coefficient_headshot = 2,
      power_distribution = {
        impact = 0.175,
        attack = 0.2
      },
      attack_template = "slashing_smiter",
      boost_curve_type = "smiter_curve"
    },
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    charge_value = "light_attack",
    name = "light_slashing_smiter_finesse",
    armor_modifier = {
      impact = {
        1,
        0.5,
        1,
        1,
        0.75,
        0.25
      },
      attack = {
        1,
        0.65,
        2.5,
        1,
        1,
        0.6
      }
    }
  }



--Heavies
DamageProfileTemplates.medium_slashing_tank_1h_finesse.targets[1].armor_modifier.attack = {	1, 0.6, 1, 1, 0.75 }  --{ 1, 0.5, 1, 1, 0.75 }
--DamageProfileTemplates.medium_slashing_tank_1h_finesse.targets[1].boost_curve_type = "ninja_curve"
DamageProfileTemplates.medium_slashing_tank_1h_finesse.targets[1].boost_curve_coefficient_headshot = 1.5
DamageProfileTemplates.medium_slashing_tank_1h_finesse.targets[1].power_distribution.attack = 0.35 --0.3
DamageProfileTemplates.medium_slashing_tank_1h_finesse.targets[2].power_distribution.attack = 0.175 --0.1
Weapons.one_handed_swords_template_1.actions.action_one.heavy_attack_left.range_mod = 1.4 --1.25
Weapons.one_handed_swords_template_1.actions.action_one.heavy_attack_right.range_mod = 1.4 --1.25
DamageProfileTemplates.medium_slashing_tank_1h_finesse.cleave_distribution = {
	attack = 0.4, -- 0.8
	impact = 0.25 -- 0.4
}
--DamageProfileTemplates.medium_slashing_tank_1h_finesse.critical_strike = "critical_strike_stab_smiter_H"
