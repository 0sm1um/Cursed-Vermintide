local mod = get_mod("Vermintide Balance Manager")

local healshare_leech_multiplier = 0.1

mod:add_text("conqueror_desc_3", "Healing yourself with a First Aid Kit or a Healing Draught also heals your nearby allies for 20.0%% of their maximum health. Clears any wounds. Whenever another party member recieves temporary health while at full health, you gain temporary health.")
mod:add_text("conqueror_sott", "Healing yourself with a First Aid Kit or a Healing Draught also heals your nearby allies for 20.0%% of their maximum health. Clears any wounds.")

mod:add_buff_template("healshare_leech_aura", {
    buff_to_add = "healshare_leech_buff",
    update_func = "activate_buff_on_distance",
    remove_buff_func = "remove_aura_buff",
    range = 100
})

mod:add_buff_template("healshare_leech_buff", {
    max_stacks = 1,
    multiplier = healshare_leech_multiplier,
    name = "healshare_leech_buff",
    authority = "server",
    buff_func = "thorn_sister_transfer_temp_health_at_full",
    event = "on_healed"
})

local talent_first_row = {
    "es_knight",
    "es_mercenary",
    "es_questingknight",
    "dr_ironbreaker",
    "wh_zealot",
    "bw_unchained",
    "wh_priest",
    "es_huntsman",
    "dr_ranger",
    "dr_engineer",
    "wh_captain",
    "bw_scholar",
    "bw_adept",
    "bw_necromancer",
    "dr_slayer",
    "we_shade",
    "we_maidenguard",
    "we_waywatcher",
    "wh_bountyhunter"
}

for i=1, #talent_first_row do
	local career = talent_first_row[i]
	mod:modify_talent(career, 1, 3, {
		description = "conqueror_desc_3",
		buffs = {
			"kerillian_maidenguard_conqueror",
            "healshare_leech_aura"
		}
	})
end

