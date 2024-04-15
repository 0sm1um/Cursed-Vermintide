local mod = get_mod("Vermintide Balance Manager")
	NewDamageProfileTemplates = NewDamageProfileTemplates or {}

	NewDamageProfileTemplates.light_cog_hammer_os = {
		stagger_distance_modifier = 1.15,
		cleave_distribution = {
		  impact = 0.2, -- 0.8
		  attack = 0.2
		},
		armor_modifier = {
		  impact = {
			1,
			1,
			0.5,
			1,
			0.75
		  },
		  attack = {
			1,
			0.2,
			1,
			1,
			0.75
		  }
		},
		default_target = {
		  attack_template = "light_blunt_tank",
		  power_distribution = {
			impact = 0.05,
			attack = 0.05
		  },
		  boost_curve_type = "tank_curve"
		},
		targets = {
		  {
			boost_curve_coefficient_headshot = 1,
			power_distribution = {
			  impact = 0.2,
			  attack = 0.2
			},
			attack_template = "blunt_tank",
			boost_curve_type = "tank_curve"
		  },
		  {
			attack_template = "blunt_tank",
			power_distribution = {
			  impact = 0.15,
			  attack = 0.1
			},
			boost_curve_type = "tank_curve"
		  },
		  {
			attack_template = "light_blunt_tank",
			power_distribution = {
			  impact = 0.1,
			  attack = 0.075
			},
			boost_curve_type = "tank_curve"
		  }
		},
		charge_value = "light_attack",
		critical_strike = {
		  attack_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1
		  },
		  impact_armor_power_modifer = {
			1,
			1,
			0.5,
			1,
			1
		  }
		},
		stagger_duration_modifier = 1.5
	}
	NewDamageProfileTemplates.heavy_cog_hammer_os = {
		default_target = {
		  boost_curve_coefficient_headshot = 1.5,
		  boost_curve_coefficient = 1,
		  boost_curve_type = "ninja_curve",
		  power_distribution = {
			impact = 0.275,
			attack = 0.735
		  },
		  armor_modifier = {
			impact = {
			  1,
			  1,
			  1,
			  1,
			  1.25
			},
			attack = {
			  1,
			  0.85,
			  1.5,
			  1,
			  0.75
			}
		  },
		  attack_template = "heavy_slashing_smiter_hs_executioner"
		},
		critical_strike = {
		  attack_armor_power_modifer = {
			1,
			1,
			1.5,
			1,
			1
		  },
		  impact_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1
		  }
		},
		armor_modifier = {
		  impact = {
			1,
			1,
			1,
			1,
			0.75
		  },
		  attack = {
			1,
			0.5,
			1.5,
			1,
			0.75
		  }
		},
		targets = {
		  [2] = {
			attack_template = "stab_smiter",
			power_distribution = {
			  impact = 0.1,
			  attack = 0.226
			},
			boost_curve_type = "smiter_curve"
		  }
		},
		charge_value = "heavy_attack",
		shield_break = true,
		cleave_distribution = {
		  impact = 0.075,
		  attack = 0.075
		}
	}
	NewDamageProfileTemplates.push_attack_cog_hammer_os = NewDamageProfileTemplates.light_cog_hammer_os

	--------------
	--Cog Hammer--
	--------------

	-- Lights
	Weapons.two_handed_cog_hammers_template_1.actions.action_one.light_attack_left.damage_profile = "light_cog_hammer_os"
	Weapons.two_handed_cog_hammers_template_1.actions.action_one.light_attack_right.damage_profile = "light_cog_hammer_os"
	Weapons.two_handed_cog_hammers_template_1.actions.action_one.light_attack_last.damage_profile = "light_cog_hammer_os"
	Weapons.two_handed_cog_hammers_template_1.actions.action_one.light_attack_up_right_last.damage_profile = "light_cog_hammer_os"
	--Heavies
	Weapons.two_handed_cog_hammers_template_1.actions.action_one.heavy_attack_right.damage_profile = "heavy_cog_hammer_os"
	Weapons.two_handed_cog_hammers_template_1.actions.action_one.heavy_attack_left.damage_profile = "heavy_cog_hammer_os"
	-- Push Attack
	Weapons.two_handed_cog_hammers_template_1.actions.action_one.light_attack_bopp.damage_profile = "light_cog_hammer_os"
