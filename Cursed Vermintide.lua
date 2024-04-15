local mod = get_mod("Cursed Vermintide")

-- base
mod:dofile("scripts/mods/Cursed Vermintide/base/helper_functions")

-- Balance Mod shit
mod:dofile("scripts/mods/Cursed Vermintide/Cursed Vermintide/apply_cursed_vermintide")

mod.activate_cursed_vermintide()

mod.return_to_keep = function()
	mod:pcall(function()
		local mechanism = Managers.mechanism:game_mechanism()
		local mgmt = Managers.state.game_mode
		if mgmt then
			mgmt:start_specific_level(mechanism:get_hub_level_key())
		end
	end)
end


-- See deathwish file for function
--[[
mod.on_setting_changed = function()
    if mod:get("apply_settings") == true then
        mod.save_official_mutator()
        mod.return_to_keep()
        mod:set("apply_settings", false)
    end
    if widget_settings[setting_id] then
		local widget_setting = widget_settings[setting_id]
		type_widget_setting(widget_setting, setting_id)
	end
end
--]]

--[[
mod.current_balance_mod = mod:get("balance_mod")

local settings_sync_package_id = "settings_sync"

mod:network_register("settings_sync", function(sender, host_balance_mod)
	mod.check_balance_mod(host_balance_mod)
end)

mod.on_user_joined = function(player)
    mod.current_balance_mod = mod:get("balance_mod")
	if Managers.player.is_server then
		mod:network_send("settings_sync", "others", mod.current_balance_mod)
        mod:echo("Sending balance mod info")
	end
end

mod.check_balance_mod = function (host_balance_mod)
    local my_balance_mod = mod:get("balance_mod")
    if host_balance_mod == nil then
        mod:echo("WARNING: The host you have joined is not running VMB and the host's Balance Mod is unknown.")
    end
    if my_balance_mod ~= host_balance_mod then
        mod:echo("Checking host's Balance Mod")
        mod:chat_broadcast("WARNING: A player has connected with a mismatched balance mod. Ensure that all players have the same balance selected in the VMF menu.")
        --mod:echo("WARNING: The host you have joined has another balance mod active. You must swap balance mods in the VBM menu and restart your game.")
    end
end

mod:network_register(settings_sync_package_id, function(sender, host_balance_mod)
	mod.check_balance_mod(host_balance_mod)
end)

mod.sync_mod_settings = function ()
	mod:network_send(settings_sync_package_id, "others", mod.current_balance_mod
	)
end
--]]
