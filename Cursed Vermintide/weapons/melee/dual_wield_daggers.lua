local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.dual_daggers_lights_os = {
    default_target = {
      boost_curve_coefficient_headshot = 3,
      power_distribution = {
        attack = 0.075,
        impact = 0.075
      },
      attack_template = "light_slashing_linesman_hs",
      boost_curve_type = "ninja_curve"
    },
    charge_value = "light_attack",
    armor_modifier = {
      impact = {
        1,
        0.1,
        0.5,
        1,
        0.75
      },
      attack = {
        1, -- 1
        0,
        1.5,
        1,
        0.75
      }
    },
    targets = {
      {
        dot_template_name = "weapon_bleed_dot_dagger",
        power_distribution = {
          attack = 0.12,
          impact = 0.08
        },
        boost_curve_type = "ninja_curve",
        attack_template = "light_slashing_linesman_hs",
        boost_curve_coefficient_headshot = 4 -- 3
      }
    },
    require_damage_for_dot = true,
    critical_strike = {
      attack_armor_power_modifer = {
        1, -- 1
        0.5,
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
      impact = 0.1,
      attack = 0.1
    }
  }

  NewDamageProfileTemplates.dual_daggers_heavies_os = {
    melee_boost_override = 4,
    default_target = {
      boost_curve_coefficient_headshot = 2,
      boost_curve_coefficient = 0.75,
      boost_curve_type = "smiter_curve",
      power_distribution = {
        impact = 0.075,
        attack = 0.1
      },
      attack_template = "stab_smiter"
    },
    armor_modifier = {
      impact = {
        1,
        1,
        1,
        1,
        0.75
      },
      attack = {
        1, -- 1
        0.85, -- 0.75
        2.25,
        1,
        0.75
      }
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 2,
        boost_curve_coefficient = 1.5,
        boost_curve_type = "smiter_curve",
        power_distribution = {
          impact = 0.1,
          attack = 0.24
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
            1.2, -- 1
            0.85, -- 0.8
            2.5,
            1,
            0.75
          }
        },
        attack_template = "stab_smiter"
      }
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.33333333333, -- 1
        1, -- 1
        2.5,
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
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    }
  }

--Weapons.dual_wield_daggers_template_1.actions.action_one.light_attack_left.damage_profile = "dual_daggers_lights_os"
--Weapons.dual_wield_daggers_template_1.actions.action_one.light_attack_right.damage_profile = "dual_daggers_lights_os"
--Weapons.dual_wield_daggers_template_1.actions.action_one.light_attack_quick_left.damage_profile = "dual_daggers_lights_os"
--Weapons.dual_wield_daggers_template_1.actions.action_one.light_attack_last.damage_profile = "dual_daggers_lights_os"

Weapons.dual_wield_daggers_template_1.actions.action_one.heavy_attack.damage_profile_left = "dual_daggers_heavies_os"
Weapons.dual_wield_daggers_template_1.actions.action_one.heavy_attack.damage_profile_right = "dual_daggers_heavies_os"
Weapons.dual_wield_daggers_template_1.actions.action_one.heavy_attack_stab.damage_profile_left = "dual_daggers_heavies_os"
Weapons.dual_wield_daggers_template_1.actions.action_one.heavy_attack_stab.damage_profile_right = "dual_daggers_heavies_os"

--Weapons.dual_wield_daggers_template_1.actions.action_one.light_attack_left.additional_critical_strike_chance = 0.1
--Weapons.dual_wield_daggers_template_1.actions.action_one.light_attack_right.additional_critical_strike_chance = 0.1
--Weapons.dual_wield_daggers_template_1.actions.action_one.heavy_attack.allowed_chain_actions[5].start_time = 0.35
--Weapons.dual_wield_daggers_template_1.actions.action_one.heavy_attack_stab.allowed_chain_actions[5].start_time = 0.35
--Weapons.dual_wield_daggers_template_1.max_fatigue_points = 6
--Weapons.dual_wield_daggers_template_1.buffs.change_dodge_distance.external_optional_multiplier = 1.25
--Weapons.dual_wield_daggers_template_1.buffs.change_dodge_speed.external_optional_multiplier = 1.25