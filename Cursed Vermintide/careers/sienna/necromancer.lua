local mod = get_mod("Cursed Vermintide")
-- Passive Tweaks

-- Mistress of Death
local overcharge_fraction_to_lose = 0.25

-- Lifetaker
CareerConstants.bw_necromancer.lifetaker_max_stacks = 5
CareerConstants.bw_necromancer.lifetaker_duration = 5
CareerConstants.bw_necromancer.lifetaker_bonus = 0.01
mod:add_text("career_passive_desc_bw_necromancer_c", "Killing an enemy grants 1%% additional crit chance for 4 seconds. Max Stacks 5.")

mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_ability_cooldown_on_hit", {
	bonus = 0.2
})

mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_ability_cooldown_on_damage_taken", {
	bonus = 0.2
})

-- Level 10 row

local power_on_crit = 0.25
--mod:add_text("sienna_necromancer_2_3_desc", "WRITEME")

-- Level 20 Row
local explosion_radius = 1.5 -- 3.5
local propagation_multilplier = .25 -- .25
--mod:add_text("sienna_necromancer_4_1_desc", "WRITEME")

-- Level 25 Row

-- Spirit Leech
local cooldown_on_elite_kill = 0.075 -- 0.15
mod:add_text("sienna_necromancer_5_1_desc", "Killing an elite enemy restores 7.5%% cooldown.")
-- Curse of Undeath
local damage_reduction_on_ult_stacks = 6 -- 3
local damage_reduction_on_ult_amount = -0.3 -- 0.8

mod:add_text("sienna_necromancer_5_2_desc", "Casting Raise Dead reduces damage inflicted on Sienna by 30%% for the next 6 hits.")

local overcharge_for_souls = 0.24 -- 0.12
mod:add_text("sienna_necromancer_5_3_desc", "Venting 24%% overcharge unleashes a soul that steals health from a nearby enemy restoring 4 temporary health.")

mod:hook_origin(ActionCareerBWNecromancerCommandVent, "client_owner_start_action", function (self, new_action, t, chain_action_data, power_level)
    ActionCareerBWNecromancerCommandVent.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local target_pet = self._command_ability:vent_command_target()
	local _, fraction_charge_removed = self.overcharge_extension:remove_charge_fraction(overcharge_fraction_to_lose)
	local player_unit = self._owner_unit
	local player = Managers.player:owner(player_unit)

	if player and player.local_player then
		Managers.state.achievement:trigger_event("sacrifice_skeleton", target_pet, fraction_charge_removed, player_unit)
	end

	local fp_extension = self._fp_extension

	if fp_extension then
		local fp_unit = fp_extension:get_first_person_unit()
		local trail_node = Unit.node(fp_unit, "j_aim_target")

		self._sacrifice_vfx_trail = ScriptWorld.create_particles_linked(self._world, "fx/pet_skeleton_sacrifice_trail", fp_unit, trail_node, "destroy")

		local hand_node = Unit.node(fp_unit, "j_righthand")

		self._sacrifice_vfx_hand = ScriptWorld.create_particles_linked(self._world, "fx/necromancer_skeleton_sacrifice_hand", fp_unit, hand_node, "destroy")
		self._vfx_stop_t = t + 0.8
	end

	if self._talent_extension:has_talent("sienna_necromancer_4_3") then
		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:add_buff_synced(player_unit, "sienna_necromancer_4_3_withering_touch", BuffSyncType.LocalAndServer)
	end

	if HEALTH_ALIVE[target_pet] then
		self._command_ability:command_sacrifice(target_pet)
	end
end)

------------------
-- Level 05 Row --
------------------
--[[
mod:modify_talent("bw_necromancer", 1, 1, {
	description = "strong_regrowth_desc"
})
--]]

------------------
-- Level 10 Row --
------------------
-- Reaping

mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_2_3", {
    multiplier = power_on_crit
})


------------------
-- Level 20 Row --
------------------
mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_4_1_cursed_blood", {
    radius = explosion_radius,
	propagation_multiplier = propagation_multilplier,
})

------------------
-- Level 25 Row --
------------------

-- Spirit Leech
mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_5_1_reduced_overcharge", {
	multiplier = cooldown_on_elite_kill
})

-- Curse of the Undeath
mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_5_2", {
    buffs_to_add = table.fill({}, damage_reduction_on_ult_stacks, "sienna_necromancer_5_2_counter")
})
mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_5_2_counter", {
    max_stacks = damage_reduction_on_ult_stacks
})
mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_5_2_buff", {
    multiplier = damage_reduction_on_ult_amount
})

mod:modify_talent_buff_template("bright_wizard", "sienna_necromancer_5_3", {
    overcharge_threshold = 0.12
})

------------------
-- Level 30 Row --
------------------