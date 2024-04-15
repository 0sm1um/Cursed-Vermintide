local mod = get_mod("Vermintide Balance Manager")

local push_radius = 1.5 -- 2.5
local shield_bash_stagger_duration_mod = 1 -- 1.75
local shield_bash_stagger_duration_mod_aoe = 1 -- 1.5
local range_mod = 1.15 -- 1.35

	NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.inner_push_spear_shield_os = {
    no_damage = true,
    ignore_stagger_reduction = true,
    cleave_distribution = {
      impact = 1,
      attack = 0
    },
    stagger_duration_modifier = 1.8,
    targets = {
    },
    armor_modifier = {
      impact = {
        1,
        0.8, -- 0.75
        0.5,
        1.5, -- 1
        1
      },
      attack = {
        0,
        0,
        0,
        0,
        0
      }
    },
    critical_strike = {
      attack_armor_power_modifer = {
        0,
        0,
        0,
        0,
        0
      },
      impact_armor_power_modifer = {
        3,
        3,
        3,
        3,
        3
      },
    },
    damage_type = "push",
    charge_value = "action_push",
    is_push = true,
    default_target = {
      damage_type = "push",
      power_distribution = {
        impact = 0.2, -- 0.2
        attack = 0
      },
      attack_template = "basic_sweep_push",
      boost_curve_type = "default"
    }
  }

NewDamageProfileTemplates.outer_push_spear_shield_os = {
    no_damage = true,
    damage_type = "push",
    is_push = true,
    targets = {
    },
    armor_modifier = {
      impact = {
        1,
        0.5,
        0.5,
        1,
        0.75 -- 0.5
      },
      attack = {
        0,
        0,
        0,
        0,
        0
      }
    },
    stagger_duration_modifier = 1.4, -- 1.3
    charge_value = "action_push",
    default_target = {
      damage_type = "push",
      power_distribution = {
        impact = 0.2,
        attack = 0
      },
      attack_template = "basic_sweep_push",
      boost_curve_type = "default"
    },
    cleave_distribution = {
      impact = 0.125,
      attack = 0
    }
  }

NewDamageProfileTemplates.spear_cleave_stagger = {
    melee_boost_override = 3.5,
    default_target = {
      attack_template = "light_slashing_linesman",
      power_distribution = {
        impact = 0.05,
        attack = 0.075
      },
      boost_curve_type = "linesman_curve"
    },
    armor_modifier = {
      impact = {
        1,
        0.25,
        0.5,
        1,
        1
      },
      attack = {
        1,
        0.25,
        2,
        1,
        1
      }
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 2,
        power_distribution = {
          impact = 0.125,
          attack = 0.15
        },
        boost_curve_type = "ninja_curve",
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
            0.4,
            2,
            1,
            1
          },
          stagger_duration_modifier = 1.4, -- 1.3
        },
        attack_template = "light_slashing_linesman_hs"
      },
      {
        boost_curve_coefficient_headshot = 1,
        power_distribution = {
          impact = 0.075,
          attack = 0.125
        },
        attack_template = "light_slashing_linesman",
        boost_curve_type = "linesman_curve"
      }
    },
    charge_value = "heavy_attack",
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
        0.75,
        0.5,
        1,
        1
      }
    },
    cleave_distribution = {
      impact = 0.2,
      attack = 0.25
    }
  }

NewDamageProfileTemplates.spear_heavy_1 = {
  targets = {
    {
      boost_curve_coefficient_headshot = 1,
      power_distribution = {
        attack = 0.3,
        impact = 0.2
      },
      boost_curve_type = "tank_curve",
      attack_template = "slashing_tank",
      armor_modifier = {
        attack = {
          1,
          0.5,
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
    },
    {
      attack_template = "slashing_tank",
      power_distribution = {
        attack = 0.15,
        impact = 0.15
      },
      boost_curve_type = "tank_curve"
    },
    {
      attack_template = "light_slashing_tank",
      power_distribution = {
        attack = 0.1,
        impact = 0.1
      },
      boost_curve_type = "tank_curve"
    }
  },
  armor_modifier = {
    impact = {
      1,
      1,
      0.5,
      1,
      0.75
    },
    attack = {
      1,
      0.35,
      1,
      1,
      0.75
    }
  },
  default_target = {
    attack_template = "light_slashing_tank",
    power_distribution = {
      attack = 0.075,
      impact = 0.05
    },
    boost_curve_type = "tank_curve"
  },
  cleave_distribution = {
    impact = 0.8,
    attack = 0.4 -- 0.3
  },
  charge_value = "heavy_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1.5, -- 1
      1, -- 0.5
      1.5, -- 1
      1.5, -- 1
      1 -- 1
    },
    impact_armor_power_modifer = {
      1, -- 1
      1, -- 1
      0.5, -- 0.5
      1, -- 1
      1 -- 1
    }
  },
  stagger_duration_modifier = 1.5
}

Weapons.one_handed_spears_shield_template.actions.action_one.default.blocking_charge = true

Weapons.one_handed_spears_shield_template.actions.action_one.heavy_attack.hit_mass_count = HEAVY_LINESMAN_HIT_MASS_COUNT
Weapons.one_handed_spears_shield_template.actions.action_one.heavy_attack.slide_armour_hit = true

Weapons.one_handed_spears_shield_template.actions.action_one.push.impact_sound_event = "shield_hit"

--Weapons.one_handed_spears_shield_template.actions.action_one.push.spear_cleave_stagger

Weapons.one_handed_spears_shield_template.actions.action_one.push.damage_profile_inner = "inner_push_spear_shield_os"
--Weapons.one_handed_spears_shield_template.actions.action_one.push.damage_profile_outer = "inner_push_spear_shield_os"
--Weapons.one_handed_spears_shield_template.actions.action_one.push.damage_profile_outer = "outer_push_spear_shield_os"

  

