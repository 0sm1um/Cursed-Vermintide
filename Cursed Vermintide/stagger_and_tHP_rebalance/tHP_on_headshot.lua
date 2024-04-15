local mod = get_mod("Vermintide Balance Manager")

local weak_heal_amount_crit = 2.25
local weak_heal_amount_hs = 2.25

local heal_amount_crit = 2.5
local heal_amount_hs = 2.5

local strong_heal_amount_crit = 2.75
local strong_heal_amount_hs = 2.75

mod:add_text("regrowth_desc", "Melee critical stikes or headshots restore 2.5 temporary health. Melee critical headshots restore twice as much.")
mod:add_proc_function("heal_finesse_damage_on_melee", function (owner_unit, buff, params)
	if not Managers.state.network.is_server then
		return
	end

	local has_procced = buff.has_procced
	local hit_unit = params[1]
	local hit_zone_name = params[3]
	local target_number = params[4]
	local attack_type = params[2]
	local critical_hit = params[6]
	local breed = AiUtils.unit_breed(hit_unit)

	if target_number == 1 then
		buff.has_procced = false
		has_procced = false
	end

	if ALIVE[owner_unit] and breed and (attack_type == "light_attack" or attack_type == "heavy_attack") and not has_procced then
		if hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot" then
			buff.has_procced = true

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount_hs, "heal_from_proc")
		end

		if critical_hit then
			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount_crit, "heal_from_proc")

			buff.has_procced = true
		end
	end
end)

mod:add_text("weak_regrowth_desc", "Melee critical stikes or headshots restore 2.25 temporary health. Melee critical headshots restore twice as much.")
mod:add_proc_function("weak_heal_finesse_damage_on_melee", function (owner_unit, buff, params)
	if not Managers.state.network.is_server then
		return
	end

	local has_procced = buff.has_procced
	local hit_unit = params[1]
	local hit_zone_name = params[3]
	local target_number = params[4]
	local attack_type = params[2]
	local critical_hit = params[6]
	local breed = AiUtils.unit_breed(hit_unit)

	if target_number == 1 then
		buff.has_procced = false
		has_procced = false
	end

	if ALIVE[owner_unit] and breed and (attack_type == "light_attack" or attack_type == "heavy_attack") and not has_procced then
		if hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot" then
			buff.has_procced = true

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount_hs, "heal_from_proc")
		end

		if critical_hit then
			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount_crit, "heal_from_proc")

			buff.has_procced = true
		end
	end
end)

mod:add_text("strong_regrowth_desc", "Melee critical stikes or headshots restore 2.75 temporary health. Melee critical headshots restore twice as much.")
mod:add_proc_function("strong_heal_finesse_damage_on_melee", function (owner_unit, buff, params)
	if not Managers.state.network.is_server then
		return
	end

	local has_procced = buff.has_procced
	local hit_unit = params[1]
	local hit_zone_name = params[3]
	local target_number = params[4]
	local attack_type = params[2]
	local critical_hit = params[6]
	local breed = AiUtils.unit_breed(hit_unit)

	if target_number == 1 then
		buff.has_procced = false
		has_procced = false
	end

	if ALIVE[owner_unit] and breed and (attack_type == "light_attack" or attack_type == "heavy_attack") and not has_procced then
		if hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot" then
			buff.has_procced = true

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount_hs, "heal_from_proc")
		end

		if critical_hit then
			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount_crit, "heal_from_proc")

			buff.has_procced = true
		end
	end
end)
