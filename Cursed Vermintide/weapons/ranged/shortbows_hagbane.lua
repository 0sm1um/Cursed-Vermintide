local mod = get_mod("Vermintide Balance Manager")

--ExplosionTemplates.carbine_poison_arrow

ExplosionTemplates.carbine_poison_arrow = {
	explosion = {
		use_attacker_power_level = true,
		radius = 1.2, -- 2
		no_prop_damage = true,
		sound_event_name = "arrow_hit_poison_cloud",
		damage_profile = "poison_aoe_os", -- poison_aoe
		effect_name = "fx/wpnfx_poison_arrow_impact_carbine"
	}
}

NewDamageProfileTemplates.poison_aoe_os = {
    no_friendly_fire = true,
    targets = {
    },
    require_damage_for_dot = true,
    no_stagger = false,
    no_stagger_damage_reduction_ranged = true,
    default_target = {
      attack_template = "arrow_poison_aoe",
      power_distribution = {
        impact = 0.05, -- 0.5
        attack = 0.05
      },
      damage_type = "poison",
      dot_template_name = "aoe_poison_dot"
    },
    name = "poison_aoe",
    charge_value = "aoe",
    is_dot = true,
    armor_modifier = {
      impact = {
        1,
        0.75,
        1,
        1,
        0.5,
        0
      },
      attack = {
        1.25,
        0,
        1.5, -- 1.5
        1,
        1,
        0
      }
    }
  }

  NewDamageProfileTemplates.shortbow_hagbane_charged_os = {
    ignore_stagger_reduction = true,
    cleave_distribution = {
      attack = 0.05,
      impact = 0.05
    },
    require_damage_for_dot = true,
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.25,
        1.5,
        1,
        1.5,
        0.25
      },
      impact_armor_power_modifer = {
        1,
        0.3,
        1.5,
        1,
        1.5,
        0.25
      }
    },
    charge_value = "projectile",
    no_stagger_damage_reduction_ranged = true,
    targets = {
    },
    default_target = {
      dot_template_name = "arrow_poison_dot",
      boost_curve_coefficient = 0.5,
      power_distribution_far = {
        attack = 0.075, -- 0.075
        impact = 0.2
      },
      boost_curve_type = "ninja_curve",
      power_distribution_near = {
        attack = 0.1, -- 0.075
        impact = 0.25
      },
      range_modifier_settings = {
        dropoff_start = 10,
        dropoff_end = 30
      },
      attack_template = "arrow_machinegun"
    },
    armor_modifier_near = {
      attack = {
        1,
        0.2,
        1.5,
        1,
        1.5,
        0
      },
      impact = {
        1,
        1,
        1.5,
        1,
        1.5,
        0
      }
    },
    armor_modifier_far = {
      attack = {
        1,
        0,
        1,
        1,
        1,
        0
      },
      impact = {
        1,
        0.1,
        1,
        1,
        1,
        0
      }
    },
    name = "shortbow_hagbane_charged",
    allow_dot_finesse_hit = true
  }

  --Weapons.shortbow_hagbane_template_1.actions.action_one.shoot_charged.impact_data.damage_profile = "shortbow_hagbane_charged_os"
