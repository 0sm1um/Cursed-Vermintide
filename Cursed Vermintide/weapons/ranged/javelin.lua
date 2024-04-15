local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.thrown_javelin_os = {
    charge_value = "projectile",
    no_stagger_damage_reduction_ranged = true,
    shield_break = true,
    critical_strike = {
        attack_armor_power_modifer = {
            1,
            1,
            1.3,
            1,
            0.75,
            0.5
        },
        impact_armor_power_modifer = {
            1,
            1,
            1,
            1,
            1,
            0.75
        }
    },
    armor_modifier_near = {
        attack = {
            1,
            0.7, -- 0.63
            1.1,
            1,
            0.75,
            0.25 -- 0.2
        },
        impact = {
            1,
            1,
            1,
            1,
            1,
            0.75
        }
    },
    armor_modifier_far = {
        attack = {
            1,
            0.63,
            1.1,
            1,
            0.75,
            0.25
        },
        impact = {
            1,
            1,
            1,
            1,
            1,
            0.5
        }
    },
    cleave_distribution = {
        attack = 0.8, -- 0.15
        impact = 0.8 -- 0.15
    },
    default_target = {
        boost_curve_coefficient_headshot = 1.6,
        boost_curve_type = "smiter_curve",
        boost_curve_coefficient = 1,
        attack_template = "projectile_javelin",
        power_distribution_near = {
            attack = 0.8, -- 0.76
            impact = 0.85
        },
        power_distribution_far = {
            attack = 0.8, -- 0.5
            impact = 0.85
        },
        range_dropoff_settings = sniper_dropoff_ranges
    }
}

  Weapons.javelin_template.actions.action_one.throw_charged.impact_data.damage_profile = "thrown_javelin_os"

  --Weapons.flaming_sword_template_1.actions.action_one.light_attack_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  --Weapons.flaming_sword_template_1.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT

  --Weapons.flaming_sword_template_1.actions.action_one.light_attack_bopp.hit_mass_count = LINESMAN_HIT_MASS_COUNT

  -- Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT
