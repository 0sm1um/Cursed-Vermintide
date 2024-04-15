local mod = get_mod("Vermintide Balance Manager")
	-- Big Bardin Rebalance
	NewDamageProfileTemplates = NewDamageProfileTemplates or {}
--[[
	NewDamageProfileTemplates.light_dual_axes_os = {
		armor_modifier = {
            attack = {
				1,
				0.4,
				2,
				1,
				0.4
			},
            impact = {
				0.75,
				0.5,
				1,
				1,
				0.75
            }
        },
		critical_strike = {
			attack_armor_power_modifer = {
				1.25,
				0.75,
				2,
				1.25,
				0.75
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1
			}
		},
		charge_value = "light_attack",
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075
		},
		default_target = {
			boost_curve_type = "smiter_curve",
			attack_template = "slashing_smiter",
			boost_curve_coefficient_headshot = 2,
			power_distribution = {
				attack = 0.225,
				impact = 0.125
			}
		},
		ignore_stagger_reduction = true,
		targets =  {
			[2] = {
				boost_curve_type = "smiter_curve",
				attack_template = "slashing_smiter",
				boost_curve_coefficient_headshot = 1,
				power_distribution = {
					attack = 0.075,
					impact = 0.075
				},
				armor_modifier = {
					attack = {
						0.75,
						0.25,
						1,
						1,
						0.75
					},
					impact = {
						1,
						0.25,
						1,
						1,
						0.75
					}
				}
			}
		}
	}
	NewDamageProfileTemplates.push_attack_dual_axes_os = {
		armor_modifier = {
            attack = {
                1.25,
				0.65,
				2,
				1,
				1,
				0.6
            },
            impact = {
                1,
				0.5,
				2.25,
				1,
				0.75,
				0.25
            }
        },
		critical_strike = {
			attack_armor_power_modifer = {
				1.25,
				0.75,
				3.3,
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
		charge_value = "light_attack",
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075
		},
		default_target = {
			boost_curve_type = "smiter_curve",
			attack_template = "slashing_smiter",
			boost_curve_coefficient_headshot = 2,
			power_distribution = {
				attack = 0.26,
				impact = 0.15
			}
		},
		ignore_stagger_reduction = false,
		targets =  {
			[2] = {
				boost_curve_type = "smiter_curve",
				attack_template = "slashing_smiter",
				boost_curve_coefficient_headshot = 1,
				power_distribution = {
					attack = 0.075,
					impact = 0.075
				},
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
		}
	}

	NewDamageProfileTemplates.heavy_attack_dual_axes_os = {
		armor_modifier = {
			impact = {
				1,
				0.5,
				1,
				1,
				0.75,
				0.25
			},
			attack = {
				1.25, -- 1.25
				1, -- 0.65
				3,
				1,
				0.75,
				0.6
			}
		  },
		critical_strike = {
			attack_armor_power_modifer = {
				1.25,
			  	1, -- 0.75
			  	3.3,
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
		charge_value = "heavy_attack",
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075
		},
		default_target = {
			boost_curve_type = "smiter_curve",
			attack_template = "slashing_smiter",
			boost_curve_coefficient_headshot = 1.6,
			power_distribution = {
				attack = 0.26,
				impact = 0.15
			}
		},
		ignore_stagger_reduction = false,
		targets =  {
			[2] = {
				boost_curve_type = "smiter_curve",
				attack_template = "slashing_smiter",
				boost_curve_coefficient_headshot = 1,
				power_distribution = {
					attack = 0.075,
					impact = 0.075
				},
				armor_modifier = {
					impact = {
					  0.75,
					  0.25,
					  1,
					  1,
					  0.75
					},
					attack = {
					  1,
					  0.25,
					  1,
					  1,
					  0.75
					}
				},
			}
		}
	}
--]]
	-------------
	--Dual Axes--
	-------------

	-- Lights

	
--	Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_left.damage_profile = "light_dual_axes_os"
--	Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_right.damage_profile = "light_dual_axes_os"
--    Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_back_left.damage_profile = "light_dual_axes_os"
--    Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_back_right.damage_profile =  "light_dual_axes_os"
	
	Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_left.range_mod = 1.2        -- Increase range of light attacks
	Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_right.range_mod = 1.2
    Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_back_left.range_mod = 1.2
    Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_back_right.range_mod =  1.2

	-- Heavies
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack.anim_time_scale = 0.925  --1.035
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack_2.anim_time_scale = 1.1 --1.035
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack_3.additional_critical_strike_chance = 0.2 --0
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack.damage_profile_left = "heavy_attack_dual_axes_os"
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack.damage_profile_right = "heavy_attack_dual_axes_os"
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack_2.damage_profile_right = "heavy_attack_dual_axes_os"
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack_2.damage_profile_left = "heavy_attack_dual_axes_os"
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack_3.damage_profile_left = "heavy_attack_dual_axes_os"
--	Weapons.dual_wield_axes_template_1.actions.action_one.heavy_attack_3.damage_profile_right = "heavy_attack_dual_axes_os"

	-- Push Attack
	Weapons.dual_wield_axes_template_1.actions.action_one.push.damage_profile_inner = "light_push"
	Weapons.dual_wield_axes_template_1.actions.action_one.push.fatigue_cost = "action_stun_push"
	--Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_bopp.damage_profile_left = "push_attack_dual_axes_os"
	--Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_bopp.damage_profile_right = "push_attack_dual_axes_os"
	Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_bopp.range_mod = 1.2 -- Increase range of Push Attack

	-- QQ
	Weapons.dual_wield_axes_template_1.actions.action_one.light_attack_left.allowed_chain_actions = {
		{
			start_time = 0.4,
			action = "action_one",
			end_time = 1,
			input = "action_one",
			sub_action = "default_last"
		},
		{
			sub_action = "default",
			start_time = 1,
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
			start_time = 0.5, -- 0.3
			action = "action_wield",
			input = "action_wield"
		}
	}

	-- Dodge Distance modifications
	Weapons.dual_wield_axes_template_1.buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1.1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1.2
		}
	}
