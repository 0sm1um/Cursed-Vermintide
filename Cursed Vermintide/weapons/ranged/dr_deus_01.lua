local mod = get_mod("Vermintide Balance Manager")

local radius_mod = 0.66
local damage_mod = 0.2
local stagger_mod = 1

local damage_mod_projectile = 4
local stagger_mod_projectile = 1

-- Remove from Engi

require("scripts/settings/dlcs/morris/tweak_data/buff_tweak_data")

local item_master_list = {
	dr_deus_01 = {
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3p",
		description = "dr_deus_01_description",
		display_name = "dr_deus_01_name",
		has_power_level = true,
		hud_icon = "weapon_generic_icon_crossbow",
		inventory_icon = "icon_wpn_dw_trollhammer_t1",
		item_type = "dr_deus_01",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01",
		property_table_name = "ranged",
		rarity = "plentiful",
		required_dlc = "grass",
		skin_combination_table = "dr_deus_01_skins",
		slot_type = "ranged",
		template = "dr_deus_01_template_1",
		trait_table_name = "ranged_ammo",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_skin = {
		base_skin_item = true,
		description = "dr_deus_01_skin_01_description",
		display_name = "dr_deus_01_skin_01_name",
		information_text = "information_weapon_skin",
		item_type = "weapon_skin",
		matching_item_key = "dr_deus_01",
		rarity = "plentiful",
		slot_type = "weapon_skin",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_skin_02 = {
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3p",
		description = "dr_deus_01_skin_02_description",
		display_name = "dr_deus_01_skin_02_name",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		hud_icon = "weapon_generic_icon_crossbow",
		information_text = "information_weapon_skin",
		inventory_icon = "icon_wpn_dw_trollhammer_t2",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02",
		matching_item_key = "dr_deus_01",
		rarity = "exotic",
		required_dlc = "grass",
		slot_type = "weapon_skin",
		template = "dr_deus_01_template_1",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_skin_03 = {
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03_3p",
		description = "dr_deus_01_skin_02_description",
		display_name = "dr_deus_01_skin_02_name",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		hud_icon = "weapon_generic_icon_crossbow",
		information_text = "information_weapon_skin",
		inventory_icon = "icon_wpn_dw_trollhammer_t3",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03",
		matching_item_key = "dr_deus_01",
		rarity = "exotic",
		required_dlc = "grass",
		slot_type = "weapon_skin",
		template = "dr_deus_01_template_1",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_skin_01_runed = {
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3p",
		description = "dr_deus_01_skin_01_runed_description",
		display_name = "dr_deus_01_skin_01_runed_name",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		hud_icon = "weapon_generic_icon_crossbow",
		information_text = "information_weapon_skin",
		inventory_icon = "icon_wpn_dw_trollhammer_t1_runed",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_runed",
		matching_item_key = "dr_deus_01",
		rarity = "unique",
		required_dlc = "grass",
		slot_type = "weapon_skin",
		template = "dr_deus_01_template_1",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_skin_02_runed = {
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3p",
		description = "dr_deus_01_skin_02_runed_description",
		display_name = "dr_deus_01_skin_02_runed_name",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		hud_icon = "weapon_generic_icon_crossbow",
		information_text = "information_weapon_skin",
		inventory_icon = "icon_wpn_dw_trollhammer_t2_runed",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_runed",
		matching_item_key = "dr_deus_01",
		rarity = "unique",
		required_dlc = "grass",
		slot_type = "weapon_skin",
		template = "dr_deus_01_template_1",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_skin_03_runed = {
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03_3p",
		description = "dr_deus_01_skin_02_runed_description",
		display_name = "dr_deus_01_skin_02_runed_name",
		display_unit = "units/weapons/weapon_display/display_drakegun",
		hud_icon = "weapon_generic_icon_crossbow",
		information_text = "information_weapon_skin",
		inventory_icon = "icon_wpn_dw_trollhammer_t3_runed",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03_runed",
		matching_item_key = "dr_deus_01",
		rarity = "unique",
		required_dlc = "grass",
		slot_type = "weapon_skin",
		template = "dr_deus_01_template_1",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_skin_magic = {
		description = "dr_deus_01_magic_description",
		hud_icon = "weapon_generic_icon_staff_3",
		inventory_icon = "icon_wpn_dw_trollhammer_t1",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01_magic",
		matching_item_key = "dr_deus_01",
		rarity = "magic",
		required_dlc = "grass",
		slot_type = "weapon_skin",
		template = "dr_deus_01_template_1",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_02_skin_magic = {
		description = "dr_deus_01_magic_description",
		hud_icon = "weapon_generic_icon_staff_3",
		inventory_icon = "icon_wpn_dw_trollhammer_t2",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_magic",
		matching_item_key = "dr_deus_01",
		rarity = "magic",
		required_dlc = "grass",
		slot_type = "weapon_skin",
		template = "dr_deus_01_template_1",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_skin_01 = {
		description = "dr_deus_01_skin_01_description",
		display_name = "dr_deus_01_skin_01_name",
		hud_icon = "weapon_generic_icon_staff_3",
		inventory_icon = "icon_wpn_dw_trollhammer_t1",
		item_type = "weapon_skin",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_01/wpn_dr_deus_01",
		matching_item_key = "dr_deus_01",
		rarity = "plentiful",
		required_dlc = "grass",
		slot_type = "weapon_skin",
		template = "dr_deus_01_template_1",
		can_wield = {
			"dr_ironbreaker",
		},
	},
	dr_deus_01_magic = {
		ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02",
		ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3p",
		description = "dr_deus_01_magic_description",
		display_name = "dr_deus_01_magic_name",
		has_power_level = true,
		hud_icon = "weapon_generic_icon_bow",
		inventory_icon = "icon_wpn_dw_trollhammer_t2_magic",
		item_type = "dr_deus_01",
		left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_magic",
		property_table_name = "ranged",
		rarity = "magic",
		required_dlc = "grass",
		required_unlock_item = "dr_deus_01",
		slot_type = "ranged",
		template = "dr_deus_01_template_1",
		trait_table_name = "ranged_ammo",
		can_wield = {
			"dr_ironbreaker",
		},
	}
}

table.merge(ItemMasterList, item_master_list)

if DLCSettings.cog then
	UpdateItemMasterList({
		"dr_deus_01",
		"dr_deus_01_magic",
	}, "dr_engineer")
end

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

DamageProfileTemplates.dr_deus_01_explosion = {
	charge_value = "projectile",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1 * damage_mod,
			1 * damage_mod,
			3 * damage_mod,
			1 * damage_mod,
			0.5 * damage_mod
		},
		impact = {
			1 * stagger_mod,
			1 * stagger_mod,
			100 * stagger_mod,
			1 * stagger_mod,
			0.5 * stagger_mod
		}
	},
	default_target = {
		damage_type = "drakegun",
		attack_template = "drakegun",
		power_distribution = {
			attack = 1,
			impact = 2
		}
	}
}

NewDamageProfileTemplates.dr_deus_01_os = {
    stagger_duration_modifier = 0.75,
	armor_modifier_near = {
      impact = {
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile
      },
      attack = {
        1 * damage_mod_projectile,
        1 * damage_mod_projectile,
        2 * damage_mod_projectile, -- 3
        1 * damage_mod_projectile,
        1 * damage_mod_projectile,
        0.5
      }
    },
    cleave_distribution = {
      impact = 0.3,
      attack = 0.3
    },
    critical_strike = {
      attack_armor_power_modifer = {
        1 * damage_mod_projectile / 2,
        1 * damage_mod_projectile / 2,
        1 * damage_mod_projectile / 2, -- 1
        1 * damage_mod_projectile / 2,
        1 * damage_mod_projectile / 2,
        1 * damage_mod_projectile / 2
      },
      impact_armor_power_modifer = {
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile,
        1 * stagger_mod_projectile
      }
    },
    no_stagger_damage_reduction_ranged = true,
    default_target = {
      boost_curve_coefficient_headshot = 2.5,
      boost_curve_coefficient = 1,
      power_distribution_far = {
        impact = 0.3,
        attack = 0.6
      },
      boost_curve_type = "smiter_curve",
      power_distribution_near = {
        impact = 0.4,
        attack = 0.7
      },
      attack_template = "bolt_sniper"
    },
    targets = {
    },
    armor_modifier_far = {
		attack = {
			1,
			0.75,
			1 * damage_mod_projectile, -- 2
			1 * damage_mod_projectile,
			0.75 * damage_mod_projectile,
			0.8 * damage_mod_projectile
		},
		impact = {
			1 * stagger_mod_projectile,
			1 * stagger_mod_projectile,
			1 * stagger_mod_projectile,
			1 * stagger_mod_projectile,
			1 * stagger_mod_projectile,
			0.8 * stagger_mod_projectile
		}
	},
    shield_break = true,
    charge_value = "projectile"
  }

-- Conservative doesnt proc if Trollhammer equiped
mod:add_proc_function("replenish_ammo_on_headshot_ranged", function (owner_unit, buff, params)
	local attack_type = params[2]
	local hit_zone_name = params[3]

	if ALIVE[owner_unit] and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile") then
		local ranged_buff_type = params[5]

		if ranged_buff_type and ranged_buff_type == "RANGED_ABILITY" then
			return
		end

		local weapon_slot = "slot_ranged"
		local ammo_amount = buff.bonus
		local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
		local slot_data = inventory_extension:get_slot_data(weapon_slot)
		local right_unit_1p = slot_data.right_unit_1p
		local left_unit_1p = slot_data.left_unit_1p
		local ammo_extension = GearUtils.get_ammo_extension(right_unit_1p, left_unit_1p)

		if slot_data then
			local item_data = slot_data.item_data
			local item_name = item_data.name
			if item_name == "dr_deus_01" then
				return
			end
		end

		if ammo_extension then
			ammo_extension:add_ammo_to_reserve(ammo_amount)
		end
	end
end)

mod:hook(ActionGrenadeThrower, "client_owner_post_update", function(func, self, dt, t, world, can_damage)
	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		local owner_unit = self.owner_unit

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "crossbow_fire"
			})
		end

		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local position, rotation = first_person_extension:get_projectile_start_position_rotation()
		local spread_extension = self.spread_extension
		local current_action = self.current_action

		if spread_extension then
			rotation = spread_extension:get_randomised_spread(rotation)

			spread_extension:set_shooting()
		end

		local angle = ActionUtils.pitch_from_rotation(rotation)
		local speed = current_action.speed
		local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
		local lookup_data = current_action.lookup_data

		ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self.power_level)

		local fire_sound_event = self.current_action.fire_sound_event

		if fire_sound_event then
			first_person_extension:play_hud_sound_event(fire_sound_event)
		end

		if self.ammo_extension and not self.extra_buff_shot then
			local ammo_usage = current_action.ammo_usage
			local _, procced = self.owner_buff_extension:apply_buffs_to_value(0, "not_consume_grenade")

			self.ammo_extension:use_ammo(ammo_usage)
		end

		local add_spread = not self.extra_buff_shot

		if self:_update_extra_shots(self.owner_buff_extension, 1) then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.1
			self.extra_buff_shot = true
		else
			self.state = "shot"
		end

		first_person_extension:reset_aim_assist_multiplier()
	end

	if self.state == "shot" and self.active_reload_time then
		local owner_unit = self.owner_unit
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")

		if self.active_reload_time < t then
			local ammo_extension = self.ammo_extension

			if (input_extension:get("weapon_reload") or input_extension:get_buffer("weapon_reload")) and ammo_extension:can_reload() then
				local status_extension = ScriptUnit.extension(self.owner_unit, "status_system")

				status_extension:set_zooming(false)

				local weapon_extension = ScriptUnit.extension(self.weapon_unit, "weapon_system")

				weapon_extension:stop_action("reload")
			end
		elseif input_extension:get("weapon_reload") then
			input_extension:add_buffer("weapon_reload", 0)
		end
	end
end)

ExplosionTemplates.dr_deus_01.explosion.radius = ExplosionTemplates.dr_deus_01.explosion.radius * radius_mod
ExplosionTemplates.dr_deus_01.explosion.max_damage_radius = ExplosionTemplates.dr_deus_01.explosion.max_damage_radius * radius_mod

Weapons.dr_deus_01_template_1.actions.action_one.default.impact_data.damage_profile = "dr_deus_01_os"
