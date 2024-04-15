local mod = get_mod("Vermintide Balance Manager")

--Duck foot
--local balanced_barrels =  { {	yaw = -1, pitch = 0, shot_count = 2 }, { yaw = -0.5, pitch = 0, shot_count = 2 },	{ yaw = 0, pitch = 0, shot_count = 4 }, { yaw = 0.5,  pitch = 0, shot_count = 2 }, { yaw = 1, pitch = 0, shot_count = 2 } }
--Weapons.wh_deus_01_template_1.actions.action_one.default.barrels = balanced_barrels
DamageProfileTemplates.shot_duckfoot.cleave_distribution.attack = 0.05
DamageProfileTemplates.shot_duckfoot.cleave_distribution.impact = 0.05

Weapons.wh_deus_01_template_1.ammo_data.ammo_per_clip = 4
Weapons.wh_deus_01_template_1.ammo_data.ammo_per_reload = 1
Weapons.wh_deus_01_template_1.ammo_data.play_reload_anim_on_wield_reload = true
Weapons.wh_deus_01_template_1.action_on_wield = nil

Weapons.wh_deus_01_template_1.actions.action_one.default.hit_mass_count = SHOTGUN_HIT_MASS_COUNT 
