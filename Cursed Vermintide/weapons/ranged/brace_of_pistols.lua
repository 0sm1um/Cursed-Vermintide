local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.brace_of_pistols_os = {
  armor_modifier_near = {
    impact = {
      1,
      0.75,
      1,
      1,
      1,
      0
    },
    attack = {
      1.5,
      0.75,
      1.5,
      1,
      1,
      0
    }
  },
  targets = {
  },
  critical_strike = {
    attack_armor_power_modifer = {
      1.5, -- 1.5
      0.75, -- 0.75
      1.5, -- 1.5
      1, -- 1
      1, -- 1
      0.5 -- 0.5
    },
    impact_armor_power_modifer = {
      1,
      0.75,
      1.5,
      1,
      1,
      0.5
    }
  },
  no_stagger_damage_reduction_ranged = true,
  default_target = {
    boost_curve_coefficient_headshot = 1.25, -- 1
    boost_curve_coefficient = 1,
    power_distribution_far = {
      impact = 0.25,
      attack = 0.3
    },
    boost_curve_type = "linesman_curve",
    power_distribution_near = {
      impact = 0.3,
      attack = 0.41
    },
    range_modifier_settings = {
      dropoff_end = 30, -- 30
      dropoff_start = 15 -- 15
    },
    attack_template = "shot_carbine"
  },
  armor_modifier_far = {
    impact = {
      1,
      0.5,
      1,
      1,
      1,
      0
    },
    attack = {
      1,
      0.5,
      1,
      1,
      1,
      0
    }
  },
  charge_value = "instant_projectile",
  name = "shot_carbine",
  cleave_distribution = {
    impact = 0.15,
    attack = 0.15
  }
}

  Weapons.brace_of_pistols_template_1.actions.action_one.default.impact_data.damage_profile = "brace_of_pistols_os"
  Weapons.brace_of_pistols_template_1.actions.action_one.fast_shot.impact_data.damage_profile = "brace_of_pistols_os"
  Weapons.brace_of_pistols_template_1.ammo_data.max_ammo = 36
