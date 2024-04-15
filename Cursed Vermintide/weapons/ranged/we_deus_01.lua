local mod = get_mod("Vermintide Balance Manager")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
MeleeBuffTypes = {
	MELEE_1H = true,
	MELEE_2H = true
}
RangedBuffTypes = {
	RANGED = true,
	RANGED_ABILITY = true
}

local explosion_radius_mod = 0.5

---- Moonfire Remade

NewDamageProfileTemplates.moonfire_uncharged_hit = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	require_damage_for_dot = true,
	ignore_stagger_reduction = true,
	armor_modifier = {
		attack = {
			0.5, -- 1
			0.5,
			1,
			0.75,
			0.75,
			0.25
		},
		impact = {
			1,
			0.5,
			1,
			0.75,
			0.75,
			0.25
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.5,
			1,
			0.75,
			0.75,
			0.25
		},
		impact = {
			1,
			0.5,
			1,
			0.75,
			0.75,
			0.25
		}
	},
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
		}
	},	
	cleave_distribution = {
		attack = 0.15,
		impact = 0.15
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		dot_template_name = "we_deus_01_dot",
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_carbine",
		power_distribution_near = {
			attack = 0.41,
			impact = 0.3
		},
	power_distribution_far = {
			attack = 0.3,
			impact = 0.25
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}

NewDamageProfileTemplates.moonfire_uncharged_dot = {
	is_dot = true,
	charge_value = "n/a",
	no_stagger_damage_reduction_ranged = true,
	no_stagger = true,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
	},
	armor_modifier = {
		attack = {
			1.25, -- 2
			1,
			3,
			2,
			1,
			0.5
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0
		}
	},
	default_target = {
		damage_type = "burninating",
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.07,
			impact = 0.05
		}
	}
}

NewDamageProfileTemplates.moonfire_partially_charged_hit = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	require_damage_for_dot = true,
	ignore_stagger_reduction = true,
	armor_modifier = {
		attack = {
			0.625, -- 1
			0.625, -- 0.5
			1,
			0.75,
			0.75,
			0.25
		},
		impact = {
			1,
			0.5,
			1,
			0.75,
			0.75,
			0.25
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.625, -- 0.5
			1,
			0.75,
			0.75,
			0.25
		},
		impact = {
			1,
			0.5,
			1,
			0.75,
			0.75,
			0.25
		}
	},
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
		}
	},
	cleave_distribution = {
		attack = 0.15,
		impact = 0.15
	},
	default_target = {
		boost_curve_coefficient_headshot = 1.5, -- 1
		dot_template_name = "we_deus_01_dot",
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_carbine",
		power_distribution_near = {
			attack = 0.41,
			impact = 0.3
		},
	power_distribution_far = {
			attack = 0.3,
			impact = 0.25
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}

NewDamageProfileTemplates.moonfire_partially_charged_dot = {
	is_dot = true,
	charge_value = "n/a",
	no_stagger_damage_reduction_ranged = true,
	no_stagger = true,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
	},
	armor_modifier = {
		attack = {
			1.5, -- 2
			1.1, -- 1
			3,
			2,
			1,
			0.5
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0
		}
	},
	default_target = {
		damage_type = "burninating",
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.07,
			impact = 0.05
		}
	}
}

NewDamageProfileTemplates.moonfire_fully_charged_hit = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	require_damage_for_dot = true,
	ignore_stagger_reduction = true,
	armor_modifier = {
		attack = {
			0.75, -- 2
			0.75, -- 0.5
			1,
			0.75,
			0.75,
			0.25
		},
		impact = {
			1,
			0.5,
			1,
			0.75,
			0.75,
			0.25
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.75, -- 0.5
			1,
			0.75,
			0.75,
			0.25
		},
		impact = {
			1,
			0.5,
			1,
			0.75,
			0.75,
			0.25
		}
	},
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
		}
	},
	cleave_distribution = {
		attack = 0.15,
		impact = 0.15
	},
	default_target = {
		boost_curve_coefficient_headshot = 2, -- 1
		dot_template_name = "we_deus_01_dot",
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_carbine",
		power_distribution_near = {
			attack = 0.41,
			impact = 0.3
		},
	power_distribution_far = {
			attack = 0.3,
			impact = 0.25
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}

NewDamageProfileTemplates.moonfire_fully_charged_dot = {
	is_dot = true,
	charge_value = "n/a",
	no_stagger_damage_reduction_ranged = true,
	no_stagger = true,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
	},
	armor_modifier = {
		attack = {
			1.75, -- 2
			1.2, -- 1
			3,
			2,
			1,
			0.5
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0
		}
	},
	default_target = {
		damage_type = "burninating",
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.07,
			impact = 0.05
		}
	}
}

NewDamageProfileTemplates.moonfire_uncharged_explosion = {
		charge_value = "aoe",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1,
				0,
				1.5,
				1,
				0.75,
				0
			},
			impact = {
				1,
				0,
				1,
				1,
				0.75,
				0
			}
		},
		default_target = {
			attack_template = "burning",
			dot_template_name = "moonfire_uncharged_dot_buff",
			damage_type = "burn",
			power_distribution = {
				attack = 0.1,
				impact = 0.2
			}
		}
	}

NewDamageProfileTemplates.moonfire_uncharged_explosion_glance = {
		charge_value = "aoe",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1,
				0,
				1.5,
				1,
				0.75,
				0
			},
			impact = {
				1,
				0,
				1,
				1,
				0.75,
				0
			}
		},
		default_target = {
			attack_template = "burning",
			dot_template_name = "moonfire_uncharged_dot_glance_buff",
			damage_type = "burn",
			power_distribution = {
				attack = 0.1,
				impact = 0.2
			}
		}
	}

NewDamageProfileTemplates.moonfire_partially_charged_explosion = {
		charge_value = "aoe",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1,
				0,
				1.5,
				1,
				0.75,
				0
			},
			impact = {
				1,
				0,
				1,
				1,
				0.75,
				0
			}
		},
		default_target = {
			attack_template = "burning",
			dot_template_name = "moonfire_partially_charged_dot_buff",
			damage_type = "burn",
			power_distribution = {
				attack = 0.1,
				impact = 0.2
			}
		}
	}

NewDamageProfileTemplates.moonfire_partially_charged_explosion_glance = {
		charge_value = "aoe",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1,
				0,
				1.5,
				1,
				0.75,
				0
			},
			impact = {
				1,
				0,
				1,
				1,
				0.75,
				0
			}
		},
		default_target = {
			attack_template = "burning",
			dot_template_name = "moonfire_partially_charged_dot_glance_buff",
			damage_type = "burn",
			power_distribution = {
				attack = 0.1,
				impact = 0.2
			}
		}
	}

NewDamageProfileTemplates.moonfire_fully_charged_explosion = {
		charge_value = "aoe",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1,
				0.25,
				1.5,
				1,
				0.75,
				0
			},
			impact = {
				1,
				0.5,
				1,
				1,
				0.75,
				0
			}
		},
		default_target = {
			attack_template = "burning",
			dot_template_name = "moonfire_fully_charged_dot_buff",
			damage_type = "burn",
			power_distribution = {
				attack = 0.25,
				impact = 0.5
			}
		}
	}
	
NewDamageProfileTemplates.moonfire_fully_charged_explosion_glance = {
		charge_value = "aoe",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1,
				0.25,
				1.5,
				1,
				0.75,
				0
			},
			impact = {
				1,
				0.5,
				1,
				1,
				0.75,
				0
			}
		},
		default_target = {
			attack_template = "burning",
			dot_template_name = "moonfire_fully_charged_dot_glance_buff",
			damage_type = "burn",
			power_distribution = {
				attack = 0.25,
				impact = 0.5
			}
		}
	}
-- Moonfire DoTs


mod:add_buff_template("moonfire_uncharged_dot_buff", {
	duration = 5,
	name = "moonfire_uncharged_dot_running_out_of_fucking_names",
	end_flow_event = "smoke",
	start_flow_event = "burn",
	death_flow_event = "burn_death",
	--remove_buff_func = "remove_dot_damage",
	apply_buff_func = "start_dot_damage",
	time_between_dot_damages = 1, -- 0.75
	damage_type = "burninating",
	damage_profile = "moonfire_uncharged_dot",
	update_func = "apply_dot_damage",
	perk = buff_perks.burning

})
DotTypeLookup.moonfire_uncharged_dot_buff = "burning_dot"

mod:add_buff_template("moonfire_uncharged_dot_glance_buff", {
	duration = 5,
	name = "moonfire_uncharged_dot_glance_running_out_of_fucking_names",
	end_flow_event = "smoke",
	start_flow_event = "burn",
	death_flow_event = "burn_death",
	--remove_buff_func = "remove_dot_damage",
	apply_buff_func = "start_dot_damage",
	time_between_dot_damages = 1, -- 0.75
	damage_type = "burninating",
	damage_profile = "we_deus_01_dot",
	update_func = "apply_dot_damage",
	perk = buff_perks.burning

})
DotTypeLookup.moonfire_uncharged_dot_glance_buff = "burning_dot"

mod:add_buff_template("moonfire_partially_charged_dot_buff", {
	duration = 5, -- 5
	name = "moonfire_partially_charged_dot_running_out_of_fucking_names",
	end_flow_event = "smoke",
	start_flow_event = "burn",
	death_flow_event = "burn_death",
	--remove_buff_func = "remove_dot_damage",
	apply_buff_func = "start_dot_damage",
	time_between_dot_damages = 1, -- 0.75
	damage_type = "burninating",
	damage_profile = "moonfire_partially_charged_dot",
	update_func = "apply_dot_damage",
	perk = buff_perks.burning

})
DotTypeLookup.moonfire_partially_charged_dot_buff = "burning_dot"

mod:add_buff_template("moonfire_partially_charged_dot_glance_buff", {
	duration = 5, -- 5
	name = "moonfire_partially_charged_dot_glance_running_out_of_fucking_names",
	end_flow_event = "smoke",
	start_flow_event = "burn",
	death_flow_event = "burn_death",
	--remove_buff_func = "remove_dot_damage",
	apply_buff_func = "start_dot_damage",
	time_between_dot_damages = 1, -- 0.75
	damage_type = "burninating",
	damage_profile = "we_deus_01_dot",
	update_func = "apply_dot_damage",
	perk = buff_perks.burning

})
DotTypeLookup.moonfire_partially_charged_dot_glance_buff = "burning_dot"

mod:add_buff_template("moonfire_fully_charged_dot_buff", {
	duration = 5, -- 5
	name = "moonfire_fully_charged_dot_running_out_of_fucking_names",
	end_flow_event = "smoke",
	start_flow_event = "burn",
	death_flow_event = "burn_death",
	--remove_buff_func = "remove_dot_damage",
	apply_buff_func = "start_dot_damage",
	time_between_dot_damages = 1, -- 0.75
	damage_type = "burninating",
	damage_profile = "moonfire_fully_charged_dot",
	update_func = "apply_dot_damage",
	perk = buff_perks.burning

})
DotTypeLookup.moonfire_fully_charged_dot_buff = "burning_dot"

mod:add_buff_template("moonfire_fully_charged_dot_glance_buff", {
	duration = 5, -- 5
	name = "moonfire_fully_charged_dot_glance_running_out_of_fucking_names",
	end_flow_event = "smoke",
	start_flow_event = "burn",
	death_flow_event = "burn_death",
	--remove_buff_func = "remove_dot_damage",
	apply_buff_func = "start_dot_damage",
	time_between_dot_damages = 1, -- 0.75
	damage_type = "burninating",
	damage_profile = "we_deus_01_dot",
	update_func = "apply_dot_damage",
	perk = buff_perks.burning
})
DotTypeLookup.moonfire_fully_charged_dot_glance_buff = "burning_dot"

mod:add_explosion_template("moonfire_uncharged_explosion_template", {
	explosion = {
		use_attacker_power_level = true,
		radius_min = 0.5,
		radius_max = 1,
		attacker_power_level_offset = 0.25,
		max_damage_radius_min = 0.1, -- 0.1
		damage_profile_glance = "moonfire_uncharged_explosion_glance",
		max_damage_radius_max = 0.75, -- 0.375
		sound_event_name = "we_deus_01_big_hit",
		damage_profile = "moonfire_uncharged_explosion",
		effect_name = "fx/wpnfx_we_deus_01_impact"
	}
})

mod:add_explosion_template("moonfire_partially_charged_explosion_template", {
	explosion = {
		use_attacker_power_level = true,
		radius_min = 0.5,
		radius_max = 1,
		attacker_power_level_offset = 0.25,
		max_damage_radius_min = 0.05, -- 0.1
		damage_profile_glance = "moonfire_partially_charged_explosion_glance",
		max_damage_radius_max = 0.375, -- 0.75
		sound_event_name = "we_deus_01_big_hit",
		damage_profile = "moonfire_partially_charged_explosion",
		effect_name = "fx/wpnfx_we_deus_01_impact"
	}
})

mod:add_explosion_template("moonfire_fully_charged_explosion_template", {
	explosion = {
		use_attacker_power_level = true,
		radius_min = 1.25,
		sound_event_name = "we_deus_01_big_hit",
		radius_max = 1.5, -- 3
		attacker_power_level_offset = 0.25,
		max_damage_radius_min = 0.5,
		alert_enemies_radius = 10,
		damage_profile_glance = "moonfire_fully_charged_explosion_glance",
		max_damage_radius_max = 1, -- 2
		alert_enemies = true,
		damage_profile = "moonfire_fully_charged_explosion",
		effect_name = "fx/wpnfx_we_deus_01_explosion"
	}
})

---- Moonfire weapon swap speed up

Weapons.we_deus_01_template_1.actions.action_one.default.total_time = 0.7 -- 0.83
Weapons.we_deus_01_template_1.actions.action_one.default.allowed_chain_actions[1].start_time =  0.4 -- 0.6

Weapons.we_deus_01_template_1.actions.action_one.shoot_charged.total_time = 0.55 -- 0.6
Weapons.we_deus_01_template_1.actions.action_one.shoot_charged.allowed_chain_actions[1].start_time = 0.45 -- 0.5

Weapons.we_deus_01_template_1.actions.action_one.shoot_special_charged.total_time = 0.5 -- 0.6
Weapons.we_deus_01_template_1.actions.action_one.shoot_special_charged.allowed_chain_actions[1].start_time = 0.4 -- 0.5

---- Live Moonfire Remade

Weapons.we_deus_01_template_1.actions.action_one.default.impact_data.damage_profile = "moonfire_uncharged_hit"
Weapons.we_deus_01_template_1.actions.action_one.default.impact_data.aoe = ExplosionTemplates.moonfire_uncharged_explosion_template

Weapons.we_deus_01_template_1.actions.action_one.shoot_special_charged.impact_data.damage_profile = "moonfire_partially_charged_hit"
Weapons.we_deus_01_template_1.actions.action_one.shoot_special_charged.impact_data.aoe = ExplosionTemplates.moonfire_partially_charged_explosion_template

Weapons.we_deus_01_template_1.actions.action_one.shoot_charged.impact_data.damage_profile = "moonfire_fully_charged_hit"
Weapons.we_deus_01_template_1.actions.action_one.shoot_charged.impact_data.aoe = ExplosionTemplates.moonfire_fully_charged_explosion_template

Weapons.we_deus_01_template_1.actions.action_one.default.drain_amount = 5 -- 5
Weapons.we_deus_01_template_1.actions.action_one.shoot_special_charged.drain_amount = 6 -- 6
Weapons.we_deus_01_template_1.actions.action_one.shoot_charged.drain_amount = 8 -- 7

EnergyData.we_waywatcher = {
	recharge_delay = 5, -- 0.2
	max_value = 25, -- 25
	depletion_cooldown = 5, -- 5
	recharge_rate = 0.75 -- 1.5
}
EnergyData.we_maidenguard = {
	recharge_delay = 5, -- 0.2
	max_value = 25, -- 25
	depletion_cooldown = 5, -- 5
	recharge_rate = 0.75 -- 1.5
}
EnergyData.we_shade = {
	recharge_delay = 5, -- 0.2
	max_value = 25, -- 25
	depletion_cooldown = 5, -- 5
	recharge_rate = 0.75 -- 1.5
}
EnergyData.we_thornsister = {
	recharge_delay = 5, -- 0.2
	max_value = 25, -- 25
	depletion_cooldown = 5, -- 5
	recharge_rate = 0.75 -- 1.5
}
