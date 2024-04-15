local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

	NewDamageProfileTemplates.rapier_heavy_charged_os =  {
    default_target = {
      boost_curve_coefficient_headshot = 2.5,
      power_distribution = {
        impact = 0.125,
        attack = 0.55
      },
      attack_template = "stab_smiter",
      boost_curve_type = "smiter_curve"
    },
    armor_modifier = {
      impact = {
        1,
        0.25,
        0.5,
        1,
        1,
        0.25
      },
      attack = {
        1,
        0.66, -- 0.4
        1.5,
        1,
        1,
        0.66 -- 0.25
      }
    },
    targets = {
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.75,
        2,
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
      impact = 0.075,
      attack = 0.075
    }
  }

    Weapons.fencing_sword_template_1.actions.action_one.heavy_attack_charged.damage_profile = "rapier_heavy_charged_os"
