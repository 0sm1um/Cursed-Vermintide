local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

	NewDamageProfileTemplates.falchion_heavy_os = {
    default_target = {
      attack_template = "slashing_smiter",
      boost_curve_coefficient = 2,
      power_distribution = {
        impact = 0.25,
        attack = 0.4
      },
      boost_curve_type = "smiter_curve"
    },
    melee_boost_override = 5,
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.8,
        2.5,
        1,
        0.8
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
    armor_modifier = {
      impact = {
        1,
        0.6,
        1,
        1,
        0.75
      },
      attack = {
        1., -- 1
        0.8,
        1.75,
        1, -- 1
        0.8 --0.75
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
    charge_value = "heavy_attack",
    shield_break = true,
    cleave_distribution = {
      impact = 0.2,
      attack = 0.5
    }
  }

  NewDamageProfileTemplates.falchion_light_1_light_2_os = {
    default_target = {
      attack_template = "slashing_upper",
      power_distribution = {
        attack = 0.075,
        impact = 0.075
      },
      boost_curve_type = "linesman_curve"
    },
    armor_modifier = {
      impact = {
        0.9,
        0.25,
        1,
        1,
        0.75
      },
      attack = {
        1.25, -- 0.9
        0,
        1.5,
        1.25, -- 1
        0
      }
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 2,
        power_distribution = {
          attack = 0.195,
          impact = 0.125
        },
        armor_modifier = {
          attack = {
            1.25, -- 1
            0.25, -- 0.25
            1.5,
            1, -- 1
            1.25, -- 0.75
            0
          },
          impact = {
            0.9,
            0.25,
            1,
            1,
            0.75
          }
        },
        attack_template = "slashing_upper",
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "slashing_upper",
        power_distribution = {
          attack = 0.125,
          impact = 0.1
        },
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "slashing_upper",
        power_distribution = {
          attack = 0.075,
          impact = 0.08
        },
        boost_curve_type = "linesman_curve"
      }
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.25, -- 1
        0.5,
        1.5,
        1.25, -- 1
        0.5
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
      impact = 0.25, -- 0.2
      attack = 0.275 -- 0.25
    }
  }

  NewDamageProfileTemplates.falchion_light_3_os = {
    default_target = {
      attack_template = "slashing_smiter",
      boost_curve_coefficient = 2,
      power_distribution = {
        impact = 0.25,
        attack = 0.4
      },
      boost_curve_type = "smiter_curve"
    },
    melee_boost_override = 5,
    critical_strike = {
      attack_armor_power_modifer = {
        1.25, -- 1
        0.8,
        2,
        1.25, -- 1
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
    armor_modifier = {
      impact = {
        1,
        0.6,
        1,
        1,
        0.75
      },
      attack = {
        1.25, -- 1
        0.8,
        1.5,
        1.25, -- 1
        0.8
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
    charge_value = "heavy_attack",
    shield_break = true,
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    }
  }

  NewDamageProfileTemplates.falchion_bopp_os = {
    default_target = {
      attack_template = "slashing_upper",
      power_distribution = {
        attack = 0.075,
        impact = 0.075
      },
      boost_curve_type = "linesman_curve"
    },
    armor_modifier = {
      impact = {
        0.9,
        0.25,
        1,
        1,
        0.75
      },
      attack = {
        0.9,
        0,
        1.5,
        1,
        0.75
      }
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 2,
        power_distribution = {
          attack = 0.195,
          impact = 0.125
        },
        armor_modifier = {
          attack = {
            1,
            0.25,
            1.5,
            1,
            0.75,
            0
          },
          impact = {
            0.9,
            0.25,
            1,
            1,
            0.75
          }
        },
        attack_template = "slashing_upper",
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "slashing_upper",
        power_distribution = {
          attack = 0.125,
          impact = 0.1
        },
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "slashing_upper",
        power_distribution = {
          attack = 0.075,
          impact = 0.08
        },
        boost_curve_type = "linesman_curve"
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
        1,
        1,
        1
      }
    },
    cleave_distribution = {
      impact = 0.2,
      attack = 0.25
    },
    shield_break = true -- False,
  }

    Weapons.one_hand_falchion_template_1.actions.action_one.heavy_attack.damage_profile = "falchion_heavy_os"
    Weapons.one_hand_falchion_template_1.actions.action_one.heavy_attack_2.damage_profile = "falchion_heavy_os"
    Weapons.one_hand_falchion_template_1.actions.action_one.heavy_attack.hit_mass_count = TANK_HIT_MASS_COUNT
    Weapons.one_hand_falchion_template_1.actions.action_one.heavy_attack_2.hit_mass_count = TANK_HIT_MASS_COUNT

    Weapons.one_hand_falchion_template_1.actions.action_one.light_attack_right.damage_profile = "falchion_light_1_light_2_os"
    Weapons.one_hand_falchion_template_1.actions.action_one.light_attack_left.damage_profile = "falchion_light_1_light_2_os"

    Weapons.one_hand_falchion_template_1.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT
    Weapons.one_hand_falchion_template_1.actions.action_one.light_attack_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  
    Weapons.one_hand_falchion_template_1.actions.action_one.light_attack_down.damage_profile = "falchion_heavy_os"

    Weapons.one_hand_falchion_template_1.actions.action_one.light_attack_bopp.damage_profile = "falchion_light_1_light_2_os"
    Weapons.one_hand_falchion_template_1.actions.action_one.light_attack_bopp.allowed_chain_actions = {
      {
        sub_action = "default",
        start_time = 0.7,
        action = "action_one",
        release_required = "action_two_hold",
        input = "action_one"
      },
      {
        sub_action = "default",
        start_time = 0.7,
        action = "action_one",
        release_required = "action_two_hold",
        input = "action_one_hold"
      },
      {
        sub_action = "default",
        start_time = 0.55,
        action = "action_two",
        input = "action_two_hold"
      },
      {
        sub_action = "default",
        start_time = 0.55,
        action = "action_wield",
        input = "action_wield"
      }
    }

    Weapons.one_hand_falchion_template_1.buffs = {
      change_dodge_distance = {
        external_optional_multiplier = 1.25
      },
      change_dodge_speed = {
        external_optional_multiplier = 1.33 -- 1.25
      }
    }