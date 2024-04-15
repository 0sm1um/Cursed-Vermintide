local mod = get_mod("Vermintide Balance Manager")

BuffTemplates.tank_unbalance_buff.buffs = {
	{
		refresh_durations = true,
		name = "tank_unbalance_buff",
		stat_buff = "unbalanced_damage_taken",
		max_stacks = 1,
		duration = 4,
		bonus = 0.15,
		--duration_end_func = "remove_bulwark_outline"
		--remove_buff_func = "remove_unbalance_debuff_on_stagger"
	}
}
mod:add_text("tank_unbalance_desc", "Enemies that you stagger take 15%% more damage for 4 seconds. Deal 20%% more damage to staggered enemies. Each hit against a staggered enemy adds another count of stagger. Bonus damage is increased to 40%% against enemies afflicted by more than one stagger effect.")
--[[
OutlineSettings.colors.bulwark_highlight = {
	variable = "outline_color_alpha",
	outline_multiplier = 1,
	pulse_multiplier = 25,
	pulsate = false,
	outline_multiplier_variable = "outline_multiplier_alpha",
	channel = {
		0,
		0,
		150,
		0
	},
	color = {
		255,
		255,
		255,
		255
	}
}
OutlineSettings.ranges.bulwark_highlight = 5

OutlineSettings.templates.bulwark_highlight = {
	priority = 15,
	method = "ai_alive",
	outline_color = OutlineSettings.colors.bulwark_highlight,
	flag = OutlineSettings.flags.wall_occluded
}

OutlineSystem.system_extensions = {
	[#OutlineSystem.system_extensions + 1] = "BulwarkOutlineExtension"
}

OutlineSystem.add_ext_functions.BulwarkOutlineExtension = function (extension)
	extension:add_outline({
		method = "never",
		outline_color = OutlineSettings.colors.bulwark_highlight,
		flag = OutlineSettings.flags.non_wall_occluded
	})
	extension.apply_method = "unit"
	extension.pinged_method = "not_in_dark"
end

mod:add_buff_function("remove_bulwark_outline", function (owner_unit, buff, params)
	--mod:echo(owner_unit.breed)
	--mod:echo(buff)
	--mod:echo(params)
	--require 'pl.pretty'.dump(buff)
	--require 'pl.pretty'.dump(owner_unit)
	target_unit = params[1]
	local outline_extension = ScriptUnit.has_extension(target_unit, "outline_system")
	if outline_extension then
		local outline_template = table.shallow_copy(OutlineSettings.templates.bulwark_highlight, true)
		local outline_id = buff.outline_id
		outline_extension:remove_outline(outline_id)
	end
end)

--[[
mod:add_proc_function("unbalance_debuff_on_stagger", function (owner_unit, buff, params)
	local hit_unit = params[1]
	local is_dummy = Unit.get_data(hit_unit, "is_dummy")

	if ALIVE[owner_unit] and (is_dummy or Unit.alive(hit_unit)) and Managers.player.is_server then
		local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

		if buff_extension then
			buff_extension:add_buff("tank_unbalance_buff")
			-- New shit
			--local player_manager = Managers.player
			--local player = PlayerManager.player(owner_unit)
			if Unit.alive(owner_unit) and Unit.alive(hit_unit) then
				local game_time = Managers.time:time("game")
				local outline_extension = ScriptUnit.has_extension(hit_unit, "outline_system")

				local outline_template = table.shallow_copy(OutlineSettings.templates.bulwark_highlight, true)
				outline_extension:add_outline(outline_template)
			end
		end
	end
end)
--]]



--[[
mod:hook(OutlineSystem, "update", function(self, context, t)
	if self._disabled or script_data.disable_outlines then
		return
	end

	if not self.camera_unit then
		return
	end

	local num_units = #self.units

	if num_units == 0 then
		return
	end

	local dt = context.dt
	local num_to_check_per_frame = math.min(num_units, 20)
	local max_slow_checks_per_frame = 3
	local slow_checks_done = 0
	local current_index = self.current_index
	local units = self.units
	local extensions = self.unit_extension_data
	local active_cutscene = self:_is_cutscene_active() or self:_is_photomode_active()

	for i = 1, num_to_check_per_frame do
		current_index = current_index % num_units + 1
		local unit = units[current_index]
		local extension = extensions[unit]

		if extension then
			local method = extension.method
			local flag_swiched = extension.prev_flag and extension.prev_flag ~= extension.flag

			if flag_swiched then
				self:outline_unit(unit, extension.prev_flag, Color(0, 0, 0, 0), false, extension.apply_method)

				extension.prev_flag = nil
			end

			local do_outline = false
			local slow_check = false

			if not active_cutscene then
				do_outline, slow_check = self[method](self, unit, extension)
			end

			if extension.outlined ~= do_outline or extension.reapply then
				local c = extension.outline_color.channel
				local channel = Color(c[1], c[2], c[3], c[4])

				self:outline_unit(unit, extension.flag, channel, do_outline, extension.apply_method)

				extension.outlined = do_outline
			end

			extension.reapply = false

			if slow_check then
				slow_checks_done = slow_checks_done + 1

				if max_slow_checks_per_frame <= slow_checks_done then
					break
				end
			end

			local outline_extension = ScriptUnit.has_extension(unit, "outline_system")
			if outline_extension then
				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
				if buff_extension then
					if not buff_extension.has_buff_type("tank_unbalance") then
						outline_extension:remove_outline(outline_id)
					if buff_extension.has_buff_type("tank_unbalance") then
			end
		end
	end
	self.current_index = current_index

	self:_update_pulsing(dt, t)
end)
--]]
--[[
local ping_extension = ScriptUnit.has_extension(pinged_unit, "ping_system")

	if not ping_extension then
		return
	end

	local do_ping, chat_messages, ping_icon = nil

	for _, data in pairs(PingTemplates) do
		if data:check_func(pinger_unit, pinged_unit) then
			do_ping, chat_messages, ping_icon = data:exec_func(self, pinger_unit, pinged_unit, ping_type)

			break
		end
	end

	if not do_ping then
		return
	end

	if ping_extension.set_pinged then
		local apply_outline = self:_is_outline_enabled(pinged_unit)

		ping_extension:set_pinged(true, flash, pinger_unit, apply_outline)
	end
	--]]
