local mod = get_mod("Vermintide Balance Manager")

  -- Left Click
  -- Uncharged Shot
  Weapons.staff_flamethrower_template.actions.action_one.default.spray_range = 5 -- 7

  -- Charged Shot
  --Weapons.staff_flamethrower_template.actions.action_one.shoot_charged.damage_profile = "flamethrower_os"
  --Weapons.staff_flamethrower_template.actions.action_one.shoot_charged.initial_damage_profile = "flamethrower_initial_os"
  Weapons.staff_flamethrower_template.actions.action_one.shoot_charged.damage_interval = 0.25 -- 0.25
  Weapons.staff_flamethrower_template.actions.action_one.shoot_charged.minimum_hold_time = 0.75 -- 0.75
  Weapons.staff_flamethrower_template.actions.action_one.shoot_charged.charge_fuel_time_multiplier = 4 -- 5
  Weapons.staff_flamethrower_template.actions.action_one.shoot_charged.fire_time = 0.3 -- 0.3

  Weapons.staff_flamethrower_template.actions.action_one.shoot_charged.buff_data = {
		{
			start_time = 0,
			external_multiplier = 0.5, -- 0.5
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
  Weapons.staff_flamethrower_template.actions.action_two.default.charge_time = 4 -- 3
  Weapons.staff_flamethrower_template.actions.action_two.default.minimum_hold_time = 0.2 -- 0.2
  Weapons.staff_flamethrower_template.actions.action_two.default.allowed_chain_actions = {
				{
					sub_action = "default",
					start_time = 0,
					action = "action_wield",
					input = "action_wield"
				},
				{
					sub_action = "shoot_charged",
					start_time = 0.65, -- 0.65
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

