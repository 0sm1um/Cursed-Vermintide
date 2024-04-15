local mod = get_mod("Vermintide Balance Manager")
local dead_units = {}
local damage_source_procs = {
	charge_ability_hit_blast = "on_charge_ability_hit_blast",
	charge_ability_hit = "on_charge_ability_hit"
}

local unit_get_data = Unit.get_data

local function apply_buffs_to_stagger_damage(attacker_unit, target_index, hit_zone, is_critical_strike, stagger_number)
	local attacker_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")
	local new_stagger_number = stagger_number

	if attacker_buff_extension then
		local finesse_perk = attacker_buff_extension:has_buff_perk("finesse_stagger_damage")
		local smiter_perk = attacker_buff_extension:has_buff_perk("smiter_stagger_damage")
		local mainstay_perk = attacker_buff_extension:has_buff_perk("linesman_stagger_damage")

		if mainstay_perk and new_stagger_number > 0 then
			new_stagger_number = new_stagger_number + 1
		elseif (is_critical_strike or hit_zone == "head" or hit_zone == "neck") and finesse_perk then
			new_stagger_number = 2
		elseif smiter_perk then
			if target_index and target_index <= 1 then
				new_stagger_number = math.max(1, new_stagger_number)
			else
				new_stagger_number = stagger_number
			end
		end
	end

	return new_stagger_number
end

local function get_head_shot_boost_amount(target_settings, damage_profile, is_finesse_hit, multiplier_type, will_deal_damage, target_unit_armor, target_unit_primary_armor)
	local head_shot_boost_amount = 0

	if is_finesse_hit then
		if will_deal_damage then
			if target_unit_armor == 3 then
				head_shot_boost_amount = target_settings and (target_settings.headshot_boost_boss or target_settings.headshot_boost) or 0.25
			else
				head_shot_boost_amount = target_settings and target_settings.headshot_boost or 0.5
			end
		elseif target_unit_primary_armor == 6 and not will_deal_damage then
			head_shot_boost_amount = target_settings and target_settings.headshot_boost_heavy_armor or 0.25
		elseif target_unit_armor == 2 and not will_deal_damage then
			head_shot_boost_amount = target_settings and (target_settings.headshot_boost_armor or target_settings.headshot_boost) or 0.5
		end

		if multiplier_type == "protected_weakspot" then
			head_shot_boost_amount = head_shot_boost_amount * 0.25
		end
	end

	if multiplier_type == "protected_spot" then
		head_shot_boost_amount = head_shot_boost_amount - 0.5
	end

	return head_shot_boost_amount
end

local function do_damage_calculation(attacker_unit, damage_source, original_power_level, damage_output, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, range_scalar_multiplier, static_base_damage, is_friendly_fire, has_power_boost, difficulty_level, target_unit_armor, target_unit_primary_armor, has_crit_head_shot_killing_blow_perk, has_crit_backstab_killing_blow_perk, target_max_health, optional_target_unit)
	if damage_profile and damage_profile.no_damage then
		return 0
	end

	local difficulty_settings = DifficultySettings[difficulty_level]
	local power_boost_damage = 0
	local head_shot_boost_damage = 0
	local head_shot_min_damage = 1
	local power_boost_min_damage = 1
	local multiplier_type = DamageUtils.get_breed_damage_multiplier_type(breed, hit_zone_name)
	local is_finesse_hit = multiplier_type == "headshot" or multiplier_type == "weakspot" or multiplier_type == "protected_weakspot"

	if is_finesse_hit or is_critical_strike or has_power_boost or boost_damage_multiplier and boost_damage_multiplier > 0 then
		local power_boost_armor

		power_boost_armor = not (target_unit_armor ~= 2 and target_unit_armor ~= 5 and target_unit_armor ~= 6) and 1 or target_unit_armor

		local power_boost_target_damages = damage_output[power_boost_armor] or power_boost_armor == 0 and 0 or damage_output[1]
		local preliminary_boost_damage

		if type(power_boost_target_damages) == "table" then
			local power_boost_damage_range = power_boost_target_damages.max - power_boost_target_damages.min
			local power_boost_attack_power, _ = ActionUtils.get_power_level_for_target(optional_target_unit, original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, hit_zone_name, power_boost_armor, damage_source, breed, range_scalar_multiplier, difficulty_level, target_unit_armor, target_unit_primary_armor)
			local power_boost_percentage = ActionUtils.get_power_level_percentage(power_boost_attack_power)

			preliminary_boost_damage = power_boost_target_damages.min + power_boost_damage_range * power_boost_percentage
		else
			preliminary_boost_damage = power_boost_target_damages
		end

		if is_finesse_hit then
			head_shot_min_damage = preliminary_boost_damage * 0.5
		end

		if is_critical_strike then
			head_shot_min_damage = preliminary_boost_damage * 0.5
		end

		if has_power_boost or boost_damage_multiplier and boost_damage_multiplier > 0 then
			power_boost_damage = preliminary_boost_damage
		end
	end

	local damage, target_damages

	if type(damage_output) == "table" then
		local armor_type = target_unit_primary_armor or target_unit_armor

		target_damages = damage_output[armor_type] or armor_type == 0 and 0 or damage_output[1]
	else
		target_damages = damage_output
	end

	if type(target_damages) == "table" then
		local damage_range = target_damages.max - target_damages.min
		local percentage = 0

		if damage_profile then
			local attack_power, _ = ActionUtils.get_power_level_for_target(optional_target_unit, original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, hit_zone_name, nil, damage_source, breed, range_scalar_multiplier, difficulty_level, target_unit_armor, target_unit_primary_armor)

			percentage = ActionUtils.get_power_level_percentage(attack_power)
		end

		damage = target_damages.min + damage_range * percentage
	else
		damage = target_damages
	end

	local backstab_damage

	if backstab_multiplier then
		backstab_damage = power_boost_damage and damage < power_boost_damage and power_boost_damage * (backstab_multiplier - 1) or damage * (backstab_multiplier - 1)
	end

	if not static_base_damage then
		local target_settings = damage_profile and (damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target)
		local power_boost_amount = 0
		local head_shot_boost_amount = get_head_shot_boost_amount(target_settings, damage_profile, is_finesse_hit, multiplier_type, damage > 0, target_unit_armor, target_unit_primary_armor)

		if has_power_boost then
			if target_unit_armor == 1 then
				power_boost_amount = power_boost_amount + 0.75
			elseif target_unit_armor == 2 then
				power_boost_amount = power_boost_amount + 0.6
			elseif target_unit_armor == 3 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 4 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 5 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 6 then
				power_boost_amount = power_boost_amount + 0.3
			else
				power_boost_amount = power_boost_amount + 0.5
			end
		end

		if boost_damage_multiplier and boost_damage_multiplier > 0 then
			if target_unit_armor == 1 then
				power_boost_amount = power_boost_amount + 0.75
			elseif target_unit_armor == 2 then
				power_boost_amount = power_boost_amount + 0.3
			elseif target_unit_armor == 3 then
				power_boost_amount = power_boost_amount + 0.75
			elseif target_unit_armor == 4 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 5 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 6 then
				power_boost_amount = power_boost_amount + 0.2
			else
				power_boost_amount = power_boost_amount + 0.5
			end
		end

		if multiplier_type == "protected_spot" then
			power_boost_amount = power_boost_amount - 0.5
		end

		if damage_profile and damage_profile.no_headshot_boost then
			head_shot_boost_amount = 0
		end

		local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
		local crit_boost = 0

		if is_critical_strike then
			crit_boost = damage_profile and damage_profile.crit_boost or 0.5

			if damage_profile and damage_profile.no_crit_boost then
				crit_boost = 0
			end

			if attacker_buff_extension and attacker_buff_extension:has_buff_perk("no_crit_damage") then
				crit_boost = 0
			end
		end

		if boost_curve and (power_boost_amount > 0 or head_shot_boost_amount > 0 or crit_boost > 0) then
			local modified_boost_curve, modified_boost_curve_head_shot
			local boost_coefficient = target_settings and target_settings.boost_curve_coefficient or DefaultBoostCurveCoefficient
			local boost_coefficient_headshot = target_settings and target_settings.boost_curve_coefficient_headshot or DefaultBoostCurveCoefficient

			if boost_damage_multiplier and boost_damage_multiplier > 0 then
				if breed and breed.boost_curve_multiplier_override then
					boost_damage_multiplier = math.clamp(boost_damage_multiplier, 0, breed.boost_curve_multiplier_override)
				end

				boost_coefficient = boost_coefficient * boost_damage_multiplier
				boost_coefficient_headshot = boost_coefficient_headshot * boost_damage_multiplier
			end

			if power_boost_amount > 0 then
				modified_boost_curve = DamageUtils.get_modified_boost_curve(boost_curve, boost_coefficient)
				power_boost_amount = math.clamp(power_boost_amount, 0, 1)

				local boost_multiplier = DamageUtils.get_boost_curve_multiplier(modified_boost_curve or boost_curve, power_boost_amount)

				power_boost_damage = math.max(math.max(power_boost_damage, damage), power_boost_min_damage) * boost_multiplier
			end

			if head_shot_boost_amount > 0 or crit_boost > 0 then
				modified_boost_curve_head_shot = DamageUtils.get_modified_boost_curve(boost_curve, boost_coefficient_headshot)
				head_shot_boost_amount = math.clamp(head_shot_boost_amount + crit_boost, 0, 1)

				local head_shot_boost_multiplier = DamageUtils.get_boost_curve_multiplier(modified_boost_curve_head_shot or boost_curve, head_shot_boost_amount)

				head_shot_boost_damage = math.max(math.max(power_boost_damage, damage), head_shot_min_damage) * head_shot_boost_multiplier

				if attacker_buff_extension and is_critical_strike then
					head_shot_boost_damage = head_shot_boost_damage * attacker_buff_extension:apply_buffs_to_value(1, "critical_strike_effectiveness")
				end

				if attacker_buff_extension and is_finesse_hit then
					head_shot_boost_damage = head_shot_boost_damage * attacker_buff_extension:apply_buffs_to_value(1, "headshot_multiplier")
				end

				local target_unit_buff_extension = ScriptUnit.has_extension(optional_target_unit, "buff_system")

				if target_unit_buff_extension and is_finesse_hit then
					head_shot_boost_damage = head_shot_boost_damage * target_unit_buff_extension:apply_buffs_to_value(1, "headshot_vulnerability")
				end
			end
		end

		if breed and breed.armored_boss_damage_reduction then
			damage = damage * 0.8
			power_boost_damage = power_boost_damage * 0.5
			backstab_damage = backstab_damage and backstab_damage * 0.75
		end

		if breed and breed.boss_damage_reduction then
			damage = damage * 0.45
			power_boost_damage = power_boost_damage * 0.5
			head_shot_boost_damage = head_shot_boost_damage * 0.5
			backstab_damage = backstab_damage and backstab_damage * 0.75
		end

		if breed and breed.lord_damage_reduction then
			damage = damage * 0.2
			power_boost_damage = power_boost_damage * 0.25
			head_shot_boost_damage = head_shot_boost_damage * 0.25
			backstab_damage = backstab_damage and backstab_damage * 0.5
		end

		damage = damage + power_boost_damage + head_shot_boost_damage

		if backstab_damage then
			damage = damage + backstab_damage
		end

		if attacker_buff_extension then
			if multiplier_type == "headshot" then
				damage = attacker_buff_extension:apply_buffs_to_value(damage, "headshot_damage")
			else
				damage = attacker_buff_extension:apply_buffs_to_value(damage, "non_headshot_damage")
			end
		end

		local killing_blow_triggered

		if is_critical_strike then
			if hit_zone_name == "head" and has_crit_head_shot_killing_blow_perk then
				killing_blow_triggered = true
			elseif backstab_multiplier and backstab_multiplier > 1 and has_crit_backstab_killing_blow_perk and damage_profile.charge_value == "heavy_attack" then
				killing_blow_triggered = true
			end
		end

		if killing_blow_triggered and breed then
			local boss = breed.boss
			local primary_armor = breed.primary_armor_category

			if not boss and not primary_armor then
				if target_max_health then
					damage = target_max_health
				else
					local breed_health_table = breed.max_health
					local difficulty_rank = difficulty_settings.rank
					local breed_health = breed_health_table[difficulty_rank]

					damage = breed_health
				end
			end
		end
	end

	if is_friendly_fire then
		local friendly_fire_multiplier = difficulty_settings.friendly_fire_multiplier or 0

		if damage_profile and damage_profile.friendly_fire_multiplier then
			friendly_fire_multiplier = friendly_fire_multiplier * damage_profile.friendly_fire_multiplier
		end

		damage = damage * friendly_fire_multiplier
	end

	local heavy_armor_damage = false

	return damage, heavy_armor_damage
end

mod:hook_origin(DamageUtils, "calculate_damage", function (damage_output, target_unit, attacker_unit, hit_zone_name, original_power_level, boost_curve, boost_damage_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier, damage_source)
	-- New
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local breed, armor_override, unit_max_health

	if target_unit then
		breed = AiUtils.unit_breed(target_unit)
		armor_override = unit_get_data(target_unit, "armor")

		local target_unit_health_extension = ScriptUnit.has_extension(target_unit, "health_system")
		local target_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")
		local is_invincible = target_unit_health_extension and target_unit_health_extension:get_is_invincible()

		if not is_invincible and target_buff_extension then
			if target_buff_extension:has_buff_perk("invulnerable") then
				is_invincible = true
			elseif target_buff_extension:has_buff_perk("invulnerable_ranged") then
				local charge_value = damage_profile and damage_profile.charge_value

				is_invincible = RangedAttackTypes[charge_value]
			end
		end

		if is_invincible then
			return 0, is_invincible
		end

		if target_unit_health_extension then
			unit_max_health = target_unit_health_extension:get_max_health()
		elseif breed then
			local breed_health_table = breed.max_health
			local difficulty_rank = difficulty_settings.rank
			local breed_health = breed_health_table[difficulty_rank]

			unit_max_health = breed_health
		end
	end

	local attacker_breed

	if attacker_unit then
		attacker_breed = Unit.get_data(attacker_unit, "breed")
	end

	local static_base_damage = not attacker_breed or not attacker_breed.is_player
	local is_friendly_fire = not static_base_damage and Managers.state.side:is_ally(attacker_unit, target_unit)
	local target_is_hero = breed and breed.is_hero
	local range_scalar_multiplier = 0

	if damage_profile and not static_base_damage then
		local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target

		range_scalar_multiplier = ActionUtils.get_range_scalar_multiplier(damage_profile, target_settings, attacker_unit, target_unit)
	end

	local buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
	local has_power_boost = false
	local has_crit_head_shot_killing_blow_perk = false
	local has_crit_backstab_killing_blow_perk = false

	if buff_extension then
		has_power_boost = buff_extension:has_buff_perk("potion_armor_penetration")
		has_crit_head_shot_killing_blow_perk = buff_extension:has_buff_perk("crit_headshot_killing_blow")
		has_crit_backstab_killing_blow_perk = buff_extension:has_buff_perk("crit_backstab_killing_blow")
	end

	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local target_unit_armor, target_unit_primary_armor, _

	if target_is_hero then
		target_unit_armor = PLAYER_TARGET_ARMOR
	else
		target_unit_armor, _, target_unit_primary_armor, _ = ActionUtils.get_target_armor(hit_zone_name, breed, armor_override)
	end

	local calculated_damage = do_damage_calculation(attacker_unit, damage_source, original_power_level, damage_output, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, range_scalar_multiplier, static_base_damage, is_friendly_fire, has_power_boost, difficulty_level, target_unit_armor, target_unit_primary_armor, has_crit_head_shot_killing_blow_perk, has_crit_backstab_killing_blow_perk, unit_max_health, target_unit)

	if damage_profile and not damage_profile.is_dot then
		local blackboard = BLACKBOARDS[target_unit]
		local stagger_number = 0

		if blackboard then
			local ignore_stagger_damage_reduction = damage_profile.no_stagger_damage_reduction or breed.no_stagger_damage_reduction
			local min_stagger_number = 0
			local max_stagger_number = 2

			stagger_number = blackboard.is_climbing and 2 or math.min(blackboard.stagger or min_stagger_number, max_stagger_number)

			if damage_profile.no_stagger_damage_reduction_ranged then
				local stagger_number_override = 1

				stagger_number = math.max(stagger_number_override, stagger_number)
			end

			if not damage_profile.no_stagger_damage_reduction_ranged then
				stagger_number = apply_buffs_to_stagger_damage(attacker_unit, target_index, hit_zone_name, is_critical_strike, stagger_number)
			end
		end

		local min_stagger_damage_coefficient = difficulty_settings.min_stagger_damage_coefficient
		local stagger_damage_multiplier = difficulty_settings.stagger_damage_multiplier

		-- Bulwark
		if stagger_damage_multiplier then
			local bonus_damage_percentage = stagger_number * stagger_damage_multiplier
			local target_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

			if target_buff_extension and not damage_profile.no_stagger_damage_reduction_ranged then
				bonus_damage_percentage = target_buff_extension:apply_buffs_to_value(bonus_damage_percentage, "unbalanced_damage_taken")
			end

			local stagger_damage = calculated_damage * (min_stagger_damage_coefficient + bonus_damage_percentage)
			calculated_damage = stagger_damage
		end
	end

	local weave_manager = Managers.weave

	if target_is_hero and static_base_damage and weave_manager:get_active_weave() then
		local scaling_value = weave_manager:get_scaling_value("enemy_damage")

		calculated_damage = calculated_damage * (1 + scaling_value)
	end

	return calculated_damage
end)

local IGNORED_SHARED_DAMAGE_TYPES = {
	wounded_dot = true,
	suicide = true,
	knockdown_bleed = true
}
local INVALID_DAMAGE_TO_OVERHEAT_DAMAGE_SOURCES = {
	temporary_health_degen = true,
	overcharge = true,
	life_tap = true,
	ground_impact = true,
	life_drain = true
}
local INVALID_DAMAGE_TO_OVERHEAT_DAMAGE_TYPES = {
	warpfire_face = true,
	vomit_face = true,
	vomit_ground = true,
	poison = true,
	warpfire_ground = true,
	plague_face = true,
}
local POISON_DAMAGE_TYPES = {
	aoe_poison_dot = true,
	poison = true,
	arrow_poison = true,
	arrow_poison_dot = true
}
local POISON_DAMAGE_SOURCES = {
	skaven_poison_wind_globadier = true,
	poison_dot = true
}
local INVALID_GROMRIL_DAMAGE_SOURCE = {
	temporary_health_degen = true,
	overcharge = true,
	life_tap = true,
	ground_impact = true,
	life_drain = true
}
local IGNORE_DAMAGE_REDUCTION_DAMAGE_SOURCE = {
	life_tap = true,
	suicide = true
}
local POSITION_LOOKUP = POSITION_LOOKUP

mod:hook_origin(DamageUtils, "apply_buffs_to_damage", function(current_damage, attacked_unit, attacker_unit, damage_source, victim_units, damage_type, buff_attack_type, first_hit)
	local damage = current_damage
	local network_manager = Managers.state.network
	local attacked_player = Managers.player:owner(attacked_unit)
	local attacker_player = Managers.player:owner(attacker_unit)

	if attacked_player then
		damage = Managers.state.game_mode:modify_player_base_damage(attacked_unit, attacker_unit, damage, damage_type)
	end

	victim_units[#victim_units + 1] = attacked_unit
	local health_extension = ScriptUnit.extension(attacked_unit, "health_system")

	if health_extension:has_assist_shield() and not IGNORED_SHARED_DAMAGE_TYPES[damage_source] then
		local attacked_unit_id = network_manager:unit_game_object_id(attacked_unit)

		network_manager.network_transmit:send_rpc_clients("rpc_remove_assist_shield", attacked_unit_id)
	end

	if ScriptUnit.has_extension(attacked_unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(attacked_unit, "buff_system")

		if SKAVEN[damage_source] then
			damage = buff_extension:apply_buffs_to_value(damage, "protection_skaven")
		elseif CHAOS[damage_source] or BEASTMEN[damage_source] then
			damage = buff_extension:apply_buffs_to_value(damage, "protection_chaos")
		end

		if DAMAGE_TYPES_AOE[damage_type] then
			damage = buff_extension:apply_buffs_to_value(damage, "protection_aoe")
		end

		if not IGNORE_DAMAGE_REDUCTION_DAMAGE_SOURCE[damage_source] then
			damage = buff_extension:apply_buffs_to_value(damage, "damage_taken")

			if ELITES[damage_source] then
				damage = buff_extension:apply_buffs_to_value(damage, "damage_taken_elites")
			end
		end

		if RangedAttackTypes[buff_attack_type] then
			damage = buff_extension:apply_buffs_to_value(damage, "damage_taken_ranged")
		end

		local status_extension = attacked_player and ScriptUnit.has_extension(attacked_unit, "status_system")

		if status_extension then
			local is_knocked_down = status_extension:is_knocked_down()

			if is_knocked_down then
				damage = (damage_type ~= "overcharge" and buff_extension:apply_buffs_to_value(damage, "damage_taken_kd")) or 0
			end

			local is_disabled = status_extension:is_disabled()

			if not is_disabled then
				local valid_damage_to_overheat = not INVALID_DAMAGE_TO_OVERHEAT_DAMAGE_SOURCES[damage_source] and not INVALID_DAMAGE_TO_OVERHEAT_DAMAGE_TYPES[damage_type]
				local unit_side = Managers.state.side.side_by_unit[attacked_unit]
				local player_and_bot_units = unit_side.PLAYER_AND_BOT_UNITS
				local shot_by_friendly = false
				local allies = (player_and_bot_units and #player_and_bot_units) or 0

				for i = 1, allies, 1 do
					local ally_unit =  player_and_bot_units[i]
					if ally_unit == attacker_unit then
						shot_by_friendly = true
					end
				end

                local is_poison_damage = POISON_DAMAGE_TYPES[damage_type] or POISON_DAMAGE_SOURCES[damage_source]
                local is_ranged_attack = RangedAttackTypes[buff_attack_type]

				if valid_damage_to_overheat and damage > 0 and not shot_by_friendly and not is_knocked_down and not is_poison_damage and not is_ranged_attack then
					local original_damage = damage
					local new_damage = buff_extension:apply_buffs_to_value(damage, "damage_taken_to_overcharge")

					if new_damage < original_damage then
						local damage_to_overcharge = original_damage - new_damage
						damage_to_overcharge = buff_extension:apply_buffs_to_value(damage_to_overcharge, "reduced_overcharge_from_passive")
						damage_to_overcharge = DamageUtils.networkify_damage(damage_to_overcharge)

						if attacked_player.remote then
							local peer_id = attacked_player.peer_id
							local unit_id = network_manager:unit_game_object_id(attacked_unit)
							local channel_id = PEER_ID_TO_CHANNEL[peer_id]

							RPC.rpc_damage_taken_overcharge(channel_id, unit_id, damage_to_overcharge)
						else
							DamageUtils.apply_damage_to_overcharge(attacked_unit, damage_to_overcharge)
						end

						damage = new_damage
					end
				end
			end
		end

		local attacker_unit_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if attacker_unit_buff_extension then
			local has_burning_perk = attacker_unit_buff_extension:has_buff_perk("burning")

			if has_burning_perk then
				local side_manager = Managers.state.side
				local side = side_manager.side_by_unit[attacked_unit]

				if side then
					local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
					local num_units = #player_and_bot_units

					for i = 1, num_units, 1 do
						local unit = player_and_bot_units[i]
						local talent_extension = ScriptUnit.has_extension(unit, "talent_system")

						if talent_extension and talent_extension:has_talent("sienna_unchained_burning_enemies_reduced_damage") then
							damage = damage * (1 + BuffTemplates.sienna_unchained_burning_enemies_reduced_damage.buffs[1].multiplier)

							break
						end
					end
				end
			end
		end

		local boss_elite_damage_cap = buff_extension:get_buff_value("max_damage_taken_from_boss_or_elite")
		local all_damage_cap = buff_extension:get_buff_value("max_damage_taken")
		local has_anti_oneshot = buff_extension:has_buff_perk("anti_oneshot")

		if has_anti_oneshot then
			local max_health = health_extension:get_max_health()
			local max_damage_allowed = max_health * 0.3

			if damage > max_damage_allowed then
				damage = max_damage_allowed
			end
		end

		local breed = ALIVE[attacker_unit] and unit_get_data(attacker_unit, "breed")

		if breed and (breed.boss or breed.elite) then
			local min_damage_cap = nil
			min_damage_cap = (not boss_elite_damage_cap or not all_damage_cap or math.min(boss_elite_damage_cap, all_damage_cap)) and ((boss_elite_damage_cap and boss_elite_damage_cap) or all_damage_cap)

			if min_damage_cap and min_damage_cap <= damage then
				damage = math.max(damage * 0.5, min_damage_cap)
			end
		elseif all_damage_cap and all_damage_cap <= damage then
			damage = math.max(damage * 0.5, all_damage_cap)
		end

		if buff_extension:has_buff_type("shared_health_pool") and not IGNORED_SHARED_DAMAGE_TYPES[damage_source] then
			local attacked_side = Managers.state.side.side_by_unit[attacked_unit]
			local player_and_bot_units = attacked_side.PLAYER_AND_BOT_UNITS
			local num_player_and_bot_units = #player_and_bot_units
			local num_players_with_shared_health_pool = 1

			for i = 1, num_player_and_bot_units, 1 do
				local friendly_unit = player_and_bot_units[i]

				if friendly_unit ~= attacked_unit then
					local friendly_buff_extension = ScriptUnit.extension(friendly_unit, "buff_system")

					if friendly_buff_extension:has_buff_type("shared_health_pool") then
						num_players_with_shared_health_pool = num_players_with_shared_health_pool + 1
						victim_units[#victim_units + 1] = friendly_unit
					end
				end
			end

			damage = damage / num_players_with_shared_health_pool
		end

		local talent_extension = ScriptUnit.has_extension(attacked_unit, "talent_system")

		if talent_extension and talent_extension:has_talent("bardin_ranger_reduced_damage_taken_headshot") then
			local has_position = POSITION_LOOKUP[attacker_unit]

			if has_position and AiUtils.unit_is_flanking_player(attacker_unit, attacked_unit) and not buff_extension:has_buff_type("bardin_ranger_reduced_damage_taken_headshot_buff") then
				damage = damage * (1 + BuffTemplates.bardin_ranger_reduced_damage_taken_headshot_buff.buffs[1].multiplier)
			end
		end

		local is_invulnerable = buff_extension:has_buff_perk("invulnerable")
		local has_gromril_armor = buff_extension:has_buff_type("bardin_ironbreaker_gromril_armour")
		local has_metal_mutator_gromril_armor = buff_extension:has_buff_type("metal_mutator_gromril_armour")
		local valid_damage_source = not INVALID_GROMRIL_DAMAGE_SOURCE[damage_source]
		local unit_side = Managers.state.side.side_by_unit[attacked_unit]

		if unit_side and unit_side:name() == "dark_pact" then
			is_invulnerable = is_invulnerable or damage_source == "ground_impact"
		end

		if is_invulnerable or ((has_gromril_armor or has_metal_mutator_gromril_armor) and valid_damage_source) then
			damage = 0
		end

		if has_gromril_armor and valid_damage_source and current_damage > 0 then
			local buff = buff_extension:get_non_stacking_buff("bardin_ironbreaker_gromril_armour")
			local id = buff.id

			buff_extension:remove_buff(id)
			buff_extension:trigger_procs("on_gromril_armour_removed")

			local attacked_unit_id = network_manager:unit_game_object_id(attacked_unit)

			network_manager.network_transmit:send_rpc_clients("rpc_remove_gromril_armour", attacked_unit_id)
		end

		if buff_extension:has_buff_type("invincibility_standard") then
			local buff = buff_extension:get_non_stacking_buff("invincibility_standard")

			if not buff.applied_damage then
				buff.stored_damage = (not buff.stored_damage and damage) or buff.stored_damage + damage
				damage = 0
			end
		end
	end

	local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")
	if buff_extension then

		local item_data = rawget(ItemMasterList, damage_source)
		local weapon_template_name = item_data and item_data.template
		local attacked_buff_extension = ScriptUnit.has_extension(attacked_unit, "buff_system")

		if attacker_player then

			if weapon_template_name then
				local weapon_template = Weapons[weapon_template_name]
				local buff_type = weapon_template.buff_type

				if buff_type then
					damage = buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage")

					if buff_extension:has_buff_perk("missing_health_damage") then
						local attacked_health_extension = ScriptUnit.extension(attacked_unit, "health_system")
						local missing_health_percentage = 1 - attacked_health_extension:current_health_percent()
						local damage_mult = 1 + missing_health_percentage / 2
						damage = damage * damage_mult
					end
				end

				local is_melee = MeleeBuffTypes[buff_type]
				local is_ranged = RangedBuffTypes[buff_type]

				if is_melee then
					damage = buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_melee")

					if buff_type == "MELEE_1H" then
						damage = buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_melee_1h")
					elseif buff_type == "MELEE_2H" then
						damage = buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_melee_2h")
					end

					if buff_attack_type == "heavy_attack" then
						damage = buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_heavy_attack")
					end

					if first_hit then
						damage = buff_extension:apply_buffs_to_value(damage, "first_melee_hit_damage")
					end
				elseif is_ranged then
					damage = buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_ranged")
					local attacked_health_extension = ScriptUnit.extension(attacked_unit, "health_system")

					if attacked_health_extension:current_health_percent() <= 0.9 or attacked_health_extension:current_max_health_percent() <= 0.9 then
						damage = buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_ranged_to_wounded")
					end
				end

				local weapon_type = weapon_template.weapon_type

				if weapon_type then
					local stat_buff = WeaponSpecificStatBuffs[weapon_type].damage
					damage = buff_extension:apply_buffs_to_value(damage, stat_buff)
				end

				if is_melee or is_ranged then
					damage = buff_extension:apply_buffs_to_value(damage, "reduced_non_burn_damage")
				end
			end

			if attacked_buff_extension then
				local has_poison_or_bleed = attacked_buff_extension:has_buff_perk("poisoned") or attacked_buff_extension:has_buff_perk("bleeding")

				if has_poison_or_bleed then
					damage = buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_poisoned_or_bleeding")
				end
			end

			if damage_type == "burninating" then
				damage = buff_extension:apply_buffs_to_value(damage, "increased_burn_dot_damage")
			end
		end

		damage = buff_extension:apply_buffs_to_value(damage, "damage_dealt")

		local has_balefire, applied_this_frame = Managers.state.status_effect:has_status(attacked_unit, StatusEffectNames.burning_balefire)
		if has_balefire and not applied_this_frame then
			damage = buff_extension:apply_buffs_to_value(damage, "increased_damage_to_balefire")
		end
	end

	local attacker_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

	if attacker_buff_extension then
		damage = attacker_buff_extension:apply_buffs_to_value(damage, "damage_dealt")
	end

	Managers.state.game_mode:damage_taken(attacked_unit, attacker_unit, damage, damage_source, damage_type)

	return damage
end)
