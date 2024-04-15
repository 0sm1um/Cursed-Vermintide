local mod = get_mod("Vermintide Balance Manager")

local weak_thp_on_cleave_amount = 0.75
local weak_thp_on_cleave_max_targets = 5

local thp_on_cleave_amount = 1
local thp_on_cleave_max_targets = 5

local strong_thp_on_cleave_amount = 1.25
local strong_thp_on_cleave_max_targets = 5

mod:add_text("reaper_desc", "Damaging multiple enemies in one swing with a melee weapon grants 1 temporary health per enemy cleaved. Max 5 enemies.")
mod:add_proc_function("heal_damage_targets_on_melee", function  (owner_unit, buff, params, world, param_order)
    if not Managers.state.network.is_server then
        return
    end

    if not ALIVE[owner_unit] then
        return
    end

    local attack_type = params[param_order.buff_attack_type]

    if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
        return
    end

    local hit_unit = params[param_order.attacked_unit]
    local breed = AiUtils.unit_breed(hit_unit)

    if not breed then
        return
    end

    local damage_amount = params[param_order.damage_amount]

    if damage_amount > 0 then
        local buff_template = buff.template
        local max_targets = weak_thp_on_cleave_max_targets
        local target_number = params[param_order.target_index]

        if target_number and target_number <= max_targets then
            local heal_amount = thp_on_cleave_amount

            if target_number == 1 then
                -- Nothing
            end

            DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
        end
    end
end)

mod:add_text("weak_reaper_desc", "Damaging multiple enemies in one swing with a melee weapon grants 0.75 temporary health per enemy cleaved. Max 5 enemies.")
mod:add_proc_function("weak_heal_damage_targets_on_melee", function  (owner_unit, buff, params, world, param_order)
    if not Managers.state.network.is_server then
        return
    end

    if not ALIVE[owner_unit] then
        return
    end

    local attack_type = params[param_order.buff_attack_type]

    if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
        return
    end

    local hit_unit = params[param_order.attacked_unit]
    local breed = AiUtils.unit_breed(hit_unit)

    if not breed then
        return
    end

    local damage_amount = params[param_order.damage_amount]

    if damage_amount > 0 then
        local buff_template = buff.template
        local max_targets = thp_on_cleave_max_targets
        local target_number = params[param_order.target_index]

        if target_number and target_number <= max_targets then
            local heal_amount =  weak_thp_on_cleave_amount

            if target_number == 1 then
                -- Nothing
            end

            DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
        end
    end
end)

mod:add_text("strong_reaper_desc", "Damaging multiple enemies in one swing with a melee weapon grants 1.25 temporary health per enemy cleaved. Max 5 enemies.")
mod:add_proc_function("strong_heal_damage_targets_on_melee", function  (owner_unit, buff, params, world, param_order)
    if not Managers.state.network.is_server then
        return
    end

    if not ALIVE[owner_unit] then
        return
    end

    local attack_type = params[param_order.buff_attack_type]

    if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
        return
    end

    local hit_unit = params[param_order.attacked_unit]
    local breed = AiUtils.unit_breed(hit_unit)

    if not breed then
        return
    end

    local damage_amount = params[param_order.damage_amount]

    if damage_amount > 0 then
        local buff_template = buff.template
        local max_targets = strong_thp_on_cleave_max_targets
        local target_number = params[param_order.target_index]

        if target_number and target_number <= max_targets then
            local heal_amount = strong_thp_on_cleave_amount

            if target_number == 1 then
                -- Nothing
            end

            DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
        end
    end
end)
