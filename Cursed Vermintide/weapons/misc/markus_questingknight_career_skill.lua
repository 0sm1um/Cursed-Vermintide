local mod = get_mod("Vermintide Balance Manager")

    NewDamageProfileTemplates = NewDamageProfileTemplates or {}
-- GK remove guaranteed crit or remove CW damage
-- Reduced Stagger to not Stagger Monsters
    NewDamageProfileTemplates.questing_knight_career_sword_tank_os = {
		charge_value = "heavy_attack",
		is_explosion = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1,
				2,
				1,
				1,
				0.25 -- 1
			},
			impact_armor_power_modifer = {
				1,
				1,
				0.5, -- 200
				1,
				1,
				0.5 -- 1
			}
		},
		armor_modifier = {
			attack = {
				1,
				1,
				2,
				0.1,
				1,
				1
			},
			impact = {
				1,
				1,
				0.5, -- 3
				0.1,
				1,
				1
			}
		},
		cleave_distribution = {
			attack = math.huge,
			impact = math.huge
		},
		default_target = {
			boost_curve_coefficient_headshot = 0.5,
			boost_curve_type = "tank_curve",
			boost_curve_coefficient = 0.5,
			attack_template = "heavy_slashing_tank",
			power_distribution = {
				attack = 1.33,
				impact = 2
			}
		}
	}

    Weapons.markus_questingknight_career_skill_weapon.actions.action_career_release.default_tank.damage_profile = "questing_knight_career_sword_tank_os"
