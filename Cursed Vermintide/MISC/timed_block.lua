local mod = get_mod("Vermintide Balance Manager")

local block_window = 0.66 -- 0.5

-- Client

mod:hook_origin(ActionMeleeStart, "client_owner_post_update", function (self, dt, t, world)
	local action = self.current_action
	local owner_unit = self.owner_unit
	local action_start_time = self.action_start_t
	local blocking_charge = action.blocking_charge
	local status_extension = self.status_extension

	if not status_extension.blocking and blocking_charge and t > action_start_time + self._block_delay then
		local go_id = Managers.state.unit_storage:go_id(owner_unit)

		if not LEVEL_EDITOR_TEST then
			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, true)
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_charge_blocking", go_id, true)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, true)
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_charge_blocking", go_id, true)
			end
		end

		status_extension:set_blocking(true)
		status_extension:set_charge_blocking(true)

		status_extension.timed_block = t + block_window
	end

	if self.zoom_condition_function and self.zoom_condition_function(action.lookup_data) then
		local input_extension = self.input_extension
		local buff_extension = self.buff_extension

		if not status_extension:is_zooming() and t >= self.aim_zoom_time then
			status_extension:set_zooming(true, action.default_zoom)
		end

		if buff_extension:has_buff_perk("increased_zoom") and status_extension:is_zooming() and input_extension:get("action_three") then
			status_extension:switch_variable_zoom(action.buffed_zoom_thresholds)
		end
	end
end)

mod:hook_origin(ActionBlock, "client_owner_start_action", function (self, new_action, t)
	ActionBlock.super.client_owner_start_action(self, new_action, t)

	self.current_action = new_action
	self.action_time_started = t

	local input_extension = ScriptUnit.extension(self.owner_unit, "input_system")

	input_extension:reset_input_buffer()

	local owner_unit = self.owner_unit
	local go_id = Managers.state.unit_storage:go_id(owner_unit)

	if not LEVEL_EDITOR_TEST then
		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, true)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, true)
		end
	end

	Unit.flow_event(self.first_person_unit, "sfx_block_started")

	local status_extension = self._status_extension

	status_extension:set_blocking(true)

	status_extension.timed_block = t + block_window
end)

