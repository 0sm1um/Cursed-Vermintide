local mod = get_mod("Vermintide Balance Manager")

-- Warpfire Thrower
Breeds.skaven_warpfire_thrower.walk_speed = 2.5 -- 1.9
Breeds.skaven_warpfire_thrower.run_speed = 5 -- 4

BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.angle_speed = 20 -- 20
BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.rotation_speed = 90 -- 80
BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.radial_speed_feet_shooting = math.pi * 0.725 * 1.1 -- math.pi * 0.725
BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.radial_speed_upper_body_shooting = math.pi * 0.35 * 1.1 -- math.pi * 0.35

-- Ratling Gun
Breeds.skaven_ratling_gunner.walk_speed = 2.5 -- 1.9
Breeds.skaven_ratling_gunner.run_speed = 5 -- 4

BreedActions.skaven_ratling_gunner.shoot_ratling_gun.angle_speed = 20 -- 20
BreedActions.skaven_ratling_gunner.shoot_ratling_gun.fire_rate_at_end = 25 -- 25
BreedActions.skaven_ratling_gunner.shoot_ratling_gun.fire_rate_at_start = 10 -- 10
BreedActions.skaven_ratling_gunner.shoot_ratling_gun.rotation_speed = 90 -- 80
BreedActions.skaven_ratling_gunner.shoot_ratling_gun.radial_speed_feet_shooting = math.pi * 0.725 * 1.1 -- math.pi * 0.725
BreedActions.skaven_ratling_gunner.shoot_ratling_gun.radial_speed_upper_body_shooting = math.pi * 0.35 * 1.1 -- math.pi * 0.35
