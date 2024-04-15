local mod = get_mod("Vermintide Balance Manager")

local max_range_for_targetting = 40
require("scripts/unit_extensions/weapons/projectiles/true_flight_templates")
require("scripts/unit_extensions/weapons/projectiles/true_flight_utility")

local actor_unit = Actor.unit
local actor_node = Actor.node
local unit_actor = Unit.actor
local unit_has_node = Unit.has_node
local unit_node = Unit.node
local unit_get_data = Unit.get_data
local unit_world_position = Unit.world_position
local vector3_distance_squared = Vector3.distance_squared
local vector3_length = Vector3.length
local vector3_dot = Vector3.dot
local RAYCAST_INDEX_POSITION = 1
local RAYCAST_INDEX_DISTANCE = 2
local RAYCAST_INDEX_NORMAL = 3
local RAYCAST_INDEX_ACTOR = 4
local EMPTY_TABLE = {}

mod:hook_origin(ActionCareerTrueFlightAim, "client_owner_post_update", function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local time_to_shoot = self.time_to_shoot
	local current_target = self.target
	local owner_player = Managers.player:owner(owner_unit)
	local is_bot = owner_player and owner_player.bot_player

	if current_action.overcharge_interval then
		self.overcharge_timer = self.overcharge_timer + dt

		if self.overcharge_timer >= current_action.overcharge_interval then
			if self.overcharge_extension then
				local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[current_action.overcharge_type]

				self.overcharge_extension:add_charge(overcharge_amount)
			end

			self.overcharge_timer = 0
		end
	end

	if not self.zoom_condition_function or self.zoom_condition_function() then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if not status_extension:is_zooming() and t >= self.aim_zoom_time then
			status_extension:set_zooming(true, current_action.default_zoom)
		end

		if buff_extension:has_buff_type("increased_zoom") and status_extension:is_zooming() and input_extension:get("action_three") then
			status_extension:switch_variable_zoom(current_action.buffed_zoom_thresholds)
		elseif current_action.zoom_thresholds and status_extension:is_zooming() and input_extension:get("action_three") then
			status_extension:switch_variable_zoom(current_action.zoom_thresholds)
		end
	end

	if not self.played_aim_sound and t >= self.aim_sound_time and not is_bot then
		local sound_event = current_action.aim_sound_event

		if sound_event then
			local wwise_world = self.wwise_world

			WwiseWorld.trigger_event(wwise_world, sound_event)
		end

		self.played_aim_sound = true
	end

	if current_target and not HEALTH_ALIVE[current_target] then
		if not is_bot then
			self:_mark_target(nil)
		end

		self.target = nil
		self.aimed_target = nil
		current_target = nil
	end

	local required_aim_time = current_action.aim_time or 0.1
	local aim_sticky_time = current_action.aim_sticky_time or 0

	if required_aim_time <= self.aim_timer and (not current_target or aim_sticky_time <= self.aim_sticky_timer) then
		local physics_world = World.get_data(world, "physics_world")
		local first_person_extension = self.first_person_extension
		local player_position, player_rotation = first_person_extension:get_projectile_start_position_rotation()
		local direction = Vector3.normalize(Quaternion.forward(player_rotation))
		local results, num_results

		if current_action.aim_obstructed_by_walls then
			results, num_results = PhysicsWorld.immediate_raycast_actors(physics_world, player_position, direction, "dynamic_collision_filter", "filter_ray_true_flight_ai_only", "dynamic_collision_filter", "filter_ray_true_flight_hitbox_only", "static_collision_filter", "filter_player_ray_projectile_static_only")
		else
			results, num_results = PhysicsWorld.immediate_raycast_actors(physics_world, player_position, direction, "dynamic_collision_filter", "filter_ray_true_flight_ai_only", "dynamic_collision_filter", "filter_ray_true_flight_hitbox_only")
		end

		local side_manager = Managers.state.side
		local side_by_unit = side_manager.side_by_unit
		local hit_unit
		local higest_priority = -1
		local side = self.side

		if num_results > 0 then
			local prio_breeds = self.prioritized_breeds or EMPTY_TABLE
			local ignore_bosses = current_action.ignore_bosses

			for i = 1, num_results do
				local result = results[i]
				local hit_actor = result[RAYCAST_INDEX_ACTOR]

				if hit_actor then
					local unit = actor_unit(hit_actor)

					if HEALTH_ALIVE[unit] then
						local hit_unit_side = side_by_unit[unit]

						if not hit_unit_side or side_manager:is_enemy_by_side(side, hit_unit_side) then
							local node = actor_node(hit_actor)
							local breed = AiUtils.unit_breed(unit)
							local hit_zone = breed and breed.hit_zones_lookup[node]

							if hit_zone and hit_zone.name ~= "afro" and not breed.no_autoaim and (not ignore_bosses or not breed.boss) then
								local priority = prio_breeds[breed.name] or -1

								if priority > 0 and higest_priority < priority then
									hit_unit = unit
									higest_priority = priority
								else
									hit_unit = hit_unit or unit
								end
							end
						end
					end
				end
			end
		end

		if current_action.aim_sticky_target_size and POSITION_LOOKUP[current_target] and self._is_sticky_target and higest_priority <= self._current_target_priority then
			local old_target_distance_sq = vector3_distance_squared(POSITION_LOOKUP[current_target], player_position)
			local new_target_distance_sq = hit_unit and vector3_distance_squared(POSITION_LOOKUP[hit_unit], player_position) or math.huge

			if old_target_distance_sq < new_target_distance_sq then
				local target_node = unit_has_node(current_target, "j_spine1") and unit_node(current_target, "j_spine1") or 0
				local position = unit_world_position(current_target, target_node)
				local to_old_target = position - player_position
				local dist_to_old_target = vector3_length(to_old_target)
				local dir_to_old_target = dist_to_old_target > 0 and to_old_target / dist_to_old_target or 0
				local radius = current_action.aim_sticky_target_size
				local sticky_target_threshold = math.cos(math.atan2(radius, dist_to_old_target))
				local aim_dir = vector3_dot(direction, dir_to_old_target)

				if sticky_target_threshold < aim_dir then
					hit_unit = current_target
				else
					self._is_sticky_target = false
				end
			end
		end

		if hit_unit then
			if self.aimed_target ~= hit_unit then
				self.aimed_target = hit_unit
				self.aim_timer = 0

				if ALIVE[hit_unit] and current_target ~= hit_unit then
					current_target = hit_unit
					self.target = hit_unit

					-- Highlight Range Limit Code
					local owner_unit = self.owner_unit
					if self._weapon_extension then
						local item_data = rawget(ItemMasterList, self._weapon_extension.item_name)
						local weapon_template_name = item_data and item_data.template
						-- New Range Limit Code
						if weapon_template_name == "staff_life" then
							local new_target_distance_sq = hit_unit and vector3_distance_squared(POSITION_LOOKUP[hit_unit], player_position) or math.huge
							if new_target_distance_sq < max_range_for_targetting^2 then
								self:_mark_target(hit_unit)
							end
						else
							self:_mark_target(hit_unit)
						end
					end

					self.aim_sticky_timer = 0
					self._is_sticky_target = higest_priority > 0
					self._current_target_priority = higest_priority
				end
			end
		elseif current_action.target_break_size and current_target then
			local target_node = unit_has_node(current_target, "j_spine1") and unit_node(current_target, "j_spine1") or 0
			local position = unit_world_position(current_target, target_node)
			local dir_to_target, dist_to_target = Vector3.direction_length(position - player_position)
			local radius = current_action.target_break_size
			local target_break_threshold = math.cos(math.atan2(radius, dist_to_target))
			local aim_dir = vector3_dot(direction, dir_to_target)

			if aim_dir < target_break_threshold then
				self:_mark_target(nil)

				self.target = nil
				self.aimed_target = nil
				current_target = nil
			end
		end
	end

	self.charge_value = math.min(math.max(t - time_to_shoot, 0) / self.charge_time, 1)

	if not is_bot then
		local charge_sound_parameter_name = current_action.charge_sound_parameter_name

		if charge_sound_parameter_name then
			local wwise_world = self.wwise_world
			local wwise_source_id = self.wwise_source_id

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, charge_sound_parameter_name, self.charge_value)
		end

		if self.charge_ready_sound_event and self.charge_value >= 1 then
			self.first_person_extension:play_hud_sound_event(self.charge_ready_sound_event)

			self.charge_ready_sound_event = nil
		end
	end

	self.aim_timer = self.aim_timer + dt
	self.aim_sticky_timer = self.aim_sticky_timer + dt
end)

mod:hook_origin(ActionSpiritStorm, "fire", function (self, reason)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local target_unit = self.target
	local storm_spawn_position = POSITION_LOOKUP[target_unit]
	local overcharge = current_action.overcharge_amount

	-- New Range Limit Code
	if storm_spawn_position then
		local player_position = POSITION_LOOKUP[self.owner_unit]
		local distance_sq = vector3_distance_squared(storm_spawn_position, player_position) or math.huge
		if distance_sq < max_range_for_targetting^2 then
		-- Original Hook code in here
			local owner_unit_id = Managers.state.unit_storage:go_id(owner_unit)
			local target_unit_id = Managers.state.unit_storage:go_id(self.target)

			self.network_transmit:send_rpc_server("rpc_summon_vortex", owner_unit_id, target_unit_id)

			local target_breed = Unit.get_data(target_unit, "breed")

			if target_breed and target_breed.is_player then
				overcharge = current_action.overcharge_amount_player_target
			end
		end
	end
	
	if overcharge then
		local buff_extension = self.owner_buff_extension

		if self.is_critical_strike and buff_extension:has_buff_perk("no_overcharge_crit") then
			overcharge = 0
		end

		self.overcharge_extension:add_charge(overcharge)
	end

	local fire_sound_event = self.current_action.fire_sound_event

	if fire_sound_event then
		local play_on_husk = self.current_action.fire_sound_on_husk
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event(fire_sound_event, nil, play_on_husk)
	end

	if current_action.alert_enemies and storm_spawn_position then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, storm_spawn_position, current_action.alert_sound_range_fire)
	end
end)

--Deepwood Staff
VortexTemplates.spirit_storm.time_of_life = { 5,5 } -- 8
VortexTemplates.spirit_storm.reduce_duration_per_breed = { chaos_warrior = 0.5 }

Weapons.staff_life.actions.action_one.default.apply_shot_cost_once = true -- true

Weapons.staff_life.actions.action_one.cast_vortex.overcharge_amount = 10 -- 8

PlayerUnitStatusSettings.overcharge_values.life_staff_light = 4 -- 4

Weapons.staff_life.overcharge_data = {
	explosion_template = "overcharge_explosion_brw",
	hit_overcharge_threshold_sound = "ui_special_attack_ready",
	overcharge_threshold = 10,
	overcharge_value_decrease_rate = 0.5, -- 1
	overcharge_warning_critical_sound_event = "weapon_life_staff_overcharge_warning_critical",
	overcharge_warning_high_sound_event = "weapon_life_staff_overcharge_warning_high",
	overcharge_warning_med_sound_event = "weapon_life_staff_overcharge_warning_medium",
	time_until_overcharge_decreases = 3, -- 0.5
}
