local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.elven_spear_slash_os = {
  default_target = {
    attack_template = "light_slashing_linesman",
    power_distribution = {
      impact = 0.075, -- 0.05
      attack = 0.075
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
      boost_curve_coefficient_headshot = 4,
      power_distribution = {
        impact = 0.2, -- 0.2
        attack = 0.175
      },
      attack_template = "slashing_linesman",
      boost_curve_type = "linesman_curve"
    },
    {
      boost_curve_coefficient_headshot = 3,
      power_distribution = {
        impact = 0.2, -- 0.175
        attack = 0.125 -- 0.125
      },
      attack_template = "slashing_linesman",
      boost_curve_type = "linesman_curve"
    },
    {
      boost_curve_coefficient_headshot = 2.5,
      power_distribution = {
        impact = 0.125,
        attack = 0.1  -- 0.1
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
    impact = 0.25, -- 0.2
    attack = 0.3 -- 0.35
  }
}

NewDamageProfileTemplates.elven_spear_light_stab_os =  {
  melee_boost_override = 2.5,
  targets = {
  },
  armor_modifier = {
    impact = {
      1,
      0.75,
      1,
      1,
      0.75
    },
    attack = {
      1.2, -- 1
      0.3, -- 0.25
      2.25,
      1,
      0.4
    }
  },
  cleave_distribution = {
    impact = 0.075,
    attack = 0.075
  },
  charge_value = "light_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1.2, -- 1
      0.45, -- 0.4
      2.5,
      1,
      0.4
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
    boost_curve_coefficient_headshot = 2,
    boost_curve_coefficient = 1,
    boost_curve_type = "ninja_curve",
    power_distribution = {
      impact = 0.125,
      attack = 0.25
    },
    attack_template = "stab_smiter"
  }
}

NewDamageProfileTemplates.elven_spear_heavy_stab_os =  {
  melee_boost_override = 2.5,
  targets = {
    {
      boost_curve_coefficient_headshot = 2,
      boost_curve_coefficient = 0.75,
      boost_curve_type = "ninja_curve",
      power_distribution = {
        impact = 0.25,
        attack = 0.45
      },
      armor_modifier = {
        impact = {
          1,
          0.65,
          1,
          1,
          0.75
        },
        attack = {
          1,
          0.45, -- 0.45
          2,
          1,
          0.45
        }
      },
      attack_template = "heavy_stab_smiter"
    }
  },
  armor_modifier = {
    impact = {
      1,
      0.5,
      1,
      1,
      0.45
    },
    attack = {
      1,
      0.4, -- 0.3
      2,
      1,
      0.45
    }
  },
  cleave_distribution = {
    impact = 0.075,
    attack = 0.075
  },
  charge_value = "heavy_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1,
      0.5, -- 0.5
      2.5,
      1,
      0.45
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
    boost_curve_coefficient_headshot = 1,
    boost_curve_coefficient = 0.75,
    boost_curve_type = "ninja_curve",
    power_distribution = {
      impact = 0.15,
      attack = 0.2
    },
    attack_template = "heavy_stab_smiter"
  }
}

NewDamageProfileTemplates.elven_spear_heavy_slash_os = {
  targets = {
    {
      boost_curve_coefficient_headshot = 1,
      power_distribution = {
        impact = 0.25,
        attack = 0.325
      },
      boost_curve_type = "linesman_curve",
      armor_modifier = {
        impact = {
          0.9,
          0.5,
          1,
          1,
          0.75
        },
        attack = {
          1,
          0.85, -- 0.5
          1.5,
          1,
          0.75
        }
      },
      attack_template = "heavy_slashing_linesman"
    },
    {
      boost_curve_coefficient_headshot = 1,
      power_distribution = {
        impact = 0.175,
        attack = 0.25
      },
      attack_template = "heavy_slashing_linesman",
      boost_curve_type = "linesman_curve"
    },
    {
      attack_template = "slashing_linesman",
      power_distribution = {
        impact = 0.15,
        attack = 0.15
      },
      boost_curve_type = "linesman_curve"
    },
    {
      attack_template = "slashing_linesman",
      power_distribution = {
        impact = 0.125,
        attack = 0.125
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
      0.8, -- 0.3 
      2,
      1,
      1
    }
  },
  cleave_distribution = {
    impact = 0.3,
    attack = 0.4
  },
  charge_value = "heavy_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1,
      0.66, -- 0.5
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
  default_target = {
    boost_curve_coefficient_headshot = 0.25,
    power_distribution = {
      impact = 0.05,
      attack = 0.075
    },
    attack_template = "light_slashing_linesman",
    boost_curve_type = "linesman_curve"
  }
}

--Weapons.two_handed_spears_elf_template_1.max_fatigue_points = 4 -- 6
--Weapons.two_handed_spears_elf_template_1.actions.action_one.push.fatigue_cost = action_push


--Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_left.damage_profile = "elven_spear_slash_os"
Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_right.damage_profile = "elven_spear_slash_os"
Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_bopp.damage_profile = "elven_spear_slash_os"

--Weapons.two_handed_spears_elf_template_1.actions.action_one.heavy_attack_stab.damage_profile = "elven_spear_heavy_stab_os"
Weapons.two_handed_spears_elf_template_1.actions.action_one.heavy_attack_left.damage_profile = "elven_spear_heavy_slash_os"

--Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_bopp.additional_critical_strike_chance = 0.1

Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_bopp.buff_data = {}

--Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_bopp.weapon_up_offset_mod = 1 -- 0.25

Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_bopp.range_mod = 1.2 -- 1.2

-- Light attack stabs made to impact same point as heavy stabs
Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_left.baked_sweep = Weapons.two_handed_spears_elf_template_1.actions.action_one.heavy_attack_stab.baked_sweep
Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_stab_1.baked_sweep = Weapons.two_handed_spears_elf_template_1.actions.action_one.heavy_attack_stab.baked_sweep
Weapons.two_handed_spears_elf_template_1.actions.action_one.light_attack_stab_2.baked_sweep = Weapons.two_handed_spears_elf_template_1.actions.action_one.heavy_attack_stab.baked_sweep
