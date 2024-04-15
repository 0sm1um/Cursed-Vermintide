local mod = get_mod("Vermintide Balance Manager")

local strong_mod = 1.25
local very_strong_mod = 1.5

NewBreedTweaks = NewBreedTweaks or {} --table.clone(BreedTweaks)
NewBreedTweaks.bloodlust_health = {
	beastmen_horde = 1.5,
    chaos_roamer = 3,
    skaven_special = 8,
    chaos_warrior = 20, -- 20
    skaven_elite = 8, -- 8
    beastmen_roamer = 3,
    chaos_elite = 10, -- 10
    beastmen_elite = 12, -- 12
    skaven_horde = 1,
    chaos_special = 10,
    skaven_roamer = 2,
    monster = 35,
    chaos_horde = 1.5
}

Breeds.beastmen_bestigor.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_elite
Breeds.beastmen_gor.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_roamer
Breeds.beastmen_gor_dummy.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_roamer
Breeds.beastmen_minotaur.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.beastmen_standard_bearer.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_elite
Breeds.beastmen_ungor_archer.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_horde
Breeds.beastmen_ungor.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_horde
Breeds.beastmen_ungor_dummy.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_horde
Breeds.chaos_berzerker.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_elite
Breeds.chaos_corruptor_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_exalted_champion_warcamp.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_exalted_sorcerer_drachenfels.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_exalted_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_fanatic.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_horde
Breeds.chaos_marauder_with_shield.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_roamer
Breeds.chaos_marauder.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_roamer
Breeds.chaos_marauder_tutorial.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_roamer
Breeds.chaos_mutator_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_plague_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_raider.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_elite
Breeds.chaos_raider_tutorial.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_elite
Breeds.chaos_spawn.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_tentacle_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_troll.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_vortex_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_warrior.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_warrior
Breeds.skaven_clan_rat_with_shield.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_roamer
Breeds.skaven_clan_rat.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_roamer
Breeds.skaven_clan_rat_tutorial.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_roamer
Breeds.skaven_explosive_loot_rat.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_roamer
Breeds.skaven_grey_seer.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_gutter_runner.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_loot_rat.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_pack_master.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_plague_monk.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_elite
Breeds.skaven_poison_wind_globadier.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_rat_ogre.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_ratling_gunner.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_slave.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_horde
Breeds.skaven_storm_vermin_champion.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_storm_vermin_warlord.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_storm_vermin_with_shield.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_elite
Breeds.skaven_storm_vermin.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_elite
Breeds.skaven_storm_vermin_commander.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_elite
Breeds.skaven_stormfiend_boss.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_stormfiend.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_warpfire_thrower.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special

mod:add_proc_function("strong_heal_percentage_of_enemy_hp_on_melee_kill", function (owner_unit, buff, params)
	if not Managers.state.network.is_server then
        return
    end

    if ALIVE[owner_unit] then
        local killing_blow_data = params[1]

        if not killing_blow_data then
            return
        end

        local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

        if attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
            local breed = params[2]

            if breed and not breed.is_hero then
                local heal_amount = breed.bloodlust_health or 0
                heal_amount = heal_amount * strong_mod
                DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
            end
        end
    end
end)

mod:add_proc_function("very_strong_heal_percentage_of_enemy_hp_on_melee_kill", function (owner_unit, buff, params)
	if not Managers.state.network.is_server then
        return
    end

    if ALIVE[owner_unit] then
        local killing_blow_data = params[1]

        if not killing_blow_data then
            return
        end

        local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

        if attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
            local breed = params[2]

            if breed and not breed.is_hero then
                local heal_amount = breed.bloodlust_health or 0
                heal_amount = heal_amount * very_strong_mod
                DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
            end
        end
    end
end)