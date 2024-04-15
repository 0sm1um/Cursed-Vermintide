local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates.billhook_sweep_os = {
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
          impact = 0.2,
          attack = 0.175
        },
        attack_template = "slashing_linesman",
        boost_curve_type = "linesman_curve"
      },
      {
        boost_curve_coefficient_headshot = 3,
        power_distribution = {
          impact = 0.175,
          attack = 0.125
        },
        attack_template = "slashing_linesman",
        boost_curve_type = "linesman_curve"
      },
      {
        boost_curve_coefficient_headshot = 2.5,
        power_distribution = {
          impact = 0.1,
          attack = 0.1
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
      impact = 0.2,
      attack = 0.2 -- 0.35
    }
  }

  Weapons.two_handed_billhooks_template.actions.action_one.light_attack_left.damage_profile = "billhook_sweep_os"
  Weapons.two_handed_billhooks_template.actions.action_one.light_attack_bopp.damage_profile = "billhook_sweep_os"
