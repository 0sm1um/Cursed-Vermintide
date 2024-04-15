local mod = get_mod("Vermintide Balance Manager")

	-- Big Bardin Rebalance
	NewDamageProfileTemplates = NewDamageProfileTemplates or {}

	-- Greataxe
	NewDamageProfileTemplates.light_great_axe_os = {
		default_target = {
		  attack_template = "slashing_smiter",
		  power_distribution = {
			impact = 0.2,
			attack = 0.266
		  },
		  armor_modifier = {
			impact = {
			  1,
			  0.8,
			  1,
			  1,
			  0.75
			},
			attack = {
			  1.3,
			  0.85,
			  2.25,
			  0.75,
			  0.8
			}
		  },
		  boost_curve_type = "smiter_curve"
		},
		boost_curve_coefficient_headshot = 1.25,
		critical_strike = {
		  attack_armor_power_modifer = {
			1.25,
			0.8,
			2.75,
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
			0.6,
			1,
			1,
			0.75
		  },
		  attack = {
			1.3,
			0.85,
			2.25,
			1,
			0.8
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
		charge_value = "light_attack",
		shield_break = true,
		cleave_distribution = {
		  impact = 0.075,
		  attack = 0.075
		}
	}

	NewDamageProfileTemplates.heavy_great_axe_os  = {
		targets = {
		  {
			boost_curve_coefficient_headshot = 0.75,
			power_distribution = {
			  impact = 0.275,
			  attack = 0.425
			},
			boost_curve_type = "linesman_curve",
			armor_modifier = {
			  impact = {
				0.9,
				0.75,
				1,
				1,
				0.75
			  },
			  attack = {
				1.,
				0.75,
				2,
				0.75,
				0.75
			  }
			},
			attack_template = "heavy_slashing_linesman"
		  },
		  {
			boost_curve_coefficient_headshot = 0.75,
			power_distribution = {
			  impact = 0.15,
			  attack = 0.225
			},
			attack_template = "slashing_linesman",
			boost_curve_type = "linesman_curve"
		  },
		  {
			boost_curve_coefficient_headshot = 0.75,
			power_distribution = {
			  impact = 0.1,
			  attack = 0.15
			},
			attack_template = "light_slashing_linesman",
			boost_curve_type = "linesman_curve"
		  },
		  {
			boost_curve_coefficient_headshot = 0.75,
			power_distribution = {
			  impact = 0.075,
			  attack = 0.1
			},
			attack_template = "light_slashing_linesman",
			boost_curve_type = "linesman_curve"
		  }
		},
		armor_modifier = {
		  impact = {
			0.9,
			0.5,
			1,
			1,
			0.75,
			0.25
		  },
		  attack = {
			1.,
			0,
			2,
			1,
			0.75,
			0
		  }
		},
		cleave_distribution = {
		  impact = 0.4,
		  attack = 0.45
		},
		charge_value = "heavy_attack",
		critical_strike = {
		  attack_armor_power_modifer = {
			1.,
			0.75,
			2,
			1,
			1,
			0.75
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
		default_target = {
		  boost_curve_coefficient_headshot = 0.75,
		  power_distribution = {
			impact = 0.05,
			attack = 0.1
		  },
		  attack_template = "light_slashing_linesman",
		  boost_curve_type = "linesman_curve"
		}
	}

	NewDamageProfileTemplates.push_attack_great_axe_os  = {
		targets = {
		  {
			boost_curve_coefficient_headshot = 0.75,
			power_distribution = {
			  impact = 0.275,
			  attack = 0.35
			},
			boost_curve_type = "linesman_curve",
			armor_modifier = {
				impact = {
				1,
				0.5,
				1,
				1,
				0.75
				},
				attack = {
				1.66,
				0.85,
				1.8,
				0.75,
				0.8
				}
			},
			attack_template = "heavy_slashing_linesman"
		  },
		  {
			boost_curve_coefficient_headshot = 0.75,
			power_distribution = {
			  impact = 0.15,
			  attack = 0.25
			},
			attack_template = "slashing_linesman",
			boost_curve_type = "linesman_curve"
		  },
		  {
			boost_curve_coefficient_headshot = 0.75,
			power_distribution = {
			  impact = 0.1,
			  attack = 0.15
			},
			attack_template = "light_slashing_linesman",
			boost_curve_type = "linesman_curve"
		  },
		  {
			boost_curve_coefficient_headshot = 0.75,
			power_distribution = {
			  impact = 0.075,
			  attack = 0.125
			},
			attack_template = "light_slashing_linesman",
			boost_curve_type = "linesman_curve"
		  }
		},
		armor_modifier = {
		  impact = {
			0.9,
			0.5,
			1,
			1,
			0.75,
			0.25
		  },
		  attack = {
			0.9,
			0,
			1.5,
			1,
			0.75,
			0
		  }
		},
		cleave_distribution = {
		  impact = 0.4,
		  attack = 0.75
		},
		charge_value = "heavy_attack",
		critical_strike = {
		  attack_armor_power_modifer = {
			1,
			0.75,
			2,
			1,
			1,
			0.75
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
		default_target = {
		  boost_curve_coefficient_headshot = 0.75,
		  power_distribution = {
			impact = 0.05,
			attack = 0.075
		  },
		  attack_template = "light_slashing_linesman",
		  boost_curve_type = "linesman_curve"
		}
	}

	-------------
	--Great Axe--
	-------------

	-- Lights
	Weapons.two_handed_axes_template_1.actions.action_one.light_attack_left.damage_profile = "light_great_axe_os"
	Weapons.two_handed_axes_template_1.actions.action_one.light_attack_right.damage_profile = "light_great_axe_os"
	Weapons.two_handed_axes_template_1.actions.action_one.light_attack_up.damage_profile = "light_great_axe_os"
	-- Heavies
	Weapons.two_handed_axes_template_1.actions.action_one.heavy_attack_right.damage_profile = "heavy_great_axe_os"
	Weapons.two_handed_axes_template_1.actions.action_one.heavy_attack_left.damage_profile = "heavy_great_axe_os"
	Weapons.two_handed_axes_template_1.actions.action_one.heavy_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT
	Weapons.two_handed_axes_template_1.actions.action_one.heavy_attack_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT

	-- Push Attack
	--Weapons.two_handed_axes_template_1.actions.action_one.light_attack_bopp.damage_profile = "push_attack_great_axe_os"
	Weapons.two_handed_axes_template_1.actions.action_one.light_attack_bopp.hit_mass_count = LINESMAN_HIT_MASS_COUNT
	Weapons.two_handed_axes_template_1.actions.action_one.light_attack_bopp.anim_time_scale = 0.99 * 1.1                -- 0.99
	Weapons.two_handed_axes_template_1.actions.action_one.light_attack_bopp.additional_critical_strike_chance = 0.1
	Weapons.two_handed_axes_template_1.actions.action_one.light_attack_bopp.buff_data = {
		{
			start_time = 0,
			external_multiplier = 0.8,
			end_time = 0.2,
			buff_name = "planted_decrease_movement"
		},
		{
			start_time = 0.2,
			external_multiplier = 1.4,
			end_time = 0.35,
			buff_name = "planted_fast_decrease_movement"
		},
		{
			start_time = 0.5,
			external_multiplier = 0.8,
			end_time = 0.8,
			buff_name = "planted_decrease_movement"
		}
	}
