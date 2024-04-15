local mod = get_mod("Vermintide Balance Manager")

--Mace and Sword

--Heavy
Weapons.dual_wield_hammer_sword_template.actions.action_one.heavy_attack.damage_profile_left = "mace_sword_heavy"
Weapons.dual_wield_hammer_sword_template.actions.action_one.heavy_attack.damage_profile_right = "mace_sword_heavy"
Weapons.dual_wield_hammer_sword_template.actions.action_one.heavy_attack_2.damage_profile_left = "mace_sword_heavy"
Weapons.dual_wield_hammer_sword_template.actions.action_one.heavy_attack_2.damage_profile_right = "mace_sword_heavy"

Weapons.dual_wield_hammer_sword_template.actions.action_one.heavy_attack.hit_mass_count = TANK_HIT_MASS_COUNT
Weapons.dual_wield_hammer_sword_template.actions.action_one.heavy_attack_2.hit_mass_count = TANK_HIT_MASS_COUNT

-- Lights
Weapons.dual_wield_hammer_sword_template.actions.action_one.light_attack_left_diagonal.damage_profile_left = "mace_and_sword_mace_os"
Weapons.dual_wield_hammer_sword_template.actions.action_one.light_attack_right_diagonal.damage_profile_right = "mace_and_sword_mace_os"
Weapons.dual_wield_hammer_sword_template.actions.action_one.light_attack_left.damage_profile_left = "mace_and_sword_sword_os"
Weapons.dual_wield_hammer_sword_template.actions.action_one.light_attack_right.damage_profile_right = "mace_and_sword_sword_os"

NewDamageProfileTemplates.mace_and_sword_mace_os = { -- Mace
  cleave_distribution = {
    impact = 0.6, -- 0.6
    attack = 0.2 -- 0.2
  },
  armor_modifier = {
    impact = {
      1,
      1,
      0.5,
      1,
      1
    },
    attack = {
      1,
      0,
      1,
      0.75, -- 1
      1
    }
  },
  default_target = {
    attack_template = "light_blunt_linesman",
    power_distribution = {
      attack = 0.05,
      impact = 0.15
    },
    boost_curve_type = "tank_curve"
  },
  targets = {
    {
      boost_curve_coefficient_headshot = 1.5,
      power_distribution = {
        attack = 0.175,
        impact = 0.25
      },
      attack_template = "blunt_linesman",
      boost_curve_type = "tank_curve"
    },
    {
      attack_template = "light_blunt_linesman",
      power_distribution = {
        attack = 0.075,
        impact = 0.175
      },
      boost_curve_type = "tank_curve"
    }
  },
  charge_value = "light_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1,
      0.25,
      1.5,
      1, -- 0.75
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
  stagger_duration_modifier = 1.25
}

NewDamageProfileTemplates.mace_and_sword_sword_os =  { -- Sword
  targets = {
    {
      boost_curve_coefficient_headshot = 1.5,
      boost_curve_coefficient = 2,
      boost_curve_type = "linesman_curve",
      power_distribution = {
        impact = 0.1,
        attack = 0.175
      },
      attack_template = "light_slashing_linesman_hs"
    },
    {
      boost_curve_coefficient_headshot = 1.5,
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
      1,
      0.3,
      0.5,
      1,
      1
    },
    attack = {
      1,
      0,
      2,
      0.75, -- 1
      1
    }
  },
  cleave_distribution = {
    impact = 0.1, -- 0.2
    attack = 0.1 -- 0.35
  },
  charge_value = "light_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1,
      0.5,
      2.5,
      1,
      1
    },
    impact_armor_power_modifer = {
      1,
      0.5,
      0.5,
      1,
      1
    }
  },
  default_target = {
    attack_template = "light_slashing_linesman",
    power_distribution = {
      impact = 0.05,
      attack = 0.075
    },
    boost_curve_type = "linesman_curve"
  }
}

NewDamageProfileTemplates.mace_sword_bopp = {
	stagger_duration_modifier = 1.5,
	charge_value = "light_attack",
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			2,
			0.66, -- 1
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
	cleave_distribution = {
		attack = 0.2,
		impact = 0.2
	},
	armor_modifier = {
		attack = {
			1,
			0.5,
			2.5,
			1,
			0.66, -- 0.9
			0.5
		},
		impact = {
			1,
			1,
			0.5,
			1,
			1
		}
	},
	default_target = {
		boost_curve_type = "tank_curve",
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.075,
			impact = 0.075
		}
	},
	targets = {
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.2,
				impact = 0.125
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.1
			}
		}
	}
}

NewDamageProfileTemplates.mace_sword_heavy = {
  melee_boost_override = 6,
  default_target = {
    attack_template = "light_slashing_linesman",
    power_distribution = {
      impact = 0.075,
      attack = 0.075 -- 0.075
    },
    boost_curve_type = "linesman_curve"
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
      0.66, -- 1
      0
    }
  },
  targets = {
    {
      boost_curve_coefficient_headshot = 2,
      power_distribution = {
        impact = 0.2,
        attack = 0.225
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
          1,
          0.66,
          1.5,
          0.66, -- 1
          0.66
        }
      },
      attack_template = "heavy_slashing_linesman"
    },
    {
      attack_template = "slashing_linesman",
      power_distribution = {
        impact = 0.125,
        attack = 0.15 -- 0.2
      },
      boost_curve_type = "linesman_curve"
    },
    {
      attack_template = "light_slashing_linesman",
      power_distribution = {
        impact = 0.1,
        attack = 0.125 -- 0.1
      },
      boost_curve_type = "linesman_curve"
    }
  },
  charge_value = "heavy_attack",
  critical_strike = {
    attack_armor_power_modifer = {
      1,
      0.5,
      1.5,
      0.66, -- 1
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
    impact = 0.1, -- 0.25
    attack = 0.225 -- 0.275
  }
}

local allowed_chain_actions = {
  {
    sub_action = "default_right",
    start_time = 0.6,
    action = "action_one",
    release_required = "action_one_hold",
    end_time = 1.1,
    input = "action_one"
  },
  {
    sub_action = "default_right",
    start_time = 0.6,
    action = "action_one",
    release_required = "action_one_hold",
    end_time = 1.1,
    input = "action_one_hold"
  },
  {
    sub_action = "default",
    start_time = 1.1,
    action = "action_one",
    input = "action_one"
  },
  {
    sub_action = "default",
    start_time = 0.5,
    action = "action_two",
    input = "action_two_hold"
  },
  {
    sub_action = "default",
    start_time = 0.5, -- 0.4
    action = "action_wield",
    input = "action_wield"
  }
}

Weapons.dual_wield_hammer_sword_template.actions.action_one.heavy_attack.allowed_chain_actions = allowed_chain_actions