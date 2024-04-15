local mod = get_mod("Vermintide Balance Manager")

Projectiles.spear = {
	projectile_unit_template_name = "player_projectile_unit",
	gravity_settings = "spark",
	impact_type = "sphere_sweep",
	radius_max = 0.05, -- 0.1
	trajectory_template_name = "throw_trajectory",
	radius_min = 0.05,
	projectile_units_template = "spear"
}