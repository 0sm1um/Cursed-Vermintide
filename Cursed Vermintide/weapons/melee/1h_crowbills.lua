local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.crowbill_slash_os = {
    default_target = {
      boost_curve_coefficient_headshot = 2, -- 1.5
      power_distribution = {
        attack = 0.175,
        impact = 0.1
      },
      attack_template = "blunt_linesman",
      boost_curve_type = "ninja_curve"
    },
    armor_modifier = {
      impact = {
        1,
        0.5,
        1,
        1,
        1,
        0.5
      },
      attack = {
        1.4, -- 1
        1, 
        2,
        1,
        1,
        0.5
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
            1.75, -- 1
            0.25,
            1,
            1,
            0.75
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
        1.25, -- 1
        1.25, -- 1
        3,
        1,
        1.66 -- 1
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

NewDamageProfileTemplates.light_last_os = {
    targets = {
      [2] = {
        attack_template = "slashing_smiter",
        power_distribution = {
          impact = 0.075,
          attack = 0.075
        },
        armor_modifier = {
          impact = {
            0.75,
            0.25,
            1,
            1,
            0.75
          },
          attack = {
            1,
            0.25,
            1,
            1,
            0.75
          }
        },
        boost_curve_type = "smiter_curve"
      }
    },
    armor_modifier = {
      impact = {
        1,
        0.5,
        1,
        1,
        1,
        0.5
      },
      attack = {
        1,
        1,
        2,
        1,
        1,
        0.5
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
        1.25, -- 1
        2,
        1,
        1.66 -- 1
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
      boost_curve_coefficient_headshot = 1.5,
      power_distribution = {
        impact = 0.1,
        attack = 0.175
      },
      attack_template = "blunt_smiter",
      boost_curve_type = "ninja_curve"
    }
  }

  NewDamageProfileTemplates.crowbill_stab_burn_os = {
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    default_target = {
      boost_curve_coefficient_headshot = 2,
      boost_curve_coefficient = 0.75,
      boost_curve_type = "smiter_curve",
      power_distribution = {
        impact = 0.075,
        attack = 0.1
      },
      attack_template = "stab_smiter"
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 1.25, -- 1
        boost_curve_coefficient = 0.75,
        boost_curve_type = "ninja_curve",
        power_distribution = {
          impact = 0.2,
          attack = 0.2
        },
        attack_template = "burning_stab_fencer",
        dot_template_name = "burning_3W_dot"
      }
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
        1,
        1,
        1,
        1
      }
    },
    armor_modifier = {
      impact = {
        1,
        1.25,
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
    }
  }

  NewDamageProfileTemplates.crowbill_bopp_os = {
    default_target = {
      boost_curve_coefficient_headshot = 1.5,
      power_distribution = {
        attack = 0.175,
        impact = 0.1
      },
      attack_template = "blunt_tank_uppercut",
      boost_curve_type = "ninja_curve"
    },
    armor_modifier = {
      impact = {
        1,
        0.5,
        1,
        1,
        1,
        0.5
      },
      attack = {
        1,
        1,
        2,
        1,
        1,
        0.5
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
            1,
            0.25,
            1,
            1,
            0.75
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
        1,
        1,
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
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    }
  }

 NewDamageProfileTemplates.crowbill_heavy_os = {
    default_target = {
      attack_template = "blunt_linesman",
      boost_curve_coefficient = 2,
      boost_curve_coefficient_headshot = 2,
      power_distribution = {
        impact = 0.25,
        attack = 0.4
      },
      boost_curve_type = "smiter_curve"
    },
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        1, -- 0.8
        2.5,
        1,
        2 -- 1
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
        1,
        0.8,
        1.75,
        1,
        1.25 -- 0.75
      }
    },
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    charge_value = "heavy_attack",
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
    }
  }

  Weapons.one_handed_crowbill.actions.action_one.light_attack_last.damage_profile = "crowbill_slash_os"
  Weapons.one_handed_crowbill.actions.action_one.light_attack_last.range_mod = 1.4 -- 1.25
  Weapons.one_handed_crowbill.actions.action_one.light_attack_upper.damage_profile = "crowbill_slash_os"
  Weapons.one_handed_crowbill.actions.action_one.light_attack_right.damage_profile = "crowbill_slash_os"
  Weapons.one_handed_crowbill.actions.action_one.light_attack_right.range_mod = 1.4 -- 1.25
  Weapons.one_handed_crowbill.actions.action_one.light_attack_left.range_mod = 1.4 -- 1.25
  --Heavies
  Weapons.one_handed_crowbill.actions.action_one.heavy_attack.damage_profile = "crowbill_heavy_os"
  Weapons.one_handed_crowbill.actions.action_one.heavy_attack_left.damage_profile = "crowbill_heavy_os"
  Weapons.one_handed_crowbill.actions.action_one.heavy_attack_right_up.damage_profile = "crowbill_heavy_os"

  -- Push Attack
  Weapons.one_handed_crowbill.actions.action_one.light_attack_bopp.damage_profile = "crowbill_slash_os"
