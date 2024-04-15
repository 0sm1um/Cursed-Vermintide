local mod = get_mod("Vermintide Balance Manager")

BuffTemplates.power_level_unbalance.buffs = {
    {
        max_stacks = 1,
        name = "power_level_unbalance",
        stat_buff = "power_level",
        multiplier = 0.1
    }
}

mod:add_text("power_level_unbalance_desc", "Increased total power level by 10%%. This is calculated before all other buffs are applied.")
