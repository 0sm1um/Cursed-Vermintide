local mod = get_mod("Vermintide Balance Manager")

--Conflag
--DamageProfileTemplates.geiser.targets[1].power_distribution.attack = 0.5
--ExplosionTemplates.conflag.aoe.duration = 10
--ExplosionTemplates.conflag.aoe.damage_interval = 2


mod:add_explosion_template("conflag", {
	aoe = {
		area_damage_template = "explosion_template_aoe",
		attack_template = "wizard_staff_geiser",
		create_nav_tag_volume = true,
		damage_interval = 1,
		dot_balefire_variant = true,
		dot_template_name = "burning_dot_1tick",
		duration = 1, -- 2
		nav_tag_volume_layer = "fire_grenade",
		radius = 4,
		nav_mesh_effect = {
			particle_name = "fx/wpnfx_fire_grenade_impact_remains_remap",
			particle_radius = 2,
			particle_spacing = 0.9,
		}
	}
})

Weapons.staff_fireball_geiser_template_1.actions.action_one.default.impact_data.damage_profile = "staff_fireball_os"
Weapons.staff_fireball_geiser_template_1.actions.action_one.default.impact_data.aoe = ExplosionTemplates.fireball_os
