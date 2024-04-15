local mod = get_mod("Vermintide Balance Manager")

Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_left.allowed_chain_actions[2].start_time = 0.5
Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_left.damage_profile = "drb_halberd_light_slash"
NewDamageProfileTemplates.drb_halberd_light_slash = {
    targets = {
      {
        boost_curve_coefficient_headshot = 1,
        power_distribution = {
          impact = 0.2,
          attack = 0.25
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
            0.9,
            0.3,
            1.5,
            1,
            0.75
          }
        },
        attack_template = "heavy_slashing_linesman"
      },
      {
        attack_template = "slashing_linesman",
        power_distribution = {
          impact = 0.125,
          attack = 0.15
        },
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "light_slashing_linesman",
        power_distribution = {
          impact = 0.1,
          attack = 0.1
        },
        boost_curve_type = "linesman_curve"
      }
    },
    armor_modifier = {
      impact = {
        0.9,
        0.5,
        1,
        1,
        0.75
      },
      attack = {
        0.9,
        0,
        1.5,
        1,
        0.75
      }
    },
    cleave_distribution = {
      impact = 0.15,
      attack = 0.4
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.5,
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
    default_target = {
      attack_template = "light_slashing_linesman",
      power_distribution = {
        impact = 0.075,
        attack = 0.075
      },
      boost_curve_type = "linesman_curve"
    }
  }

--light 2
Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_stab.damage_profile = "drb_halberd_light_stab"
NewDamageProfileTemplates.drb_halberd_light_stab = {
    charge_value = "light_attack",
	cleave_distribution = {
        attack = 0.075,
        impact = 0.075
    },
    critical_strike = {
        attack_armor_power_modifer = {
            1,
            .8,
            2.5,
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
        attack = {
            1,
            .7,
            2.25,
            1,
            0.75
        },
        impact = {
            1,
            0.75,
            1,
            1,
            0.75
        }
    },
    default_target = {
        boost_curve_coefficient_headshot = 2,
        boost_curve_type = "ninja_curve",
        boost_curve_coefficient = 1,
        attack_template = "stab_smiter",
        power_distribution = {
            attack = 0.25,
            impact = 0.125
        }
    },
    melee_boost_override = 2.5
}
--Heavy 2
Weapons.two_handed_halberds_template_1.actions.action_one.heavy_attack_left.damage_profile = "drb_halberd_heavy_slash"
NewDamageProfileTemplates.drb_halberd_heavy_slash = {
	armor_modifier = "armor_modifier_linesman_H",
	critical_strike = "critical_strike_linesman_H",
	charge_value = "heavy_attack",
	cleave_distribution = {
		attack = 0.4, -- 0.4
		impact = 0.2
	},
	default_target =  {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 0.25,
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.1,
			impact = 0.05
		}
	},
	targets = {
		{
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "linesman_curve",
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.35,
				impact = 0.25
			},
			armor_modifier = {
				attack = {
					1., -- 1.15
					0.5,
					1.5,
					1,
					0.75
				},
				impact = {
					0.9,
					0.5,
					1,
					1,
					0.75
				}
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.3,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.225,
				impact = 0.1
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.125,
				impact = 0.075
			}
		}
	}
}

--Heavy 1
Weapons.two_handed_halberds_template_1.actions.action_one.heavy_attack_stab.damage_profile = "drb_halberd_heavy_stab"
NewDamageProfileTemplates.drb_halberd_heavy_stab = {
    charge_value = "heavy_attack",
   	cleave_distribution = {
		attack = 0.075,
		impact = 0.075
	},
    critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.56,
			2.5,
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
		attack = {
			1,
			0.3,
			2,
			1,
			0.75
		},
		impact = {
			1,
			0.5,
			1,
			1,
			0.75
		}
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "heavy_stab_smiter",
		power_distribution = {
			attack = 0.2,
			impact = 0.15
		}
	},
	targets = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "heavy_stab_smiter",
			armor_modifier = {
				attack = {
					1,
					0.56,
					2,
					1,
					0.75
				},
				impact = {
					1,
					0.65,
					1,
					1,
					0.75
				}
			},
			power_distribution = {
				attack = 0.45,
				impact = 0.25
			}
		}
	},
	melee_boost_override = 2.5
}
--light 3 and push stab
--DamageProfileTemplates.medium_slashing_smiter_2h.default_target.boost_curve_coefficient_headshot = 2.5
Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_down.damage_profile = "drb_halberd_light_chop"
Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_last.damage_profile = "drb_halberd_light_chop"
NewDamageProfileTemplates.drb_halberd_light_chop = {
    charge_value = "light_attack",
	cleave_distribution = {
        attack = 0.075,
        impact = 0.075
    },
    critical_strike = {
        attack_armor_power_modifer = {
            1,
            .76,
            2.5,
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
        attack = {
            1.25,
            .76,
            2.5,
            1,
            0.75
        },
        impact = {
            1,
            0.8,
            1,
            1,
            0.75
        }
    },
    default_target = {
        boost_curve_coefficient_headshot = 1.5,
        boost_curve_type = "ninja_curve",
        boost_curve_coefficient = 1,
        attack_template = "stab_smiter",
        power_distribution = {
            attack = 0.325,
            impact = 0.2
        }
    },
    melee_boost_override = 2.5,
	shield_break = true
}

-- Attacks movement speed

Weapons.two_handed_halberds_template_1.actions.action_one.heavy_attack_stab.buff_data = {
	{
		start_time = 0,
		external_multiplier = 0.9, -- 0.8
		end_time = 0.2,
		buff_name = "planted_decrease_movement"
	},
	{
		start_time = 0.2,
		external_multiplier = 1.35, -- 1.4
		end_time = 0.45,
		buff_name = "planted_fast_decrease_movement"
	},
	{
		start_time = 0.45,
		external_multiplier = 0.85, -- 0.7
		end_time = 0.7,
		buff_name = "planted_fast_decrease_movement"
	}
}

Weapons.two_handed_halberds_template_1.actions.action_one.heavy_attack_left.buff_data = {
	{
		start_time = 0,
		external_multiplier = 1.35, -- 1.4
		end_time = 0.3,
		buff_name = "planted_fast_decrease_movement"
	},
	{
		start_time = 0.3,
		external_multiplier = 0.85, -- 0.7
		end_time = 0.7,
		buff_name = "planted_fast_decrease_movement"
	}
}

Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_left.buff_data = {
	{
		start_time = 0,
		external_multiplier = 1.1, -- 1.1
		end_time = 0.3,
		buff_name = "planted_fast_decrease_movement"
	},
	{
		start_time = 0.3,
		external_multiplier = 0.66, -- 0.5
		end_time = 0.7,
		buff_name = "planted_fast_decrease_movement"
	}
}

Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_down.buff_data = {
	{
		start_time = 0,
		external_multiplier = 1.2,
		end_time = 0.3,
		buff_name = "planted_fast_decrease_movement"
	},
	{
		start_time = 0.3,
		external_multiplier = 0.66, -- 0.5
		end_time = 0.7,
		buff_name = "planted_fast_decrease_movement"
	}
}


Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_stab.buff_data = {
	{
		start_time = 0,
		external_multiplier = 0.66, -- 0.5
		end_time = 0.3,
		buff_name = "planted_decrease_movement"
	},
	{
		start_time = 0.3,
		external_multiplier = 1.2,
		end_time = 0.5, 
		buff_name = "planted_fast_decrease_movement"
	},
	{
		start_time = 0.5,
		external_multiplier = 0.85, -- 0.75
		end_time = 0.6,
		buff_name = "planted_decrease_movement"
	}
}

Weapons.two_handed_halberds_template_1.actions.action_one.light_attack_last.buff_data = {
	{
		start_time = 0,
		external_multiplier = 0.66, -- 0.5
		end_time = 0.3,
		buff_name = "planted_fast_decrease_movement"
	},
	{
		start_time = 0.3,
		external_multiplier = 1.3, -- 1.25
		end_time = 0.5,
		buff_name = "planted_fast_decrease_movement"
	},
	{
		start_time = 0.5,
		external_multiplier = 0.85, -- 0.75
		end_time = 0.7,
		buff_name = "planted_decrease_movement"
	}
}