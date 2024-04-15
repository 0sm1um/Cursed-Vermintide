local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

  NewDamageProfileTemplates.elven_SnD_cleave_lights_os = {
    targets = {
      {
        boost_curve_coefficient_headshot = 1.5,
        power_distribution = {
          impact = 0.075,
          attack = 0.135
        },
        attack_template = "light_slashing_linesman_hs",
        boost_curve_type = "ninja_curve"
      },
      {
        boost_curve_coefficient_headshot = 1,
        power_distribution = {
          impact = 0.05,
          attack = 0.09
        },
        attack_template = "light_slashing_linesman",
        boost_curve_type = "linesman_curve"
      }
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
        1,
        0,
        2,
        1,
        1
      }
    },
    cleave_distribution = {
      impact = 0.2,
      attack = 0.15 -- 0.15
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.3,
        2.5,
        1,
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
    default_target = {
      attack_template = "light_slashing_linesman",
      power_distribution = {
        impact = 0.05,
        attack = 0.075
      },
      boost_curve_type = "linesman_curve"
    }
  }


Weapons.dual_wield_sword_dagger_template_1.actions.action_one.light_attack_right_first.damage_profile = "elven_SnD_cleave_lights_os"
Weapons.dual_wield_sword_dagger_template_1.actions.action_one.light_attack_right_second.damage_profile = "elven_SnD_cleave_lights_os"

Weapons.dual_wield_sword_dagger_template_1.actions.action_one.light_attack_right_first.hit_mass_count = LINESMAN_HIT_MASS_COUNT
Weapons.dual_wield_sword_dagger_template_1.actions.action_one.light_attack_right_second.hit_mass_count = LINESMAN_HIT_MASS_COUNT
