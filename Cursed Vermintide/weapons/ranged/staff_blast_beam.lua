local mod = get_mod("Vermintide Balance Manager")
--[[
NewDamageProfileTemplates.initial_beam_beam_os = {
    no_procs = true,
    armor_modifier_near = {
      impact = {
        1,
        0.8,
        1,
        1,
        1,
        0
      },
      attack = {
        1,
        0.5,
        1.5,
        1,
        1,
        0
      }
    },
    cleave_distribution = {
      impact = 0.01,
      attack = 0.01
    },
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.1,
        1,
        1,
        1,
        0.25
      },
      impact_armor_power_modifer = {
        1,
        0.2,
        1,
        1,
        1,
        0.25
      }
    },
    no_stagger_damage_reduction_ranged = true,
    default_target = {
      boost_curve_coefficient_headshot = 2,
      boost_curve_coefficient = 0.75,
      power_distribution_far = {
        impact = 0.05,
        attack = 0.025
      },
      boost_curve_type = "linesman_curve",
      power_distribution_near = {
        impact = 0.065,
        attack = 0.05
      },
      attack_template = "wizard_staff_beam",
      range_dropoff_settings = {
        dropoff_end = 30,
        dropoff_start = 15
      }
    },
    armor_modifier_far = {
      impact = {
        1,
        0.2,
        1,
        1,
        1,
        0
      },
      attack = {
        1,
        0.1,
        1.5,
        1,
        1,
        0
      }
    },
    targets = {
    },
    charge_value = "projectile"
  }

NewDamageProfileTemplates.beam_beam_os = {
    targets = {
    },
    no_stagger_damage_reduction_ranged = true,
    ignore_stagger_reduction = true,
    armor_modifier = {
      impact = {
        1,
        0.8,
        1,
        1,
        1,
        0
      },
      attack = {
        1,
        0.5,
        6, -- 1.5
        1,
        1,
        0
      }
    },
    cleave_distribution = {
      impact = 0.01,
      attack = 0.01
    },
    charge_value = "projectile",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.5,
        3, -- 1
        1,
        1,
        0.25
      },
      impact_armor_power_modifer = {
        1,
        0.8,
        1,
        1,
        1,
        0.25
      }
    },
    default_target = {
      --dot_template_name = "burning_1W_dot", -- beam_burning_dot
      boost_curve_coefficient = 0.75,
	    boost_curve_coefficient_headshot = 5,
      power_distribution_far = {
        impact = 0.05,
        attack = 0.2 -- 0.025
      },
      boost_curve_type = "linesman_curve",
      power_distribution_near = {
        impact = 0.065,
        attack = 0.2 -- 0.075
      },
      boost_curve_coefficient_headshot = 2,
      attack_template = "wizard_staff_beam",
      range_dropoff_settings = {
        dropoff_end = 50,
        dropoff_start = 30
      }
    }
  }
--]]

NewDamageProfileTemplates.beam_sniper_shot_os = {
    targets = {
    },
    no_stagger_damage_reduction_ranged = true,
    armor_modifier_near = {
      impact = {
        1,
        0.8,
        1,
        1,
        1,
        0
      },
      attack = {
        1,
        0.8,
        1.5,
        1,
        1,
        0
      }
    },
    default_target = {
      dot_template_name = "burning_1W_dot", -- "burning_3W_dot"
      boost_curve_coefficient = 0.75,
      power_distribution_far = {
        impact = 0.2,
        attack = 1 -- 0.5
      },
      boost_curve_type = "ninja_curve",
      power_distribution_near = {
        impact = 0.3,
        attack = 1 -- 0.85
      },
      boost_curve_coefficient_headshot = 1,
      attack_template = "wizard_staff_beam_sniper",
      range_dropoff_settings = {
        dropoff_end = 50,
        dropoff_start = 30
      }
    },
    cleave_distribution = {
      impact = 0.05,
      attack = 0.15
    },
    charge_value = "projectile",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.8,
        1.5,
        1,
        1,
        0.25
      },
      impact_armor_power_modifer = {
        1,
        0.8,
        1,
        1,
        1,
        0.25
      }
    },
    armor_modifier_far = {
      impact = {
        1,
        0.5,
        1,
        1,
        1,
        0
      },
      attack = {
        1,
        0.8, -- 0.5
        1.5, -- 1
        1,
        1,
        0.25 -- 0
      }
    }
  }

NewDamageProfileTemplates.beam_shotgun_blast = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	dot_template_name = "burning_1W_dot",
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.2,
			1,
			1,
			0.7,
			0.15
		},
		impact_armor_power_modifer = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier = {
		attack = {
			1,
			0,
			1,
			1,
			0.6,
			0
		},
		impact = {
			1,
			0.25,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.05,
		impact = 0.05
	},
	default_target = {
		boost_curve_coefficient_headshot = 2,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 0.5,
		attack_template = "flame_blast",
		power_distribution_near = {
			attack = 0.12,
			impact = 0.275
		},
		power_distribution_far = {
			attack = 0.05,
			impact = 0.15
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}

NewDamageProfileTemplates.beam_burning_dot_os = {
  no_stagger = true,
  no_stagger_damage_reduction_ranged = true,
  targets = {
  },
  armor_modifier = {
    attack = {
      1,
      0.5,
      0.5, -- 1
      1,
      0.5,
      0
    },
    impact = {
      1,
      0.5,
      1,
      1,
      0.5,
      0
    }
  },
  cleave_distribution = {
    attack = 0.25,
    impact = 0.25
  },
  charge_value = "n/a",
  is_dot = true,
  default_target = {
    attack_template = "light_blunt_tank",
    boost_curve_coefficient = 0.2,
    boost_curve_type = "tank_curve",
    damage_type = "burninating",
    armor_modifier = {
      impact = {
        1,
        0,
        0,
        1,
        1,
        0
      },
      attack = {
        1,
        0.75,
        1, -- 4
        1,
        1,
        0.5
      }
    },
    power_distribution = {
      impact = 0.075,
      attack = 0.075
    }
  }
}
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

mod:add_buff_template("beam_burning_dot", {
  apply_buff_func = "start_dot_damage",
  damage_profile = "beam_burning_dot",
  damage_type = "burninating",
  duration = 3,
  name = "beam_burning_dot",
  time_between_dot_damages = 1,
  update_func = "apply_dot_damage",
  update_start_delay = 1,
  perks = {
    buff_perks.burning,
  },
  max_stacks = 6 -- nil
})

Weapons.staff_blast_beam_template_1.actions.action_one.default.do_zoom = false

--Weapons.staff_blast_beam_template_1.actions.action_one.default.damage_profile = "beam_beam_os"
--Weapons.staff_blast_beam_template_1.actions.action_one.default.initial_damage_profile = "initial_beam_beam_os"

Weapons.staff_blast_beam_template_1.actions.action_two.charged_beam.damage_profile = "beam_sniper_shot_os"
Weapons.staff_blast_beam_template_1.actions.action_two.charged_beam.spread_template_override = "spear"
--DamageProfileTemplates.beam_burning_dot = table.clone(NewDamageProfileTemplates.beam_burning_dot_os)

--[[
Weapons.staff_blast_beam_template_1.actions.action_two.default.aim_zoom_delay = 0.01
Weapons.staff_blast_beam_template_1.actions.action_one.default.default_zoom = "zoom_in"
Weapons.staff_blast_beam_template_1.actions.action_one.default.zoom_thresholds = { "zoom_in_trueflight", "zoom_in" }
Weapons.staff_blast_beam_template_1.actions.action_one.default.zoom_condition_function = function ()
	return true
end
--]]

--Weapons.staff_blast_beam_template_1.actions.action_two.charged_beam.use_beam_consecutive_hits = true
