local mod = get_mod("Vermintide Balance Manager")

--[[
--Explosion kill credit fix
mod:hook_safe(PlayerProjectileHuskExtension, "init", function(self, extension_init_data)
    self.owner_unit = extension_init_data.owner_unit
end)
--]]

local normal_slot_count = 5 -- 9
local medium_slot_count = 5 -- 8
local large_slot_count = 1 -- 4

SlotSettings = {
	normal = {
		count = normal_slot_count,
		dialogue_surrounded_count = 4,
		distance = 1.85,
		priority = 2,
		queue_distance = 3,
		radius = 0.5, -- 0.5
		use_wait_slots = true,
	},
	medium = {
		count = medium_slot_count,
		dialogue_surrounded_count = 3,
		distance = 2.2,
		priority = 1.5,
		queue_distance = 3.5,
		radius = 0.75,
		use_wait_slots = true,
	},
	large = {
		count = large_slot_count,
		dialogue_surrounded_count = 2,
		distance = 2.25,
		priority = 1,
		queue_distance = 3.5,
		radius = 1.25,
		use_wait_slots = false,
	},
}

SlotTypeSettings = {
	normal = {
		count = normal_slot_count, -- 9
		debug_color = "lime",
		dialogue_surrounded_count = 4,
		distance = 1.85,
		priority = 2,
		queue_distance = 3,
		radius = 0.5, -- 0.5
		use_wait_slots = true, -- true
	},
	medium = {
		count = medium_slot_count, -- 8
		debug_color = "yellow",
		dialogue_surrounded_count = 3,
		distance = 2.2,
		priority = 1.5,
		queue_distance = 3.5, -- 3.5
		radius = 1, -- 1
		use_wait_slots = true, -- true
	},
	large = {
		count = large_slot_count, -- 4
		debug_color = "red",
		dialogue_surrounded_count = 2,
		distance = 2.25,
		priority = 1,
		queue_distance = 3.5,
		radius = 1.5, -- 1.5
		use_wait_slots = false, -- false
	},
}

--SlotTemplates.cataclysm_3.skaven_horde.avoid_slots_behind_overwhelmed_target = false -- false
--SlotTemplates.cataclysm_3.chaos_roamer.avoid_slots_behind_overwhelmed_target = true -- false
--SlotTemplates.cataclysm_3.chaos_elite.avoid_slots_behind_overwhelmed_target = true -- false
--SlotTemplates.cataclysm_3.chaos_large_elite.avoid_slots_behind_overwhelmed_target = true -- false

local dummy_data = {
	disable_slot_search = true,
}

SlotTemplates.cataclysm_3 = {
    skaven_horde = {
        abandon_slot_when_blocked = false, -- false
        abandon_slot_when_blocked_time = 0.1, -- 0.3
        abandon_slot_when_staggered = true, -- false
        abandon_slot_when_staggered_time = 0.01, -- 0.3
        avoid_slots_behind_overwhelmed_target = true, -- true
        min_wait_queue_distance = 2, -- 2
        prioritize_queued_units_on_death = true, -- true
        restricted_queue_distance = true, -- true
        slot_type = "normal", -- "normal"
    },
    skaven_roamer = {
        abandon_slot_when_blocked = false, -- false
        min_wait_queue_distance = 2, -- 2
        prioritize_queued_units_on_death = true, -- true
        restricted_queue_distance = true, -- true
        slot_type = "normal", -- "normal"
    },
    chaos_horde = {
        abandon_slot_when_blocked = false, -- false
        abandon_slot_when_blocked_time = 0.3, -- 0.3
        abandon_slot_when_staggered = true, -- true
        abandon_slot_when_staggered_time = 0.01, -- 0.3
        avoid_slots_behind_overwhelmed_target = true, -- true
        min_wait_queue_distance = 3.5, -- 3.5
        prioritize_queued_units_on_death = true, -- true
        restricted_queue_distance = true, -- true
        slot_type = "normal", -- "normal"
    },
    chaos_roamer = {
        avoid_slots_behind_overwhelmed_target = false, -- false
        min_wait_queue_distance = 3, -- 3
        prioritize_queued_units_on_death = true, -- true
        restricted_queue_distance = true, -- true
        slot_type = "medium", -- "medium"
    },
    skaven_elite = {
        avoid_slots_behind_overwhelmed_target = false, -- false
        abandon_slot_when_staggered = true, -- nil
        abandon_slot_when_staggered_time = 0.01, -- nil
        min_wait_queue_distance = 2.5, -- 3
        restricted_queue_distance = false, -- true
        slot_type = "normal", -- "normal"
    },
    chaos_elite = {
        avoid_slots_behind_overwhelmed_target = false, -- false
        min_wait_queue_distance = 2.5, -- 3
        restricted_queue_distance = false, -- true
        slot_type = "medium", -- "medium",
        abandon_slot_when_staggered = true, -- nil
        abandon_slot_when_staggered_time = 0.01, -- nil
    },
    chaos_large_elite = {
        avoid_slots_behind_overwhelmed_target = false, -- false
        min_wait_queue_distance = 3, -- 3
        restricted_queue_distance = true, -- true
        slot_type = "large", -- "large"
    },
    boss = dummy_data,
}

DLCUtils.map_list("slot_templates_file_names", function (file_name)
	return table.merge_recursive(SlotTemplates, require(file_name))
end)
