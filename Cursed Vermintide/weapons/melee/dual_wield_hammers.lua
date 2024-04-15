local mod = get_mod("Vermintide Balance Manager")

    NewDamageProfileTemplates = NewDamageProfileTemplates or {}

	NewDamageProfileTemplates.dual_hammers_heavy_cleave_os = {
        targets = {
          {
            boost_curve_coefficient_headshot = 1,
            power_distribution = {
              impact = 0.175,
              attack = 0.225
            },
            armor_modifier = {
              impact = {
                1,
                1,
                0.5,
                1,
                0.75
              },
              attack = {
                1,
                0.5,
                1,
                1,
                0.75
              }
            },
            boost_curve_type = "tank_curve",
            attack_template = "blunt_tank"
          },
          {
            attack_template = "blunt_tank",
            power_distribution = {
              impact = 0.15,
              attack = 0.1
            },
            boost_curve_type = "tank_curve"
          },
          {
            attack_template = "light_blunt_tank",
            power_distribution = {
              impact = 0.1,
              attack = 0.075
            },
            boost_curve_type = "tank_curve"
          }
        },
        armor_modifier = {
          impact = {
            1,
            1,
            0.5,
            1,
            0.75
          },
          attack = {
            1,
            0.35,
            1,
            1,
            0.75
          }
        },
        default_target = {
          attack_template = "light_blunt_tank",
          power_distribution = {
            impact = 0.05,
            attack = 0.05
          },
          boost_curve_type = "tank_curve"
        },
        cleave_distribution = {
          impact = 0.8,
          attack = 0.2
        },
        charge_value = "heavy_attack",
        critical_strike = {
          attack_armor_power_modifer = {
            1,
            0.5,
            1,
            1,
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
        stagger_duration_modifier = 1.5
      }

      NewDamageProfileTemplates.dual_hammers_light_os = {
        targets = {
          {
            boost_curve_coefficient_headshot = 1.5,
            power_distribution = {
              impact = 0.2,
              attack = 0.15
            },
            attack_template = "blunt_tank",
            boost_curve_type = "tank_curve"
          },
          {
            attack_template = "light_blunt_tank",
            power_distribution = {
              impact = 0.175,
              attack = 0.075
            },
            boost_curve_type = "tank_curve"
          }
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
            1,
            1
          }
        },
        cleave_distribution = {
          impact = 0.4,
          attack = 0.2
        },
        charge_value = "light_attack",
        critical_strike = {
          attack_armor_power_modifer = {
            1,
            0.25,
            1.5,
            1,
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
        default_target = {
          attack_template = "light_blunt_tank",
          power_distribution = {
            impact = 0.1,
            attack = 0.05
          },
          boost_curve_type = "tank_curve"
        }
      }
	
	  Weapons.dual_wield_hammers_template.actions.action_one.heavy_attack_2.damage_profile_left = "dual_hammers_heavy_cleave_os"
    Weapons.dual_wield_hammers_template.actions.action_one.heavy_attack_2.damage_profile_right = "dual_hammers_heavy_cleave_os"
	
    Weapons.dual_wield_hammers_template.actions.action_one.heavy_attack_3.damage_profile_left = "dual_hammers_heavy_cleave_os"
    Weapons.dual_wield_hammers_template.actions.action_one.heavy_attack_3.damage_profile_right = "dual_hammers_heavy_cleave_os"
      -- QQ
    Weapons.dual_wield_hammers_template.actions.action_one.heavy_attack.allowed_chain_actions = {
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
        start_time = 0.4, -- 0.4
        action = "action_wield",
        input = "action_wield"
      }
    }