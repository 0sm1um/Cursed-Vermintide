local mod = get_mod("Cursed Vermintide")

-- Quick Tweak Panel

mod:hook(BuffExtension, "has_procced", function (func, self, proc_chance, key)
	local lookup_data = key.lookup_data or {}
	if lookup_data then
		local item_template_name = lookup_data.item_template_name or {}
		if item_template_name == "sienna_scholar_career_skill_weapon" then
			local roll = math.random()
			if proc_chance > roll then
				return true
			else
				return false
			end
		end
	end
	return func(self, proc_chance, key)
end)
