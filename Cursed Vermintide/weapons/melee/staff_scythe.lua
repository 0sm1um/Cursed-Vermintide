local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.heavy_1_2_scythe_os = {
    targets = {
      {
        boost_curve_coefficient_headshot = 1,
        boost_curve_coefficient = 2,
        boost_curve_type = "linesman_curve",
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
            0.5,
            2,
            1,
            0.5
          }
        },
        power_distribution = {
          impact = 0.4,
          attack = 0.45
        },
        attack_template = "heavy_slashing_linesman"
      },
      {
        boost_curve_coefficient_headshot = 1,
        power_distribution = {
          impact = 0.25,
          attack = 0.32
        },
        attack_template = "heavy_slashing_linesman",
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "slashing_linesman",
        power_distribution = {
          impact = 0.2,
          attack = 0.22
        },
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "slashing_linesman",
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
        0.3,
        2,
        1,
        0.1
      }
    },
    cleave_distribution = {
      impact = 0.55,
      attack = 0.55 -- 0.75
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.2,
        0.9,
        3.5,
        1.2,
        1.2
      },
      impact_armor_power_modifer = {
        1.2,
        1.2,
        1,
        1.2,
        1.2
      }
    },
    default_target = {
      boost_curve_coefficient_headshot = 0.25,
      power_distribution = {
        impact = 0.075,
        attack = 0.075
      },
      attack_template = "light_slashing_linesman",
      boost_curve_type = "linesman_curve"
    }
  }

  NewDamageProfileTemplates.heavy_3_scythe_os = {
    targets = {
      {
        boost_curve_coefficient_headshot = 1.5,
        power_distribution = {
          impact = 0.5,
          attack = 0.5
        },
        boost_curve_type = "linesman_curve",
        armor_modifier = {
          impact = {
            0.9,
            0.78,
            1,
            1,
            0.75
          },
          attack = {
            0.9,
            0.78,
            2,
            1,
            0.75
          }
        },
        attack_template = "heavy_slashing_linesman"
      },
      {
        boost_curve_coefficient_headshot = 1.5,
        power_distribution = {
          impact = 0.15,
          attack = 0.25
        },
        attack_template = "slashing_linesman",
        boost_curve_type = "linesman_curve"
      },
      {
        boost_curve_coefficient_headshot = 0.2,
        power_distribution = {
          impact = 0.125,
          attack = 0.125
        },
        attack_template = "slashing_linesman",
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
        2,
        1,
        0.75,
        0
      }
    },
    cleave_distribution = {
      impact = 0.45,
      attack = 0.35 -- 0.55
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.8,
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
      attack_template = "heavy_slashing_linesman",
      boost_curve_type = "linesman_curve"
    }
  }

  NewDamageProfileTemplates.heavy_4_scythe_os = {
    targets = {
      [2] = {
        attack_template = "heavy_blunt_smiter",
        power_distribution = {
          impact = 0.1,
          attack = 0.2
        },
        boost_curve_type = "smiter_curve"
      }
    },
    default_target = {
      boost_curve_coefficient_headshot = 0.5,
      boost_curve_coefficient = 0.75,
      boost_curve_type = "smiter_curve",
      power_distribution = {
        impact = 0.3,
        attack = 0.6
      },
      attack_template = "heavy_blunt_smiter"
    },
    armor_modifier = {
      impact = {
        1,
        1,
        1,
        1,
        0.75,
        1
      },
      attack = {
        1,
        1,
        1.75,
        1,
        0.75,
        1
      }
    },
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    charge_value = "heavy_attack",
    shield_break = true,
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        1.1,
        1.75,
        1.2,
        1,
        1.1
      },
      impact_armor_power_modifer = {
        1,
        1.1,
        1,
        1,
        1,
        1.1
      }
    }
  }

  NewDamageProfileTemplates.scythe_discharge_target_os = {
    default_target = {
      attack_template = "drakegun",
      power_distribution = {
        impact = 0.25, -- 0.5
        attack = 0.07
      },
      damage_type = "drakegun"
    },
    targets = {
    },
    charge_value = "heavy_attack",
    no_stagger_damage_reduction = true,
    armor_modifier = {
      impact = {
        1,
        0.75,
        1,
        1,
        0.75,
        0
      },
      attack = {
        1,
        0.25,
        1.5,
        1,
        0.75,
        0
      }
    }
  }


Weapons.staff_scythe.actions.action_one.heavy_attack_01.damage_profile = "heavy_1_2_scythe_os"
Weapons.staff_scythe.actions.action_one.heavy_attack_02.damage_profile = "heavy_1_2_scythe_os"
Weapons.staff_scythe.actions.action_one.heavy_attack_03.damage_profile = "heavy_3_scythe_os"
Weapons.staff_scythe.actions.action_one.heavy_attack_04.damage_profile = "heavy_4_scythe_os"

Weapons.staff_scythe.actions.action_three.special_action_attack.damage_profile_target  = "scythe_discharge_target_os"
Weapons.staff_scythe.actions.action_three.special_action_attack.damage_profile  = "scythe_discharge_target_os"