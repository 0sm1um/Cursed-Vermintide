local mod = get_mod("Vermintide Balance Manager")

Weapons.staff_death.dodge_count = 2 -- 1

Weapons.staff_death.actions.action_one.soul_rip.damage_steps = {
    {
        damage_profile = "staff_suck_damage",
        can_crit = false,
        proc_buffs = true,
        overcharge_amount = 1,
        repeat_count = 4,
        repeat_delay = 0.2,
        start_delay = 0.25,
    },
    {
        can_crit = true,
        damage_profile = "soul_rip",
        overcharge_amount = 10,
        proc_buffs = true,
        repeat_count = 1,
        repeat_delay = 0,
        start_delay = 0.5,
    },
}

Weapons.staff_death.actions.action_one.soul_rip.buff_data = {
    {
        start_time = 0,
        external_multiplier = 0.8, -- 0.6
        buff_name = "planted_fast_decrease_movement"
    }
}

Weapons.staff_death.actions.action_two.default.buff_data = {
    {
        start_time = 0,
        external_multiplier = 0.85,
        buff_name = "planted_fast_decrease_movement"
    }
}