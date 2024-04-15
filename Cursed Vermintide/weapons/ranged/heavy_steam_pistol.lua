local mod = get_mod("Vermintide Balance Manager")

--Masterwork Pistol

NewDamageProfileTemplates = NewDamageProfileTemplates or {} 

Weapons.heavy_steam_pistol_template_1.actions.action_one.fast_shot.impact_data.damage_profile = "MWP_os"
Weapons.heavy_steam_pistol_template_1.actions.action_one.fast_shot.impact_data.damage_profile = "MWP_os"
Weapons.heavy_steam_pistol_template_1.dodge_count = 6

NewDamageProfileTemplates.MWP_os = {
	charge_value = "instant_projectile",
	no_stagger_damage_reduction_ranged = true,
	shield_break = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1.4,
			1.25, -- 1.5
			1,
			0.75,
			0.5
		},
		impact_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1,
			1
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			1.2,
			1.25, -- 1.25
			1,
			0.75,
			0
		},
		impact = {
			1,
			1,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			1,
			1,
			1,
			0.75,
			0
		},
		impact = {
			1,
			1,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		headshot_boost_boss = 0, -- 0.5
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 1,
		attack_template = "shot_sniper",
		power_distribution_near = {
			attack = 1,
			impact = 0.5
		},
		power_distribution_far = {
			attack = 0.5,
			impact = 0.5
		},
		range_dropoff_settings = shotgun_dropoff_ranges
	}
}
