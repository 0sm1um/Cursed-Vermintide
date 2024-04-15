local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.axe_falchion_heavy_os = {
    default_target = {
      boost_curve_coefficient_headshot = 1.6, -- 1.6
      power_distribution = {
        impact = 0.15,
        attack = 0.225
      },
      attack_template = "slashing_smiter",
      boost_curve_type = "smiter_curve"
    },
    ignore_stagger_reduction = false,
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
        0.65, -- 0.65
        2.25, -- 2.5
        1,
        0.75, -- 0.75
        0.5 -- 0.6
      }
    },
    targets = {
      [2] = {
        attack_template = "slashing_smiter",
        power_distribution = {
          impact = 0.075,
          attack = 0.075
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
        boost_curve_type = "smiter_curve"
      }
    },
    charge_value = "heavy_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.25, -- 1.25
        0.75, -- 0.75
        2.25, -- 2.75
        1.25, -- 1
        0.5 
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

  NewDamageProfileTemplates.axe_and_falchion_light_os = {
    default_target = {
      attack_template = "slashing_upper",
      power_distribution = {
        attack = 0.075,
        impact = 0.075
      },
      boost_curve_type = "linesman_curve"
    },
    armor_modifier = {
      impact = {
        0.9,
        0.25,
        1,
        1,
        0.75
      },
      attack = {
        0.9, -- 0.9
        0,
        1.5,
        1, -- 1
        0
      }
    },
    targets = {
      {
        boost_curve_coefficient_headshot = 2,
        power_distribution = {
          attack = 0.195, -- 0.195
          impact = 0.125
        },
        armor_modifier = {
          attack = {
            1, -- 1
            0.25, -- 0.25
            1.5,
            1, -- 1
            0.75, -- 0.75
            0
          },
          impact = {
            0.9,
            0.25,
            1,
            1,
            0.75
          }
        },
        attack_template = "slashing_upper",
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "slashing_upper",
        power_distribution = {
          attack = 0.125,
          impact = 0.1
        },
        boost_curve_type = "linesman_curve"
      },
      {
        attack_template = "slashing_upper",
        power_distribution = {
          attack = 0.1,
          impact = 0.08
        },
        boost_curve_type = "linesman_curve"
      }
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.25, -- 1
        0.5,
        1.5,
        1.5, -- 1
        0.5
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
      impact = 0.2, -- 0.2
      attack = 0.3 -- 0.25 
    }
  }

  NewDamageProfileTemplates.light_axe_and_falchon_axe_os = {
		default_target = {
		  attack_template = "slashing_linesman",
		  power_distribution = {
			attack = 0.2,
			impact = 0.175
		  },
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 1.5,
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
			1.33,
			1,
			2.5,
			1.33,
			1
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
          1.33,
          1,
          2.5,
          1.33,
          0.66
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
        1.33,
        1.75,
        2.5,
        1.33,
        1.75
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

  Weapons.dual_wield_axe_falchion_template.actions.action_one.heavy_attack.damage_profile_left = "axe_falchion_heavy_os"
  Weapons.dual_wield_axe_falchion_template.actions.action_one.heavy_attack.damage_profile_right = "axe_falchion_heavy_os"
  Weapons.dual_wield_axe_falchion_template.actions.action_one.heavy_attack_2.damage_profile_left = "axe_falchion_heavy_os"
  Weapons.dual_wield_axe_falchion_template.actions.action_one.heavy_attack_2.damage_profile_right = "axe_falchion_heavy_os"

  Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_right_diagonal.damage_profile = "axe_and_falchion_light_os"
  Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_left_diagonal.damage_profile = "axe_and_falchion_light_os"

  Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_right.damage_profile = "light_axe_and_falchon_axe_os"
  Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_down_left.damage_profile = "light_axe_and_falchon_axe_os"

  Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_bopp.damage_profile = "axe_and_falchion_light_os"

  Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_right_diagonal.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_left_diagonal.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  Weapons.dual_wield_axe_falchion_template.actions.action_one.light_attack_bopp.hit_mass_count = LINESMAN_HIT_MASS_COUNT
  
  Weapons.dual_wield_axe_falchion_template.max_fatigue_points = 6 -- 6
  Weapons.dual_wield_axe_falchion_template.block_angle = 90 -- 90
  Weapons.dual_wield_axe_falchion_template.block_fatigue_point_multiplier = 0.75 -- 0.5
