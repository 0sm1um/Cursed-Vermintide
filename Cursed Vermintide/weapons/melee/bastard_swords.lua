local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.bret_light_1 = {
  targets = {
    {
      boost_curve_coefficient_headshot = 1.5,
      boost_curve_coefficient = 2,
      boost_curve_type = "linesman_curve",
      power_distribution = {
        impact = 0.15,
        attack = 0.225
      },
      attack_template = "slashing_linesman"
    },
    {
      attack_template = "slashing_linesman",
      power_distribution = {
        impact = 0.125,
        attack = 0.125
      },
      boost_curve_type = "linesman_curve"
    },
    {
      attack_template = "light_slashing_linesman",
      power_distribution = {
        impact = 0.1,
        attack = 0.1
      },
      boost_curve_type = "linesman_curve"
    }
  },
  armor_modifier = {
    impact = {
      1,
      0.5,
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
  cleave_distribution = {
    impact = 0.2,
    attack = 0.2
  },
  charge_value = "light_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1,
      0.5,
      2,
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
  default_target = {
    boost_curve_coefficient_headshot = 1.5,
    power_distribution = {
      impact = 0.05,
      attack = 0.075
    },
    attack_template = "light_slashing_linesman",
    boost_curve_type = "linesman_curve"
  }
}

NewDamageProfileTemplates.bret_light_2 = {
  name = "medium_slashing_linesman",
  targets = {
    {
      boost_curve_coefficient_headshot = 1.5,
      boost_curve_coefficient = 2,
      boost_curve_type = "linesman_curve",
      power_distribution = {
        impact = 0.15,
        attack = 0.25
      },
      attack_template = "slashing_linesman"
    },
    {
      attack_template = "slashing_linesman",
      power_distribution = {
        impact = 0.125,
        attack = 0.2
      },
      boost_curve_type = "linesman_curve"
    },
    {
      attack_template = "light_slashing_linesman",
      power_distribution = {
        impact = 0.1,
        attack = 0.15
      },
      boost_curve_type = "linesman_curve"
    }
  },
  armor_modifier = {
    impact = {
      1,
      0.5,
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
  cleave_distribution = {
    impact = 0.2,
    attack = 0.3
  },
  charge_value = "light_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1,
      0.5,
      2,
      1,
      1
    },
    impact_armor_power_modifer = {
      1,
      0.5,
      0.5,
      1,
      0.5
    }
  },
  default_target = {
    boost_curve_coefficient_headshot = 1.5,
    power_distribution = {
      impact = 0.05,
      attack = 0.075
    },
    attack_template = "light_slashing_linesman",
    boost_curve_type = "linesman_curve"
  }
}

  NewDamageProfileTemplates.bret_heavy_1_2 = {
    targets = {
      {
        boost_curve_coefficient_headshot = 0.75,
        power_distribution = {
          impact = 0.5,
          attack = 0.45
        },
        boost_curve_type = "linesman_curve",
        armor_modifier = {
          impact = {
            0.9,
            0.75,
            1,
            1,
            0.75
          },
          attack = {
            0.9,
            0.75,
            2,
            1,
            0.75
          }
        },
        attack_template = "heavy_slashing_linesman"
      },
      {
        boost_curve_coefficient_headshot = 0.75,
        power_distribution = {
          impact = 0.15,
          attack = 0.25
        },
        attack_template = "slashing_linesman",
        boost_curve_type = "linesman_curve"
      },
      {
        boost_curve_coefficient_headshot = 0.75,
        power_distribution = {
          impact = 0.125,
          attack = 0.125
        },
        attack_template = "light_slashing_linesman",
        boost_curve_type = "linesman_curve"
      }
    },
    armor_modifier = {
      impact = {
        0.9,
        0.5,
        1,
        1,
        0.75,
        0.25
      },
      attack = {
        0.9,
        0,
        1.5,
        1,
        0.75,
        0
      }
    },
    cleave_distribution = {
      impact = 0.15,
      attack = 0.35
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.75,
        2,
        1,
        1,
        0.75
      },
      impact_armor_power_modifer = {
        1,
        1,
        1,
        1,
        1,
        1
      }
    },
    default_target = {
      boost_curve_coefficient_headshot = 0.75,
      power_distribution = {
        impact = 0.125,
        attack = 0.1
      },
      attack_template = "light_slashing_linesman",
      boost_curve_type = "linesman_curve"
    }
  }

NewDamageProfileTemplates.bret_heavy_3 = {
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
    shield_break = true,
    default_target = {
      attack_template = "heavy_slashing_smiter",
      boost_curve_coefficient = 0.75,
      boost_curve_type = "smiter_curve",
      boost_curve_coefficient_headshot = 1.29,
      power_distribution = {
        attack = 0.65,
        impact = 0.25
      }
    }
  }

  NewDamageProfileTemplates.bret_bopp_os = {
    shield_break = true,
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
    armor_modifier = {
      impact = {
        1,
        0.6,
        1,
        1,
        0.75
      },
      attack = {
        1,
        0.8,
        1.75,
        1,
        0.75
      }
    },
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.8,
        2.5,
        1,
        1
      },
      impact_armor_power_modifer = {
        1,
        0.8,
        1,
        1,
        1,
        0.5
      }
    },
    default_target = {
      attack_template = "slashing_smiter",
      boost_curve_coefficient = 2,
      power_distribution = {
        impact = 0.25,
        attack = 0.4
      },
      boost_curve_type = "smiter_curve"
    }
  }

Weapons.bastard_sword_template.actions.action_one.light_attack_left.allowed_chain_actions[4].start_time = 0.37 -- 0
Weapons.bastard_sword_template.actions.action_one.light_attack_left.allowed_chain_actions[4].end_time = 0.5 -- 0.3

Weapons.bastard_sword_template.actions.action_one.light_attack_left.damage_profile = "bret_light_1"
Weapons.bastard_sword_template.actions.action_one.light_attack_right.damage_profile = "bret_light_2"

Weapons.bastard_sword_template.actions.action_one.heavy_attack_left.damage_profile = "bret_heavy_1_2" -- NEW!
Weapons.bastard_sword_template.actions.action_one.heavy_attack_right.damage_profile = "bret_heavy_1_2" -- NEW!
Weapons.bastard_sword_template.actions.action_one.heavy_attack_down.damage_profile = "bret_heavy_3" -- NEW!
Weapons.bastard_sword_template.actions.action_one.light_attack_bopp.damage_profile = "bret_bopp_os" 
