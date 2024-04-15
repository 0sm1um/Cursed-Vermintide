local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

  NewDamageProfileTemplates.elven_axe_light_single_target_os = {
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    ignore_stagger_reduction = true,
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
        1.25,
        0.65,
        2.5,
        1,
        0.75,
        0.6
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
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.25,
        0.75,
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
    default_target = {
      boost_curve_coefficient_headshot = 1.5,
      power_distribution = {
        impact = 0.175,
        attack = 0.25
      },
      attack_template = "slashing_smiter",
      boost_curve_type = "smiter_curve"
    }
  }


  NewDamageProfileTemplates.elven_axe_light_cleave_os = {
    cleave_distribution = {
      impact = 0.075,
      attack = 0.075
    },
    ignore_stagger_reduction = true,
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
        1.,
        0.3,
        2.5,
        1,
        0.75,
        0.6
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
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1.,
        0.5,
        2.5,
        1,
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
    default_target = {
      boost_curve_coefficient_headshot = 1.5,
      power_distribution = {
        impact = 0.175,
        attack = 0.3
      },
      attack_template = "slashing_smiter",
      boost_curve_type = "smiter_curve"
    }
  }


Weapons.we_one_hand_axe_template.max_fatigue_points = 4 -- 6

Weapons.we_one_hand_axe_template.actions.action_one.light_attack_left.damage_profile = "elven_axe_light_cleave_os"
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_right.damage_profile = "elven_axe_light_cleave_os"
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_last.damage_profile = "elven_axe_light_single_target_os"
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_right_last.damage_profile = "elven_axe_light_single_target_os"

Weapons.we_one_hand_axe_template.actions.action_one.light_attack_bopp.damage_profile = "elven_axe_light_cleave_os"

--Weapons.we_one_hand_axe_template.actions.action_one.light_attack_left.hit_mass_count = LINESMAN_HIT_MASS_COUNT
--Weapons.we_one_hand_axe_template.actions.action_one.light_attack_right.hit_mass_count = LINESMAN_HIT_MASS_COUNT
--Weapons.we_one_hand_axe_template.actions.action_one.light_attack_right_last.hit_mass_count = LINESMAN_HIT_MASS_COUNT
--Weapons.we_one_hand_axe_template.actions.action_one.light_attack_last.hit_mass_count = LINESMAN_HIT_MASS_COUNT
--Weapons.we_one_hand_axe_template.actions.action_one.light_attack_bopp.hit_mass_count = LINESMAN_HIT_MASS_COUNT

Weapons.we_one_hand_axe_template.actions.action_one.heavy_attack_left.damage_profile = "heavy_1h_axe_os"
Weapons.we_one_hand_axe_template.actions.action_one.heavy_attack_right.damage_profile = "heavy_1h_axe_os"

Weapons.we_one_hand_axe_template.actions.action_one.light_attack_left.range_mod = 1.35 -- 1.2
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_right.range_mod= 1.4 -- 1.25
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_right_last.range_mod = 1.25 --1.2
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_last.range_mod = 1.4 -- 1.25
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_bopp.range_mod = 1.4 -- 1.25 

Weapons.we_one_hand_axe_template.actions.action_one.heavy_attack_left.range_mod = 1.4 -- 1.25
Weapons.we_one_hand_axe_template.actions.action_one.heavy_attack_left.range_mod = 1.4 -- 1.25 

Weapons.we_one_hand_axe_template.actions.action_one.default.buff_data = {}
Weapons.we_one_hand_axe_template.actions.action_one.default_right.buff_data = {}
Weapons.we_one_hand_axe_template.actions.action_one.default_left.buff_data = {}
Weapons.we_one_hand_axe_template.actions.action_one.default_last.buff_data = {}
--Weapons.we_one_hand_axe_template.actions.action_one.heavy_attack_left.buff_data = {}
--Weapons.we_one_hand_axe_template.actions.action_one.heavy_attack_right.buff_data = {}
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_left.buff_data = {}
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_right.buff_data = {}
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_right_last.buff_data = {}
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_last.buff_data = {}
Weapons.we_one_hand_axe_template.actions.action_one.light_attack_bopp.buff_data = {}
