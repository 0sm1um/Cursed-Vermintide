local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

NewDamageProfileTemplates.executioner_light_os = {
    targets = {
      {
        boost_curve_coefficient_headshot = 4,
        power_distribution = {
          impact = 0.25,
          attack = 0.2
        },
        attack_template = "slashing_linesman_executioner",
        boost_curve_type = "linesman_curve"
      },
      {
        boost_curve_coefficient_headshot = 3,
        power_distribution = {
          impact = 0.175,
          attack = 0.15
        },
        attack_template = "slashing_linesman_executioner",
        boost_curve_type = "linesman_curve"
      },
      {
        boost_curve_coefficient_headshot = 2.5,
        power_distribution = {
          impact = 0.1,
          attack = 0.1
        },
        attack_template = "light_slashing_linesman_executioner",
        boost_curve_type = "linesman_curve"
      }
    },
    armor_modifier = {
      impact = {
        1,
        0.5,
        0.5,
        1,
        1
      },
      attack = {
        1,
        0,
        1.5,
        1,
        1
      }
    },
    cleave_distribution = {
      impact = 0.25,
      attack = 0.25
    },
    charge_value = "light_attack",
    critical_strike = {
      attack_armor_power_modifer = {
        1,
        0.5,
        2,
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
      boost_curve_coefficient_headshot = 0.25,
      power_distribution = {
        impact = 0.05,
        attack = 0.075
      },
      attack_template = "light_slashing_linesman_executioner",
      boost_curve_type = "linesman_curve"
    }
  }

Weapons.two_handed_swords_executioner_template_1.actions.action_one.light_attack_left.damage_profile = "executioner_light_os"
Weapons.two_handed_swords_executioner_template_1.actions.action_one.light_attack_right.damage_profile = "executioner_light_os"
Weapons.two_handed_swords_executioner_template_1.actions.action_one.light_attack_left_diagonal.damage_profile = "executioner_light_os"
--[[
local exe_heavies_allowed_chain_actions_1 = {
  {
    action = "action_one",
    input = "action_one",
    release_required = "action_one_hold",
    start_time = 0.8,
    sub_action = "default_left_diagonal_other_left",
  },
  {
    action = "action_one",
    input = "action_one_hold",
    release_required = "action_one_hold",
    start_time = 0.8,
    sub_action = "default_left_diagonal_other_left",
  },
  {
    action = "action_one",
    input = "action_one",
    start_time = 1.05,
    sub_action = "default",
  },
  {
    action = "action_two",
    input = "action_two_hold",
    start_time = 0.5, -- 0.5
    sub_action = "default",
  },
  {
    action = "action_wield",
    input = "action_wield",
    start_time = 0.65, 
    sub_action = "default",
  },
}

local exe_heavies_allowed_chain_actions_2 = {
  {
    action = "action_one",
    input = "action_one",
    release_required = "action_one_hold",
    start_time = 0.8,
    sub_action = "default_left_diagonal",
  },
  {
    action = "action_one",
    input = "action_one_hold",
    release_required = "action_one_hold",
    start_time = 0.8,
    sub_action = "default_left_diagonal",
  },
  {
    action = "action_one",
    input = "action_one",
    start_time = 1.05,
    sub_action = "default",
  },
  {
    action = "action_two",
    input = "action_two_hold",
    start_time = 0.5, -- 0.5
    sub_action = "default",
  },
  {
    action = "action_wield",
    input = "action_wield",
    start_time = 0.85,
    sub_action = "default",
  },
}
--]]

Weapons.two_handed_swords_executioner_template_1.actions.action_one.heavy_attack_left.additional_critical_strike_chance = 0.15 -- 0.2
Weapons.two_handed_swords_executioner_template_1.actions.action_one.heavy_attack_right.additional_critical_strike_chance = 0.15 -- 0.2
