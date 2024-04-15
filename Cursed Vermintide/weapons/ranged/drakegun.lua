local mod = get_mod("Vermintide Balance Manager")

--[[
NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.flamethrower_os = {
    name = "flamethrower_os",
    no_stagger_damage_reduction_ranged = true,
    targets = {
    },
    armor_modifier = {
      impact = {
        1,
        0.3,
        1,
        1,
        0.5,
        0
      },
      attack = {
        1,
        0.25,
        1.5,
        1,
        0.5,
        0
      }
    },
    cleave_distribution = {
      impact = 0.01,
      attack = 0.01
    },
    charge_value = "projectile",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.25,
        1.5,
        1,
        0.5,
        0.25
      },
      impact_armor_power_modifer = {
        1,
        0.5,
        1,
        1,
        0.5,
        0
      }
    },
    default_target = {
      power_distribution_far = {
        impact = 0.05,
        attack = 0.05
      },
      boost_curve_type = "linesman_curve",
      power_distribution_near = {
        impact = 0.1,
        attack = 0.075
      },
      dot_template_name = "burning_flamethrower_dot_os",
      boost_curve_coefficient = 1,
      dot_balefire_variant = true,
      range_modifier_settings = {
        dropoff_end = 8,
        dropoff_start = 4
      },
      boost_curve_coefficient_headshot = 0,
      attack_template = "wizard_staff_beam"
    }
  }

  NewDamageProfileTemplates.flamethrower_initial_os = {
    name = "flamethrower_initial_os",
    no_stagger_damage_reduction_ranged = true,
    targets = {
    },
    armor_modifier = {
      impact = {
        1,
        0.35,
        1,
        1,
        0.25,
        0
      },
      attack = {
        0.5,
        0,
        1,
        0.25,
        0.25,
        0
      }
    },
    cleave_distribution = {
      impact = 0.01,
      attack = 0.01
    },
    charge_value = "projectile",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.25,
        1,
        1,
        1,
        0
      },
      impact_armor_power_modifer = {
        1,
        1,
        1,
        1,
        1,
        0
      }
    },
    default_target = {
      power_distribution_far = {
        impact = 0.1,
        attack = 0.075
      },
      boost_curve_type = "linesman_curve",
      power_distribution_near = {
        impact = 0.2,
        attack = 0.1
      },
      dot_template_name = "burning_flamethrower_dot_os",
      boost_curve_coefficient = 1,
      dot_balefire_variant = true,
      range_modifier_settings = {
        dropoff_end = 8,
        dropoff_start = 4
      },
      boost_curve_coefficient_headshot = 0,
      attack_template = "wizard_staff_beam"
    }
  }
  --]]

  -- Left Click
  -- Uncharged Shot
  Weapons.drakegun_template_1.actions.action_one.default.spray_range = 5 -- 7
  AttackTemplates.flamethrower_push = {
    stagger_value = 2,
    sound_type = "medium",
    damage_type = "burn_machinegun"
  }
  --]]
  AttackTemplates.flame_blast = {
    stagger_value = 2,
    sound_type = "medium",
    damage_type = "burn_shotgun",
    range_modifier_settings = {
      dropoff_start = 2,
      dropoff_end = 10
    }
  }

  -- Charged Shot
  --Weapons.drakegun_template_1.actions.action_one.shoot_charged.damage_profile = "flamethrower_os"
  --Weapons.drakegun_template_1.actions.action_one.shoot_charged.initial_damage_profile = "flamethrower_initial_os"
  Weapons.drakegun_template_1.actions.action_one.shoot_charged.damage_interval = 0.25 -- 0.25
  Weapons.drakegun_template_1.actions.action_one.shoot_charged.minimum_hold_time = 0.75 -- 0.75
  Weapons.drakegun_template_1.actions.action_one.shoot_charged.charge_fuel_time_multiplier = 5 -- 5
  Weapons.drakegun_template_1.actions.action_one.shoot_charged.fire_time = 0.15 -- 0.15

  Weapons.drakegun_template_1.actions.action_one.shoot_charged.buff_data = {
		{
			start_time = 0,
			external_multiplier = 0.25, -- 0.25
			buff_name = "planted_charging_decrease_movement"
		}
	}

 local time_mod = 2

 local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

  mod:add_buff_template("burning_flamethrower_dot", {
    duration = 1.5 * time_mod,
    name = "burning_flamethrower_dot",
    max_stacks = 1,
    refresh_durations = true,
    apply_buff_func = "start_dot_damage",
    update_start_delay = 0.65 * time_mod, -- 0.65
    time_between_dot_damages = 0.65 * time_mod, -- 0.65
    damage_type = "burninating",
    damage_profile = "flamethrower_burning_dot",
    update_func = "apply_dot_damage",
    perks = {
      buff_perks.burning
    }
  })

  AttackTemplates.flamethrower = {
    stagger_value = 0, -- 2
    sound_type = "medium",
    damage_type = "burn_machinegun",
    stagger_angle = "stab",
    range_modifier_settings = {
      dropoff_start = 2,
      dropoff_end = 10
    }
  }

  -- Right Click
  Weapons.drakegun_template_1.actions.action_two.default.charge_time = 3 -- 2
  Weapons.drakegun_template_1.actions.action_two.default.minimum_hold_time = 0.2 -- 0.2
  Weapons.drakegun_template_1.actions.action_two.default.allowed_chain_actions = {
        {
            sub_action = "default",
            start_time = 0,
            action = "action_wield",
            input = "action_wield"
        },
        {
            sub_action = "shoot_charged",
            start_time = 0.45, -- 0.45
            action = "action_one",
            input = "action_one"
        },
        {
            sub_action = "default",
            start_time = 0.2,
            action = "weapon_reload",
            input = "weapon_reload"
        }
    }
