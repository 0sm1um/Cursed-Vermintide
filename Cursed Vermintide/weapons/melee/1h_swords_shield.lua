local mod = get_mod("Vermintide Balance Manager")

local push_radius = 1.25 -- 2.5
local shield_bash_stagger_duration_mod = 0.75 -- 1.75
local shield_bash_stagger_duration_mod_aoe = 0.75 -- 1.5

	NewDamageProfileTemplates = NewDamageProfileTemplates or {}

    NewDamageProfileTemplates.shield_slam_target_os = {
        shield_break = true,
        armor_modifier = {
          impact = {
            1,
            0.8,
            1,
            1,
            2,
            1.25
          },
          attack = {
            1,
            0.3,
            2,
            1,
            0.75
          }
        },
        default_target = {
          attack_template = "heavy_blunt_fencer",
          power_distribution = {
            impact = 0.375,
            attack = 0.2
          },
          boost_curve_type = "tank_curve"
        },
        targets = {
        },
        charge_value = "heavy_attack",
        critical_strike = {
          attack_armor_power_modifer = {
            1,
            0.5,
            2,
            1,
            1
          },
          impact_armor_power_modifer = {
            1,
            1,
            0.5,
            1,
            1
          }
        },
        stagger_duration_modifier = shield_bash_stagger_duration_mod
      }

      NewDamageProfileTemplates.shield_slam_aoe_os = {
        no_damage = true,
        default_target = {
          attack_template = "blunt_fencer",
          power_distribution = {
            impact = 0.125, -- 0.125
            attack = 0
          },
          dead_attack_template = "blunt_fencer",
          boost_curve_type = "tank_curve"
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
            0,
            0,
            1,
            0.75
          }
        },
        targets = {
        },
        charge_value = "heavy_attack",
        critical_strike = {
          attack_armor_power_modifer = {
            1,
            0.5,
            2,
            1,
            1
          },
          impact_armor_power_modifer = {
            1,
            1,
            0.5,
            1,
            1
          }
        },
        stagger_duration_modifier = shield_bash_stagger_duration_mod_aoe
      }

    Weapons.one_handed_sword_shield_template_1.actions.action_one.heavy_attack.damage_profile_target = "shield_slam_target_os"
    Weapons.one_handed_sword_shield_template_1.actions.action_one.heavy_attack.damage_profile_aoe = "shield_slam_aoe_os"
    Weapons.one_handed_sword_shield_template_1.actions.action_one.heavy_attack.push_radius = push_radius
