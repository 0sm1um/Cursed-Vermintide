local mod = get_mod("Vermintide Balance Manager")

local stagger_heal_amount = 0.6

-- Fixed Vanguard not proccing when you killed an enemy which is staggered
local dead_units = {}
local damage_source_procs = {
	charge_ability_hit_blast = "on_charge_ability_hit_blast",
	charge_ability_hit = "on_charge_ability_hit"
}
local unit_get_data = Unit.get_data

mod:hook_origin(DamageUtils, "server_apply_hit", function (t, attacker_unit, target_unit, hit_zone_name, hit_position, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier, first_hit, total_hits, source_attacker_unit)
	source_attacker_unit = source_attacker_unit or attacker_unit

	local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

	if buff_extension and damage_source_procs[damage_source] then
		buff_extension:trigger_procs(damage_source_procs[damage_source], target_unit, target_index)
	end

	if not blocking then
		local attack_power_level = power_level

		if not can_damage then
			attack_power_level = 0
		end

		if damage_profile.charge_value == "heavy_attack" and DamageUtils.is_player_unit(attacker_unit) then
			local status_extension = ScriptUnit.has_extension(attacker_unit, "status_system")

			if status_extension then
				local current_fall_distance = status_extension:fall_distance()

				if current_fall_distance >= MinFallDistanceForBonus then
					attack_power_level = attack_power_level * FallingPowerLevelBonusMultiplier
				end
			end
		end

		local added_dot = false

		if buff_extension then
			-- Flense
			local witch_hunter_bleed = buff_extension:has_buff_perk("victor_witchhunter_bleed_on_critical_hit") and (damage_profile.charge_value == "light_attack" or damage_profile.charge_value == "heavy_attack") and not buff_extension:has_buff_perk("victor_witchhunter_bleed_on_critical_hit_disable")
			local kerillian_bleed = buff_extension:has_buff_perk("kerillian_critical_bleed_dot") and damage_profile.charge_value == "projectile" and not buff_extension:has_buff_perk("kerillian_critical_bleed_dot_disable")
			local generic_melee_bleed = buff_extension:has_buff_perk("generic_melee_bleed") and (damage_profile.charge_value == "light_attack" or damage_profile.charge_value == "heavy_attack")
			local custom_dot_name

			if witch_hunter_bleed or kerillian_bleed or generic_melee_bleed then
				custom_dot_name = "weapon_bleed_dot_whc"
			elseif buff_extension:has_buff_perk("sienna_unchained_burn_push") and damage_profile and damage_profile.is_push then
				custom_dot_name = "burning_dot_unchained_push"
			end

			if custom_dot_name then
				local custom_dot = FrameTable.alloc_table()

				custom_dot.dot_template_name = custom_dot_name

				local added_custom_dot = DamageUtils.apply_dot(damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, nil, source_attacker_unit, custom_dot)

				added_dot = added_dot or added_custom_dot
			end
		end

		if (not damage_profile.require_damage_for_dot or attack_power_level ~= 0) and not added_dot then
			local added_profile_dot = DamageUtils.apply_dot(damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, nil, source_attacker_unit, nil)

			added_dot = added_dot or added_profile_dot
		end

		DamageUtils.add_damage_network_player(damage_profile, target_index, attack_power_level, target_unit, attacker_unit, hit_zone_name, hit_position, attack_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, source_attacker_unit)
		-- New Code for THP Stagger
		local target_alive = HEALTH_ALIVE[target_unit]
		local just_died = false -- Added this

		if not HEALTH_ALIVE [target_unit] then -- If it dies make it say it just died
			just_died = true
		end

		if target_alive and not damage_profile.no_stagger or just_died and not damage_profile.no_stagger then --if just died still go through and stagger ai
			local stagger_power_level = power_level
	
			if not can_stagger then
				stagger_power_level = 0
			end
	
			DamageUtils.stagger_ai(t, damage_profile, target_index, stagger_power_level, target_unit, attacker_unit, hit_zone_name, attack_direction, boost_curve_multiplier, is_critical_strike, blocking, damage_source)
		end

		-- End
	elseif shield_breaking_hit then
		local shield_extension = ScriptUnit.has_extension(target_unit, "ai_shield_system")

		if shield_extension then
			local item_actually_dropped = shield_extension:break_shield()

			if item_actually_dropped and buff_extension then
				buff_extension:trigger_procs("on_broke_shield", target_unit)
			end
		end

		blocking = false
	end

	local target_alive = HEALTH_ALIVE[target_unit]

	if target_alive and not damage_profile.no_stagger then
		local stagger_power_level = power_level

		if not can_stagger then
			stagger_power_level = 0
		end

		DamageUtils.stagger_ai(t, damage_profile, target_index, stagger_power_level, target_unit, attacker_unit, hit_zone_name, attack_direction, boost_curve_multiplier, is_critical_strike, blocking, damage_source, source_attacker_unit)
	end
end)

--[[
mod:add_proc_function("heal_stagger_targets_on_melee", function (owner_unit, buff, params)
    if not Managers.state.network.is_server then
		return
	end

	if ALIVE[owner_unit] then
		local hit_unit = params[1]
		local damage_profile = params[2]
		local attack_type = damage_profile.charge_value
		local stagger_value = params[6]
		local stagger_type = params[4]
		local target_index = params[8]
		local breed = AiUtils.unit_breed(hit_unit)
		local multiplier = buff.multiplier
		local is_push = damage_profile.is_push
		local stagger_calulation = stagger_type or stagger_value
		local heal_amount = stagger_calulation * multiplier

		if is_push then
			heal_amount = 0.6
		end
		-- New
		local target_number = params[target_index]
		mod:echo(target_number)

		if target_index and target_index < 5 and breed and not breed.is_hero and (attack_type == "light_attack" or attack_type == "heavy_attack" or attack_type == "action_push") then
			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
		end
	end
end)
--]]
