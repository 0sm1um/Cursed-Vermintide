local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.dagger_h1_impact = {
    default_target = {
      dot_template_name = "burning_3W_dot", -- burning_dot_1tick
      power_distribution = {
        impact = 0.1,
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

  NewDamageProfileTemplates.dagger_h1_aoe = {
    no_damage = true,
    default_target = {
      attack_template = "blunt_fencer",
      power_distribution = {
        impact = 0.075,
        attack = 0
      },
      dead_attack_template = "flame_blast",
      boost_curve_type = "tank_curve"
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

  NewDamageProfileTemplates.dagger_h1_aoe_target_os = {
    default_target = {
      dot_template_name = "burning_dot_1tick",
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

  NewDamageProfileTemplates.dagger_h2_os = {
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        1, -- 0.8
        2.5,
        1,
        1 -- 1.25
      },
      impact_armor_power_modifer = {
        1,
        0.8,
        1,
        1,
        1,
        0.5 -- 0.5
      }
    },
    default_target = {
      dot_template_name = "burning_3W_dot",
      power_distribution = {
        impact = 0.125,
        attack = 0.3 -- 0.275
      },
      boost_curve_type = "ninja_curve",
      boost_curve_coefficient_headshot = 1.5,
      attack_template = "flame_blast"
    },
    ignore_stagger_reduction = true,
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
        1, -- 0.8
        1.75,
        1,
        0.85 -- 0.75
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

  NewDamageProfileTemplates.dagger_lights_os = {
    targets = {
      {
        boost_curve_coefficient_headshot = 2.5,
        power_distribution = {
          impact = 0.05,
          attack = 0.125 -- 0.125
        },
        attack_template = "light_slashing_linesman_hs",
        boost_curve_type = "ninja_curve"
      }
    },
    armor_modifier = {
      impact = {
        1,
        0.1,
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
      impact = 0.1,
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
        0.1,
        0.5,
        1,
        1
      }
    },
    default_target = {
      attack_template = "light_slashing_linesman_hs",
      power_distribution = {
        impact = 0.05,
        attack = 0.075 -- 0.075
      },
      boost_curve_type = "ninja_curve"
    }
  }

  Weapons.one_handed_daggers_template_1.actions.action_one.heavy_attack_left.damage_profile_target = "dagger_h1_aoe_target_os"
  Weapons.one_handed_daggers_template_1.actions.action_one.heavy_attack_left.damage_profile = "dagger_h1_impact"
  Weapons.one_handed_daggers_template_1.actions.action_one.heavy_attack_left.damage_profile_aoe = "dagger_h1_aoe"
  Weapons.one_handed_daggers_template_1.actions.action_one.heavy_attack_left.anim_time_scale = 1.4 -- 1.2
  Weapons.one_handed_daggers_template_1.actions.action_one.heavy_attack_left.push_radius = 1.75 -- 2.5


  Weapons.one_handed_daggers_template_1.actions.action_one.heavy_attack_right.damage_template = "dagger_h2_os"

  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_left.damage_template = "dagger_lights_os"
  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_right.damage_template = "dagger_lights_os"
  --Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_stab.damage_template = "dagger_lights_os"
  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_last.damage_template = "dagger_lights_os"

  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_last.hit_mass_count = LINESMAN_HIT_MASS_COUNT

  --Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_last.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  --[[
  Weapons.one_handed_daggers_template_1.actions.action_one.heavy_attack_left.
  Weapons.one_handed_daggers_template_1.actions.action_one.heavy_attack_right.

  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_left.
  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_right.
  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_stab.

  Weapons.one_handed_daggers_template_1.actions.action_one.light_attack_bopp.
  --]]
  -- Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT
