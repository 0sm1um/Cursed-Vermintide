local mod = get_mod("Tourney Balance")

--[[
--Explosion kill credit fix
mod:hook_safe(PlayerProjectileHuskExtension, "init", function(self, extension_init_data)
    self.owner_unit = extension_init_data.owner_unit
end)
--]]
--[[
SlotSettings = {
	normal = {
		count = 12, -- 9
		priority = 2,
		distance = 1.85,
		queue_distance = 3,
		radius = 0.5,
		use_wait_slots = true,
		dialogue_surrounded_count = 6 -- 4
	},
	medium = {
		count = 10, -- 8
		priority = 1.5,
		distance = 2.2, 
		queue_distance = 3.25, -- 3.25
		radius = 0.75,
		use_wait_slots = true,
		dialogue_surrounded_count = 5 -- 3
	},
	large = {
		count = 4, -- 4
		priority = 1,
		distance = 2.25,
		queue_distance = 3.25, -- 3.5
		radius = 1.25,
		use_wait_slots = false,
		dialogue_surrounded_count = 4 -- 2
	}
}
--]]
