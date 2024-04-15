local mod = get_mod("Cursed Vermintide")

mod.activate_cursed_vermintide = function()
    -- Stagger & THP Rebalance
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/stagger_and_tHP_rebalance/bulwark")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/stagger_and_tHP_rebalance/enhanced_power")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/stagger_and_tHP_rebalance/tHP_on_kill")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/stagger_and_tHP_rebalance/tHP_on_headshot")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/stagger_and_tHP_rebalance/tHP_on_stagger")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/stagger_and_tHP_rebalance/tHP_on_cleave")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/stagger_and_tHP_rebalance/healshare")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/stagger_and_tHP_rebalance/hooks")

    -- Career Changes
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/bardin/ranger_veteran")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/bardin/ironbreaker")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/bardin/slayer")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/bardin/outcast_engineer")

    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/kruber/mercenary")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/kruber/foot_knight")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/kruber/huntsman")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/kruber/grail_knight")

    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/saltzpyre/witch_hunter_captain")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/saltzpyre/bounty_hunter")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/saltzpyre/zealot")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/saltzpyre/warrior_priest")

    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/kerillian/waystalker")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/kerillian/handmaiden")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/kerillian/shade")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/kerillian/sister_of_the_thorn")

    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/sienna/battle_wizard")
    --mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/sienna/pyromancer")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/sienna/unchained")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/careers/sienna/necromancer")

    --mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/MISC/darkness_settings")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/MISC/mass_modifiers")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/MISC/passive_zoom")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/MISC/slot_settings")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/MISC/timed_block")
    --mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/MISC/special_breed_tweaks")

    -- Melee Weapon Changes

    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_axes")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_axes_shield")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_axes_wood_elf")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_crowbills")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_dagger_wizard")
    --mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_falchions")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_flails")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_flails_flaming")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_flails_shield")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_hammers")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_hammers_priest")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_hammers_shield")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_hammers_shield_priest")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_hammers_wizard")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_spears_shield")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_swords")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_swords_shield")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_swords_shield_breton")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_swords_wizard")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/1h_swords_wood_elf")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/2h_axes")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/2h_axes_wood_elf")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/2h_cog_hammers")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/2h_hammers")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/2h_hammers_priest")      -- Holy Greathammer
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/2h_sword")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/2h_swords_executioner")
    --mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/2h_swords_wood_elf")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/bastard_swords")         -- Bret Sword
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/dual_wield_axe_falchion")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/dual_wield_axes")
    --mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/dual_wield_daggers")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/dual_wield_hammer_sword") -- Mace and Sword
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/dual_wield_hammers")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/dual_wield_hammers_priest")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/dual_wield_swords")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/dual_wield_sword_dagger")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/fencing_swords")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/halberds")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/staff_scythe")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/melee/spears_wood_elf")

    -- Ranged weapon changes
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/bw_deus_01")              -- Coruscation Staff
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/brace_of_pistols")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/drakegun")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/dr_deus_01")              -- Trollhammer
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/wh_deus_01")              -- Griffon's Foot
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/heavy_steam_pistol")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/javelin")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/longbows")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/longbows_empire")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/repeating_pistols")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/staff_blast_beam")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/staff_death")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/staff_life")              -- Deepwood Staff
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/staff_fireball_fireball")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/staff_fireball_geiser")   -- Conflagration Staff
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/staff_flamethrower")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/staff_spark_spear")       -- Bolt Staff
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/ranged/we_deus_01")

    -- Misc/non weapon weapons
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/misc/bardin_engineer_career_skill")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/misc/markus_questingknight_career_skill")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/misc/sienna_scholar_career_skill")
    mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/weapons/misc/victor_bountyhunter_career_skill")    

    mod.update_weapons()
end
