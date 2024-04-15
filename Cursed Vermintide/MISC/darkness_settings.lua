local mod = get_mod("Tourney Balance")

--[[
--Explosion kill credit fix
mod:hook_safe(PlayerProjectileHuskExtension, "init", function(self, extension_init_data)
    self.owner_unit = extension_init_data.owner_unit
end)
--]]

local new_darkness_settings = {
		player_light_intensity = 0.15, -- 0.15
        disable_screen_fx = true,
		volumes = {
			"sewerlight"
		}
	}

LevelSettings.mines.darkness_settings = new_darkness_settings
LevelSettings.nurgle.darkness_settings = new_darkness_settings
LevelSettings.dlc_bogenhafen_city.darkness_settings = new_darkness_settings
