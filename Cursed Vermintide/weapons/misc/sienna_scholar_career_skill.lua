local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.pyro_ult_damage_profile_os = {
    armor_modifier_near = {
      impact = {
        1.5,
        1.5,
        2.5,
        0.25,
        1.5,
        0.75
      },
      attack = {
        2.5, -- 1.5
        2.5, -- 1.5
        2.5,
        0.25,
        1.5,
        0.75
      }
    },
    cleave_distribution = {
      impact = 0.5,
      attack = 0.5
    },
    critical_strike = {
      attack_armor_power_modifer = {
        2.5, -- 1.5
        2.5, -- 1.5
        2.5,
        0.25,
        1.5,
        0.75
      },
      impact_armor_power_modifer = {
        1.5,
        1.5,
        2.5,
        0.25,
        1.5,
        0.75
      }
    },
    max_friendly_damage = 0,
    no_stagger_damage_reduction_ranged = true,
    default_target = {
      boost_curve_coefficient_headshot = 2.5,
      boost_curve_coefficient = 0.75,
      power_distribution_far = {
        impact = 1,
        attack = 0.75
      },
      boost_curve_type = "ninja_curve",
      power_distribution_near = {
        impact = 1,
        attack = 0.75
      },
      attack_template = "wizard_staff_spear",
      range_dropoff_settings = {
        dropoff_end = 50,
        dropoff_start = 30
      }
    },
    targets = {
    },
    charge_value = "projectile",
    armor_modifier_far = {
      impact = {
        1.5,
        1.5,
        2.5,
        0.25,
        1.5,
        0.75
      },
      attack = {
        2, -- 1.5
        2, -- 1.5
        2.5,
        0.25,
        1.5,
        0.75
      }
    },
    is_explosion = true
  }

Weapons.sienna_scholar_career_skill_weapon.actions.action_career_release.default.impact_data.damage_profile = "pyro_ult_damage_profile_os"
Weapons.sienna_scholar_career_skill_weapon.actions.action_career_release.default.total_time = 0.5

--ActivatedAbilitySettings.bw_1[1].cooldown = 40
