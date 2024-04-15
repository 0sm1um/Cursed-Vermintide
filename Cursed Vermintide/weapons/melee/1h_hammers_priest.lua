local mod = get_mod("Vermintide Balance Manager")

NewDamageProfileTemplates = NewDamageProfileTemplates or {}

  Weapons.one_handed_hammer_priest_template.actions.action_one.heavy_attack_01.damage_profile = "hammer_heavy_os"
  Weapons.one_handed_hammer_priest_template.actions.action_one.heavy_attack_02.damage_profile = "hammer_heavy_os"

  Weapons.one_handed_hammer_priest_template.actions.action_one.light_attack_01.damage_profile = "hammer_light_os"
  Weapons.one_handed_hammer_priest_template.actions.action_one.light_attack_02.damage_profile = "hammer_light_os"
  Weapons.one_handed_hammer_priest_template.actions.action_one.light_attack_03.damage_profile = "light_vertical_strike_os"
  Weapons.one_handed_hammer_priest_template.actions.action_one.light_attack_04.damage_profile = "light_vertical_strike_os"

  Weapons.one_handed_hammer_priest_template.actions.action_one.light_attack_03.range_mod = 1.33 -- 1.2
  Weapons.one_handed_hammer_priest_template.actions.action_one.light_attack_04.range_mod = 1.33 -- 1.2
