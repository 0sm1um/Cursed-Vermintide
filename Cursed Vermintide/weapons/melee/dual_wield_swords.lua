local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

  NewDamageProfileTemplates.elven_dual_swords_lights_os =  {
    default_target = {
      attack_template = "light_slashing_linesman",
      power_distribution = {
        impact = 0.05,
        attack = 0.1
      },
      boost_curve_type = "linesman_curve"
    },
    armor_modifier = {
      impact = {
        1,
        0.2,
        0.5,
        1,
        1
      },
      attack = {
        1.,
        0,
        2,
        1, -- 1
        1
      }
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 2, -- 1.5
        power_distribution = {
          impact = 0.075,
          attack = 0.135 -- 1.35
        },
        attack_template = "light_slashing_linesman_hs",
        boost_curve_type = "ninja_curve"
      },
      {
        boost_curve_coefficient_headshot = 1,
        power_distribution = {
          impact = 0.05,
          attack = 0.108 -- 0.09
        },
        attack_template = "light_slashing_linesman",
        boost_curve_type = "linesman_curve"
      }
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.,
        0.3,
        2.5,
        1, -- 1
        1
      },
      impact_armor_power_modifer = {
        1,
        0.25,
        0.5,
        1,
        1
      }
    },
    cleave_distribution = {
      impact = 0.2,
      attack = 0.2 -- 0.25
    }
  }

NewDamageProfileTemplates.elven_dual_swords_heavies_os = {
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
        0.66, -- 0.25
        2,
        1, -- 1
        0.66
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
            0.66, -- 0.25
            2,
            1, -- 1
            0.66
          }
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
        0.66, -- 0.5
        2.5,
        1,
        0.66
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
      attack = 0.35 -- 0.25
    }
  }

  NewDamageProfileTemplates.elven_dual_sword_stab_os = {
    targets = {
      {
        boost_curve_coefficient_headshot = 2,
        boost_curve_coefficient = 0.75,
        boost_curve_type = "smiter_curve",
        power_distribution = {
          impact = 0.1,
          attack = 0.2
        },
        armor_modifier = {
          impact = {
            1,
            0.5,
            1,
            1,
            0.75
          },
          attack = {
            1,
            1, -- 0.5
            1.5,
            1,
            1 -- 0.75
          }
        },
        attack_template = "stab_smiter"
      }
    },
    armor_modifier = {
      impact = {
        1,
        0.25,
        1,
        1,
        0.75
      },
      attack = {
        1,
        1, -- 0.5
        1.5,
        1,
        1 -- 0.75
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
        1, -- 0.75
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
    default_target = {
      boost_curve_coefficient_headshot = 2,
      boost_curve_coefficient = 0.75,
      boost_curve_type = "smiter_curve",
      power_distribution = {
        impact = 0.075,
        attack = 0.1
      },
      attack_template = "stab_smiter"
    }
  }

Weapons.dual_wield_swords_template_1.actions.action_one.light_attack_left.damage_profile = "elven_dual_swords_lights_os"
Weapons.dual_wield_swords_template_1.actions.action_one.light_attack_right.damage_profile = "elven_dual_swords_lights_os"
Weapons.dual_wield_swords_template_1.actions.action_one.light_attack_up_left.damage_profile = "elven_dual_swords_lights_os"
Weapons.dual_wield_swords_template_1.actions.action_one.light_attack_up_right.damage_profile = "elven_dual_swords_lights_os"

Weapons.dual_wield_swords_template_1.actions.action_one.light_attack_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT
Weapons.dual_wield_swords_template_1.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT
Weapons.dual_wield_swords_template_1.actions.action_one.light_attack_up_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT
Weapons.dual_wield_swords_template_1.actions.action_one.light_attack_up_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT

Weapons.dual_wield_swords_template_1.actions.action_one.push_stab.damage_profile = "elven_dual_sword_stab_os"

Weapons.dual_wield_swords_template_1.actions.action_one.heavy_attack.damage_profile_left = "elven_dual_swords_heavies_os"
Weapons.dual_wield_swords_template_1.actions.action_one.heavy_attack.damage_profile_right = "elven_dual_swords_heavies_os"
Weapons.dual_wield_swords_template_1.actions.action_one.heavy_attack_2.damage_profile_left = "elven_dual_swords_heavies_os"
Weapons.dual_wield_swords_template_1.actions.action_one.heavy_attack_2.damage_profile_right = "elven_dual_swords_heavies_os"
