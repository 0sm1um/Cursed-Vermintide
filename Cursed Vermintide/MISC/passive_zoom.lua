local mod = get_mod("Vermintide Balance Manager")

for _, i in pairs(PassiveAbilitySettings) do
	table.insert(i.buffs,"kerillian_waywatcher_passive_increased_zoom")
end
