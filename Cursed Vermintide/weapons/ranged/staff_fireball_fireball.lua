local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates.staff_fireball_os = {
    targets = {
    },
    no_stagger_damage_reduction_ranged = true,
    default_target = {
      boost_curve_coefficient_headshot = 1,
      boost_curve_coefficient = 0.75,
      power_distribution_far = {
        impact = 0.15,
        attack = 0.15
      },
      boost_curve_type = "linesman_curve",
      power_distribution_near = {
        impact = 0.3,
        attack = 0.4 -- 0.35
      },
      attack_template = "fireball",
      range_dropoff_settings = {
        dropoff_end = 30,
        dropoff_start = 15
      }
    },
    armor_modifier = {
      impact = {
        1,
        0.6,
        0,
        0,
        0.5,
        0
      },
      attack = {
        1, -- 1
        0.35, -- 0.35
        2, -- 1.5
        0.1, -- 1
        1,
        0
      }
    },
    cleave_distribution = {
      impact = 0.1,
      attack = 0.1
    },
    charge_value = "projectile",
    critical_strike = {
      attack_armor_power_modifer = {
        1, -- 1
        0.75,
        3, -- 1.5
        0.1, -- 1
        1,
        0.25
      },
      impact_armor_power_modifer = {
        1,
        0.6,
        0,
        0,
        1,
        0.25
      }
    },
    require_damage_for_dot = true
  }

NewDamageProfileTemplates.staff_fireball_charged_os = {
    no_stagger_damage_reduction_ranged = true,
    targets = {
    },
    armor_modifier = {
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
        1,
        7.5, -- 4
        1,
        0.1,
        0
      }
    },
    cleave_distribution = {
      impact = 1,
      attack = 1
    },
    charge_value = "projectile",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        1,
        7.5, -- 4
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
      dot_template_name = "burning_dot_1tick",
      boost_curve_coefficient = 1,
      boost_curve_coefficient_headshot = 1.25,
      power_distribution_far = {
        impact = 0.25,
        attack = 0.3
      },
      boost_curve_type = "ninja_curve",
      power_distribution_near = {
        impact = 0.5,
        attack = 0.4 -- 0.3
      },
      attack_template = "fireball",
      range_dropoff_settings = {
        dropoff_end = 15,
        dropoff_start = 8
      }
    }
  }

  mod:add_explosion_template("fireball_os", {
    explosion = {
        use_attacker_power_level = true,
        radius_min = 0.5,
        radius_max = 1,
        attacker_power_level_offset = 0.25,
        max_damage_radius_min = 0.1,
        damage_profile_glance = "fireball_explosion_glance_os",
        max_damage_radius_max = 0.75,
        sound_event_name = "drakepistol_hit",
        damage_profile = "fireball_explosion_os",
        effect_name = "fx/wpnfx_drake_pistols_projectile_impact"
    }
})

mod:add_explosion_template("fireball_charged_os", {
    explosion = {
        use_attacker_power_level = true,
        radius_min = 1.25,
        sound_event_name = "fireball_big_hit",
        radius_max = 3,
        attacker_power_level_offset = 0.25,
        max_damage_radius_min = 0.5,
        alert_enemies_radius = 10,
        damage_profile_glance = "fireball_charged_explosion_glance_os",
        max_damage_radius_max = 2,
        alert_enemies = true,
        damage_profile = "fireball_charged_explosion_os",
        effect_name = "fx/wpnfx_fireball_charged_impact"
    }
})

NewDamageProfileTemplates.fireball_explosion_os = {
    no_stagger_damage_reduction_ranged = true,
    default_target = {
      attack_template = "drakegun",
      power_distribution = {
        impact = 0.2,
        attack = 0.1
      },
      damage_type = "drakegun"
    },
    targets = {
    },
    charge_value = "aoe",
    armor_modifier = {
      impact = {
        1,
        0,
        1,
        1,
        0.75,
        0
      },
      attack = {
        1,
        0,
        3, -- 1.5
        1,
        0.75,
        0
      }
    }
  }

NewDamageProfileTemplates.fireball_explosion_glance_os = {
    no_stagger_damage_reduction_ranged = true,
    armor_modifier = {
      attack = {
        1,
        0,
        3, -- 1.5
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
    targets = {
    },
    charge_value = "aoe",
    default_target = {
      attack_template = "drakegun_glance",
      power_distribution = {
        attack = 0.1,
        impact = 0.2
      },
      damage_type = "drakegun_glance"
    }
  }

  NewDamageProfileTemplates.fireball_charged_explosion_glance_os = {
    no_stagger_damage_reduction_ranged = true,
    armor_modifier = {
      attack = {
        1,
        0.5, -- 0.25
        3, -- 1.5
        1, -- 0.25
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
    targets = {
    },
    charge_value = "aoe",
    default_target = {
      attack_template = "drakegun_glance",
      power_distribution = {
        attack = 0.25,
        impact = 0.5
      },
      dot_template_name = "burning_1W_dot",
      damage_type = "drakegun_glance"
    }
  }

  NewDamageProfileTemplates.fireball_charged_explosion_os = {
    no_stagger_damage_reduction_ranged = true,
    default_target = {
      attack_template = "drakegun",
      power_distribution = {
        impact = 0.5,
        attack = 0.25
      },
      damage_type = "drakegun",
      dot_template_name = "burning_1W_dot"
    },
    targets = {
    },
    charge_value = "aoe",
    armor_modifier = {
      impact = {
        1,
        0.5,
        1,
        1,
        0.75,
        0
      },
      attack = {
        1,
        0.5, -- 0.25
        3, -- 1.5
        0.5, -- 1
        0.75,
        0
      }
    }
  }

Weapons.staff_fireball_fireball_template_1.actions.action_one.default.impact_data.damage_profile = "staff_fireball_os"
Weapons.staff_fireball_fireball_template_1.actions.action_one.default.impact_data.aoe = ExplosionTemplates.fireball_os

Weapons.staff_fireball_fireball_template_1.actions.action_one.shoot_charged.impact_data.damage_profile = "staff_fireball_charged_os"
Weapons.staff_fireball_fireball_template_1.actions.action_one.shoot_charged.impact_data.aoe = ExplosionTemplates.fireball_charged_os


--Weapons.staff_fireball_fireball_template_1.actions.action_one.default.initial_damage_profile = "initial_beam_beam_os"

--Weapons.staff_fireball_fireball_template_1.actions.action_two.charged_beam.damage_profile = "beam_sniper_shot_os"

--Weapons.staff_blast_beam_template_1.actions.action_two.charged_beam.use_beam_consecutive_hits = true
