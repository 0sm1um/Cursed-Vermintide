local mod = get_mod("Vermintide Balance Manager")

	NewDamageProfileTemplates = NewDamageProfileTemplates or {}

	-- 1h Axe
	NewDamageProfileTemplates.light_1h_axe_os = {
		default_target = {
		  attack_template = "slashing_linesman",
		  power_distribution = {
			attack = 0.25,
			impact = 0.175
		  },
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 1,
		},
		ignore_stagger_reduction = true,
		armor_modifier = {
		  impact = {
			1,
			0.5,
			1,
			0.75,
			0.25
		  },
		  attack = {
			1.25, -- 1.25
			0.75,
			2.5, -- 2.5 
			1.33, -- 0.75
			0.66 -- 0.6
		  }
		},
		targets = {
		  [2] = {
			attack_template = "slashing_smiter",
			power_distribution = {
			  attack = 0.085,
			  impact = 0.075
			},
			boost_curve_type = "smiter_curve",
			armor_modifier = {
			  attack = {
				1.33, -- 1.25
				0.65,
				2.5, -- 2.5 
				1.33, -- 0.75
				0.66 -- 0.6
			  },
			  impact = {
				0.75,
				0.25,
				1,
				1,
				0.75
			  }
			}
		  }
		},
		charge_value = "light_attack",
		critical_strike = {
		  attack_armor_power_modifer = {
			1.33, -- 1.25
			0.75, -- 0.75
			2.75, -- 2.75
			1.33, -- 1
			0.75 -- 0.75
		  },
		  impact_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1
		  }
		},
		cleave_distribution = {
		  impact = 0.075,
		  attack = 0.075
		}
	}

	NewDamageProfileTemplates.push_attack_1h_axe_os  = {
		default_target = {
			attack_template = "slashing_linesman",
			power_distribution = {
			  attack = 0.25,
			  impact = 0.175
			},
		  boost_curve_type = "smiter_curve",
		  boost_curve_coefficient_headshot = 3,
		  },
		  ignore_stagger_reduction = true,
		  armor_modifier = {
			impact = {
				0.75,
				0.25,
				1,
				1,
				0.75
			},
			attack = {
				1.33, -- 1.25
				0.65, -- 0.6
				2.5, -- 2.5
				1.66, -- 0.75
				0.66 -- 0.6
			}
		  },
		  targets = {
			[2] = {
			  attack_template = "slashing_smiter",
			  power_distribution = {
				attack = 0.085,
				impact = 0.075
			  },
			  boost_curve_type = "smiter_curve",
			  armor_modifier = {
				attack = {
				  1,
				  0.25,
				  1,
				  1,
				  0.75
				},
				impact = {
				  0.75,
				  0.25,
				  1,
				  1,
				  0.75
				}
			  }
			}
		  },
		  charge_value = "light_attack",
		  critical_strike = {
			attack_armor_power_modifer = {
			  1.25, -- 1.25
			  0.8, -- 0.75
			  2.75, -- 2.75
			  1.25, -- 1
			  1 -- 0.75
			},
			impact_armor_power_modifer = {
			  1,
			  1,
			  1,
			  1,
			  1
			}
		  },
		  cleave_distribution = {
			impact = 0.075,
			attack = 0.075
		  }
	  }

	NewDamageProfileTemplates.heavy_1h_axe_os = {
		default_target = {
		  attack_template = "slashing_smiter",
		  boost_curve_coefficient = 2,
		  power_distribution = {
			impact = 0.25,
			attack = 0.4
		  },
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 1.5,
		},
		critical_strike = {
		  attack_armor_power_modifer = {
			1, -- 1
			1.33, -- 0.8
			2.5, -- 2.5
			1, -- 1
			1.33 -- 0.75
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
			1.1, -- 1
			0.75, -- 0.8
			2, -- 2
			0.9, -- 0.75
			0.75 -- 0.95
		  }
		},
		targets = {
		  [2] = {
			attack_template = "light_blunt_tank",
			power_distribution = {
			  impact = 0.1,
			  attack = 0.113
			},
			boost_curve_type = "tank_curve"
		  }
		},
		charge_value = "heavy_attack",
		shield_break = true,
		cleave_distribution = {
		  impact = 0.075,
		  attack = 0.075
		}
	}

	----------
	--1h Axe--
	----------

	Weapons.one_hand_axe_template_1.actions.action_one.light_attack_left.damage_profile = "light_1h_axe_os"
	Weapons.one_hand_axe_template_1.actions.action_one.light_attack_right.damage_profile = "light_1h_axe_os"
    Weapons.one_hand_axe_template_1.actions.action_one.light_attack_last.damage_profile = "light_1h_axe_os"
	Weapons.one_hand_axe_template_1.actions.action_one.light_attack_left.range_mod = 1.3        -- Increase range of light attacks
	Weapons.one_hand_axe_template_1.actions.action_one.light_attack_right.range_mod = 1.3
    Weapons.one_hand_axe_template_1.actions.action_one.light_attack_last.range_mod = 1.3

	-- Push Attack
	Weapons.one_hand_axe_template_1.actions.action_one.light_attack_bopp.damage_profile = "push_attack_1h_axe_os"

	-- Heavies
	Weapons.one_hand_axe_template_1.actions.action_one.heavy_attack_left.damage_profile = "heavy_1h_axe_os"
	Weapons.one_hand_axe_template_1.actions.action_one.heavy_attack_right.damage_profile = "heavy_1h_axe_os"
	Weapons.one_hand_axe_template_1.actions.action_one.heavy_attack_left.range_mod = 1.2
	Weapons.one_hand_axe_template_1.actions.action_one.heavy_attack_right.range_mod = 1.2
	Weapons.one_hand_axe_template_2.actions.action_one.heavy_attack_left.range_mod = 1.2
	Weapons.one_hand_axe_template_2.actions.action_one.heavy_attack_right.range_mod = 1.2

	-- Dodge Distance modifications
	Weapons.one_hand_axe_template_1.buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1.1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1.2
		}
	}

	Weapons.one_hand_axe_template_1.actions.action_one.light_attack_last.anim_time_scale = 1.3 --1.035
	Weapons.one_hand_axe_template_2.actions.action_one.light_attack_last.anim_time_scale = 1.3 --1.035

	local allowed_chain_actions = {
		{
			sub_action = "default_right",
			start_time = 0.55,
			action = "action_one",
			end_time = 1.25,
			input = "action_one"
		},
		{
			sub_action = "default_right",
			start_time = 0.55,
			action = "action_one",
			end_time = 1.25,
			input = "action_one_hold"
		},
		{
			sub_action = "default",
			start_time = 1.25,
			action = "action_one",
			input = "action_one"
		},
		{
			sub_action = "default",
			start_time = 0,
			action = "action_two",
			input = "action_two_hold"
		},
		{
			sub_action = "default",
			start_time = 0.6, -- 0.5
			action = "action_wield",
			input = "action_wield"
		}
	}
