local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.fire_sword_bopp_os = {
    default_target = {
      attack_template = "burning_linesman",
      power_distribution = {
        attack = 0.075,
        impact = 0.05
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
        2,
        1,
        1
      }
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 1,
        boost_curve_coefficient = 2,
        boost_curve_type = "linesman_curve",
        power_distribution = {
          impact = 0.1,
          attack = 0.175
        },
        attack_template = "light_slashing_linesman_hs",
        dot_template_name = "burning_3W_dot"
      },
      {
        boost_curve_coefficient_headshot = 1,
        power_distribution = {
          impact = 0.075,
          attack = 0.125
        },
        boost_curve_type = "linesman_curve",
        dot_template_name = "burning_3W_dot", -- burning_1W_dot
        attack_template = "light_slashing_linesman"
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
      impact = 0.2,
      attack = 0.35
    }
  }

  NewDamageProfileTemplates.fire_sword_heavy_2_os = {
    armor_modifier = {
      impact = {
        1,
        1,
        1.5,
        1,
        1.5
      },
      attack = {
        1,
        0.5,
        1.5,
        1,
        1.5
      }
    },
    targets = {
      {
        dot_template_name = "burning_3W_dot", -- burning_1W_dot
        boost_curve_coefficient = 0.3,
        boost_curve_type = "tank_curve",
        power_distribution = {
          impact = 0.3,
          attack = 0.2
        },
        attack_template = "burning_tank"
      },
      {
        dot_template_name = "burning_dot_1tick",
        boost_curve_coefficient = 0.3,
        boost_curve_type = "tank_curve",
        power_distribution = {
          impact = 0.2,
          attack = 0.15
        },
        attack_template = "burning_tank"
      }
    },
    default_target = {
      dot_template_name = "burning_dot_1tick",
      boost_curve_coefficient = 0.3,
      boost_curve_type = "tank_curve",
      power_distribution = {
        impact = 0.15,
        attack = 0.075
      },
      attack_template = "burning_tank"
    },
    cleave_distribution = {
      impact = 0.5,
      attack = 0.35 -- 0.2
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.5,
        1.5,
        1,
        1.5
      },
      impact_armor_power_modifer = {
        1,
        1,
        1.5,
        1,
        1.5
      }
    },
    stagger_duration_modifier = 1.5
  }

  NewDamageProfileTemplates.heavy_1_slam_os = {
    default_target = {
      dot_template_name = "burning_dot_1tick", -- "burning_3W_dot"
      power_distribution = {
        impact = 0.15,
        attack = 0.075
      },
      attack_template = "flame_blast",
      boost_curve_type = "tank_curve"
    },
    ignore_stagger_reduction = true,
    armor_modifier = {
      impact = {
        1,
        0.8,
        1,
        1,
        1
      },
      attack = {
        1,
        0.25,
        1,
        1,
        0.5
      }
    },
    targets = {
    },
    charge_value = "heavy_attack",
    critical_strike = {
      impact = {
        1,
        0.8,
        1,
        1,
        1
      },
      attack = {
        1,
        0.25,
        1,
        1,
        0.5
      }
    },
    stagger_duration_modifier = 1.75
  }

  NewDamageProfileTemplates.heavy_1_slam_target_os = {
    default_target = {
      dot_template_name = "burning_dot_1tick", -- "burning_3W_dot"
      power_distribution = {
        impact = 0.25,
        attack = 0.15
      },
      attack_template = "flame_blast",
      boost_curve_type = "tank_curve"
    },
    ignore_stagger_reduction = true,
    armor_modifier = {
      impact = {
        1,
        0.8,
        1,
        1,
        1
      },
      attack = {
        1,
        0.5,
        1,
        1,
        0.5
      }
    },
    targets = {
    },
    charge_value = "heavy_attack",
    critical_strike = {
      impact = {
        1,
        0.8,
        1,
        1,
        1
      },
      attack = {
        1,
        0.5,
        1,
        1,
        0.5
      }
    },
    stagger_duration_modifier = 1.75
  }

  NewDamageProfileTemplates.heavy_1_slam_aoe_os = {
    no_damage = true,
    default_target = {
      dot_template_name = "burning_dot_1tick",
      power_distribution = {
        impact = 0.15,
        attack = 0
      },
      boost_curve_type = "tank_curve",
      dead_attack_template = "flame_blast",
      attack_template = "blunt_fencer"
    },
    ignore_stagger_reduction = true,
    armor_modifier = {
      impact = {
        1,
        0.5,
        1,
        1,
        1
      },
      attack = {
        1,
        0,
        1,
        1,
        0.5
      }
    },
    targets = {
    },
    charge_value = "heavy_attack",
    critical_strike = {
      impact = {
        1,
        0.5,
        1,
        1,
        1
      },
      attack = {
        1,
        0,
        1,
        1,
        0.5
      }
    },
    stagger_duration_modifier = 1.5
  }

  Weapons.flaming_sword_template_1.actions.action_one.heavy_attack_spell.damage_profile_target = "heavy_1_slam_os"
  Weapons.flaming_sword_template_1.actions.action_one.heavy_attack_spell.damage_profile = "heavy_1_slam_target_os"
  Weapons.flaming_sword_template_1.actions.action_one.heavy_attack_spell.damage_profile_aoe = "heavy_1_slam_aoe_os"
  Weapons.flaming_sword_template_1.actions.action_one.heavy_attack_spell.push_radius = 1.75 -- 2.5


  --Weapons.flaming_sword_template_1.actions.action_one.light_attack_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  --Weapons.flaming_sword_template_1.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT

  --Weapons.flaming_sword_template_1.actions.action_one.light_attack_bopp.hit_mass_count = LINESMAN_HIT_MASS_COUNT

  -- Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT
