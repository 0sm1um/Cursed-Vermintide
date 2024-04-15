local mod = get_mod("Vermintide Balance Manager")

    NewDamageProfileTemplates = NewDamageProfileTemplates or {}

  NewDamageProfileTemplates.shot_shotgun_ability = {
    armor_modifier_near = {
      impact = {
        1,
        0.5,
        100,
        0.25,
        1,
        0
      },
      attack = {
        1,
        0.1,
        0.2,
        0.05, -- 0.25
        1,
        0
      }
    },
    cleave_distribution = {
      impact = 0.3,
      attack = 0.3
    },
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.1,
        0.2,
        0.05, -- 0.25
        1,
        0.025
      },
      impact_armor_power_modifer = {
        1,
        0.5,
        200,
        0.25,
        1,
        0.05
      }
    },
    no_stagger_damage_reduction_ranged = true,
    targets = {
    },
    default_target = {
      boost_curve_coefficient_headshot = 0.25,
      boost_curve_coefficient = 0.25,
      power_distribution_far = {
        impact = 0.25,
        attack = 0.25
      },
      boost_curve_type = "ninja_curve",
      power_distribution_near = {
        impact = 0.5,
        attack = 0.5
      },
      attack_template = "shot_sniper",
      range_dropoff_settings = {
        dropoff_end = 50,
        dropoff_start = 30
      }
    },
    charge_value = "instant_projectile",
    armor_modifier_far = {
      impact = {
        1,
        0.5,
        200,
        0.25,
        1,
        0
      },
      attack = {
        1,
        0,
        0.2,
        0,
        1,
        0
      }
    },
    shield_break = true,
    is_explosion = true
}

Weapons.victor_bountyhunter_career_skill_weapon.actions.action_career_release.default.shot_count = 7 -- 10
