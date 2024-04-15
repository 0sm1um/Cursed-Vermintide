local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.hammer_heavy_os = {
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
      0.85, -- 0.8
      2,
      1,
      1, -- 0.75
      1
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
      1.33, -- 1
      0.8, -- 0.8
      2.5,
      1,
      1., -- 1
      1. -- 1
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
    boost_curve_coefficient_headshot = 1.25, -- 1
    boost_curve_coefficient = 2,
    power_distribution = {
      impact = 0.25,
      attack = 0.4
    },
    boost_curve_type = "smiter_curve"
  }
}

  NewDamageProfileTemplates.hammer_light_os = {
    cleave_distribution = {
      impact = 0.5,
      attack = 0.4
    },
    armor_modifier = {
      impact = {
        1,
        1,
        0.5,
        1,
        1
      },
      attack = {
        1,
        0,
        1,
        1,
        1
      }
    },
    default_target = {
      attack_template = "light_blunt_linesman",
      power_distribution = {
        attack = 0.075, -- 0.05
        impact = 0.15
      },
      boost_curve_type = "tank_curve"
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 1.5,
        power_distribution = {
          attack = 0.2,
          impact = 0.25
        },
        attack_template = "blunt_linesman",
        boost_curve_type = "tank_curve"
      },
      {
        attack_template = "light_blunt_linesman",
        power_distribution = {
          attack = 0.1,
          impact = 0.175
        },
        boost_curve_type = "tank_curve"
      }
    },
    charge_value = "light_attack",
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
        0.5,
        1,
        1
      }
    },
    stagger_duration_modifier = 1.25
  }

  NewDamageProfileTemplates.light_vertical_strike_os = {
    default_target = {
      attack_template = "light_blunt_smiter",
      power_distribution = {
        attack = 0.25, -- 0.25
        impact = 0.175
      },
      boost_curve_type = "smiter_curve"
    },
    ignore_stagger_reduction = true,
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
        1.25,
        0.8, -- 0.65
        2.,
        1,
        0.75, -- 0.75
        0.8 -- 0.6
      }
    },
    targets = {
      [2] = {
        attack_template = "slashing_smiter",
        power_distribution = {
          attack = 0.075,
          impact = 0.075
        },
        boost_curve_type = "smiter_curve",
        armor_modifier = {
          attack = {
            1.25,
            0.8,
            2.5,
            1, 
            0.8
          },
          impact = {
            0.75,
            0.25,
            1,
            1,
            0.75
          }
        }
      }
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.25,
        0.75,
        2.5,
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
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    }
  }

  Weapons.one_handed_hammer_template_1.actions.action_one.heavy_attack_left.damage_profile = "hammer_heavy_os"
  Weapons.one_handed_hammer_template_1.actions.action_one.heavy_attack_right.damage_profile = "hammer_heavy_os"
  Weapons.one_handed_hammer_template_1.actions.action_one.heavy_attack_left.range_mod = 1.33
  Weapons.one_handed_hammer_template_1.actions.action_one.heavy_attack_left.range_mod = 1.33

  Weapons.one_handed_hammer_template_2.actions.action_one.heavy_attack_left.damage_profile = "hammer_heavy_os"
  Weapons.one_handed_hammer_template_2.actions.action_one.heavy_attack_right.damage_profile = "hammer_heavy_os"
  Weapons.one_handed_hammer_template_2.actions.action_one.heavy_attack_left.range_mod = 1.33
  Weapons.one_handed_hammer_template_2.actions.action_one.heavy_attack_left.range_mod = 1.33

  Weapons.one_handed_hammer_template_1.actions.action_one.light_attack_right.damage_profile = "hammer_light_os"
  Weapons.one_handed_hammer_template_1.actions.action_one.light_attack_left.damage_profile = "hammer_light_os"
  Weapons.one_handed_hammer_template_1.actions.action_one.light_attack_last.damage_profile = "light_vertical_strike_os"
  Weapons.one_handed_hammer_template_1.actions.action_one.light_attack_down.damage_profile = "light_vertical_strike_os"

  Weapons.one_handed_hammer_template_2.actions.action_one.light_attack_right.damage_profile = "hammer_light_os"
  Weapons.one_handed_hammer_template_2.actions.action_one.light_attack_left.damage_profile = "hammer_light_os"
  Weapons.one_handed_hammer_template_2.actions.action_one.light_attack_last.damage_profile = "light_vertical_strike_os"
  Weapons.one_handed_hammer_template_2.actions.action_one.light_attack_down.damage_profile = "light_vertical_strike_os"

  Weapons.one_handed_hammer_template_1.actions.action_one.light_attack_down.range_mod = 1.33 -- 1.2
  Weapons.one_handed_hammer_template_1.actions.action_one.light_attack_bopp.range_mod = 1.33 -- 1.2

  Weapons.one_handed_hammer_template_2.actions.action_one.light_attack_down.range_mod = 1.33 -- 1.2
  Weapons.one_handed_hammer_template_2.actions.action_one.light_attack_bopp.range_mod = 1.33 -- 1.2
  