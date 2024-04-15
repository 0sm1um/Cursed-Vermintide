local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

local push_radius = 1.25
local shield_bash_stagger_duration_mod_aoe = 0.75 -- 1.5

NewDamageProfileTemplates.flail_shield_heavy_os = {
    armor_modifier = {
      impact = {
        1,
        1,
        0.5,
        1,
        0.75
      },
      attack = {
        1.3,
        0.8,
        1.3,
        1.3,
        1
      }
    },
    targets = {
      {
        attack_template = "blunt_tank",
        power_distribution = {
          impact = 0.25,
          attack = 0.25
        },
        stagger_duration_modifier = 1.5,
        boost_curve_type = "tank_curve"
      },
      {
        attack_template = "blunt_tank",
        power_distribution = {
          impact = 0.133,
          attack = 0.133
        },
        stagger_duration_modifier = 1.5,
        boost_curve_type = "tank_curve"
      },
      {
        attack_template = "light_blunt_tank",
        power_distribution = {
          impact = 0.1,
          attack = 0.075
        },
        stagger_duration_modifier = 1.5,
        boost_curve_type = "tank_curve"
      }
    },
    default_target = {
      attack_template = "light_blunt_tank",
      power_distribution = {
        impact = 0.05,
        attack = 0.05
      },
      stagger_duration_modifier = 1.5,
      boost_curve_type = "tank_curve"
    },
    cleave_distribution = {
      impact = 0.5, -- 0.65
      attack = 0.6
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.3,
        1,
        1.3,
        1.3,
        1.3
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

  NewDamageProfileTemplates.priest_shield_slam_shotgun_aoe_os = {
    no_damage = true,
    armor_modifier = {
      impact = {
        1,
        0.5,
        0.5,
        1,
        0.75
      },
      attack = {
        1,
        0,
        1,
        1,
        0.75
      }
    },
    targets = {
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.25,
        1,
        1,
        1
      },
      impact_armor_power_modifer = {
        1,
        0.6,
        0.5,
        1,
        1
      }
    },
    stagger_duration_modifier = shield_bash_stagger_duration_mod_aoe, -- nil
    default_target = {
      attack_template = "blunt_fencer",
      power_distribution = {
        impact = 0.075,
        attack = 0
      },
      dead_attack_template = "blunt_fencer",
      boost_curve_type = "tank_curve"
    }
  }


Weapons.one_handed_flail_shield_template.actions.action_one.heavy_attack.damage_profile = "flail_shield_heavy_os"
Weapons.one_handed_flail_shield_template.actions.action_one.heavy_attack_02.damage_profile = "flail_shield_heavy_os"

Weapons.one_handed_flail_shield_template.actions.action_one.light_attack_03.damage_profile_target = "shield_slam_target_os"
Weapons.one_handed_flail_shield_template.actions.action_one.light_attack_03.damage_profile_aoe = "shield_slam_aoe_os"
Weapons.one_handed_flail_shield_template.actions.action_one.light_attack_03.push_radius = push_radius
