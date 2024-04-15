local mod = get_mod("Vermintide Balance Manager")

Weapons.repeating_pistol_template_1.ammo_data = {
    ammo_hand = "right",
    ammo_per_reload = 8,
    max_ammo = 80,
    ammo_per_clip = 8,
    play_reload_anim_on_wield_reload = true,
    reload_time = 1.5,
    reload_on_ammo_pickup = true,
    should_update_anim_ammo = true
}

NewDamageProfileTemplates.shot_machinegun_shotgun_os = {
    armor_modifier_near = {
      impact = {
        1,
        0.25,
        1,
        1,
        1,
        0
      },
      attack = {
        1,
        0.25,
        1,
        1,
        1,
        0
      }
    },
    targets = {
    },
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.25,
        1,
        1,
        1,
        0.175
      },
      impact_armor_power_modifer = {
        1,
        0.25,
        1,
        1,
        1,
        0.125
      }
    },
    no_stagger_damage_reduction_ranged = true,
    default_target = {
      boost_curve_coefficient_headshot = 1,
      boost_curve_coefficient = 0.4,
      power_distribution_far = {
        impact = 0.05,
        attack = 0.233 -- 0.25
      },
      boost_curve_type = "ninja_curve",
      power_distribution_near = {
        impact = 0.15,
        attack = 0.275
      },
      range_modifier_settings = {
        dropoff_end = 30,
        dropoff_start = 10
      },
      attack_template = "shot_machinegun"
    },
    armor_modifier_far = {
      impact = {
        1,
        0,
        1,
        1,
        1,
        0
      },
      attack = {
        1,
        0,
        1,
        1,
        1,
        0
      }
    },
    charge_value = "projectile",
    name = "shot_machinegun_shotgun",
    cleave_distribution = {
      impact = 0.3,
      attack = 0.3
    }
  }

  Weapons.repeating_pistol_template_1.actions.action_one.bullet_spray.damage_profile = "shot_machinegun_shotgun_os"
  Weapons.repeating_pistol_template_1.actions.action_one.bullet_spray.spread_pitch = 0.75 -- 0.5
