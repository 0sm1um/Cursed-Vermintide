local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.flail_heavy_os = {
    armor_modifier = {
      impact = {
        1,
        1,
        0.5,
        1,
        0.75
      },
      attack = {
        1.,
        0.5, -- 0.8
        1.,
        0.75, -- 1.3
        0.5 -- 1
      }
    },
    targets = {
      {
        attack_template = "blunt_tank",
        power_distribution = {
          impact = 0.3,
          attack = 0.425
        },
        stagger_duration_modifier = 1.8,
        boost_curve_coefficient_headshot = 1., -- 1
        boost_curve_type = "tank_curve"
      },
      {
        attack_template = "blunt_tank",
        power_distribution = {
          impact = 0.15,
          attack = 0.25 -- 0.15
        },
        boost_curve_coefficient_headshot = 1., -- 1
        stagger_duration_modifier = 1.8,
        boost_curve_type = "tank_curve"
      },
      {
        attack_template = "light_blunt_tank",
        power_distribution = {
          impact = 0.1,
          attack = 0.15 -- 0.075
        },
        stagger_duration_modifier = 1.8,
        boost_curve_type = "tank_curve"
      }
    },
    default_target = {
      attack_template = "light_blunt_tank",
      power_distribution = {
        impact = 0.05,
        attack = 0.1 -- 0.05
      },
      stagger_duration_modifier = 1.8,
      boost_curve_type = "tank_curve"
    },
    cleave_distribution = {
      impact = 0.5, -- 0.65
      attack = 0.5 -- 0.6
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.3,
        0.75,
        1,
        0.75,
        0.75
      },
      impact_armor_power_modifer = {
        1,
        1,
        0.5,
        1,
        1
      }
    },
    stagger_duration_modifier = 1.5 -- 1.5
  }

  NewDamageProfileTemplates.flail_light_os = {
    armor_modifier = {
      impact = {
        1,
        1,
        0.5,
        1,
        1
      },
      attack = {
        1., -- 1
        0.25, -- 0.25
        1.5,
        1,
        0.25
      }
    },
    targets = {
      {
        attack_template = "blunt_tank",
        power_distribution = {
          impact = 0.125,
          attack = 0.2
        },
        boost_curve_type = "tank_curve",
        boost_curve_coefficient_headshot = 1.25, -- 1
      },
      {
        attack_template = "light_blunt_tank",
        power_distribution = {
          impact = 0.1,
          attack = 0.075
        },
        boost_curve_type = "tank_curve"
      }
    },
    default_target = {
      attack_template = "light_blunt_tank",
      power_distribution = {
        impact = 0.075,
        attack = 0.075
      },
      boost_curve_type = "tank_curve"
    },
    cleave_distribution = {
      impact = 0.3, -- 0.25 
      attack = 0.25 -- 0.25
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1., -- 1
        0.25, -- 0.5
        2,
        1,
        0.25
      },
      impact_armor_power_modifer = {
        1,
        1,
        0.5,
        1,
        1
      }
    },
    stagger_duration_modifier = 1.5
  }

  NewDamageProfileTemplates.flail_overhead_light_os = {
    default_target = {
      attack_template = "light_blunt_smiter",
      power_distribution = {
        attack = 0.3, -- 0.25
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
        1.25, -- 1.25
        0.75, -- 0.65
        2.5,
        1, -- 1
        0.75, -- 0.75
        0.75
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
            0.25
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
        0.75, -- 1
        2.5,
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
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    }
  }

  --Weapons.one_handed_flail_template_1.actions.action_one.heavy_attack.anim_time_scale = 1.2
  --Weapons.one_handed_flail_template_1.actions.action_one.heavy_attack_left.anim_time_scale = 1.2
  Weapons.one_handed_flail_template_1.actions.action_one.heavy_attack.damage_profile = "flail_heavy_os"
  Weapons.one_handed_flail_template_1.actions.action_one.heavy_attack_left.damage_profile = "flail_heavy_os"

  Weapons.one_handed_flail_template_1.actions.action_one.light_attack_left.damage_profile = "flail_light_os"
  Weapons.one_handed_flail_template_1.actions.action_one.light_attack_right.damage_profile = "flail_light_os"
  Weapons.one_handed_flail_template_1.actions.action_one.light_attack_down.damage_profile = "flail_overhead_light_os"
  Weapons.one_handed_flail_template_1.actions.action_one.light_attack_last.damage_profile = "flail_overhead_light_os"

  Weapons.one_handed_flail_template_1.actions.action_one.light_attack_bopp.damage_profile = "flail_light_os"
  -- Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT

local buff_data = {
  {
    start_time = 0,
    external_multiplier = 1.2,
    end_time = 0.3,
    buff_name = "planted_decrease_movement"
  },
  {
    start_time = 0.3,
    external_multiplier = 0.85,
    end_time = 0.4,
    buff_name = "planted_fast_decrease_movement"
  }
}

  Weapons.one_handed_flail_template_1.actions.action_one.heavy_attack.buff_data = buff_data
  Weapons.one_handed_flail_template_1.actions.action_one.heavy_attack_left.buff_data = buff_data
  Weapons.one_handed_flail_template_1.actions.action_one.heavy_attack.buff_data = buff_data
  Weapons.one_handed_flail_template_1.actions.action_one.heavy_attack_left.buff_data = buff_data
