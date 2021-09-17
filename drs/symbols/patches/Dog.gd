extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "dog"

func patch_description(description):
	return join(description, "<color_E14A68>Destroys<end> adjacent <all_and_doghates>. Gives <color_FBF236><icon_coin><value_2><end> for each symbol <color_E14A68>destroyed<end>.")

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("doghates").set_destroyed().animate("bounce", 0, [symbol, i]))
		symbol.add_effect_for_symbol(i, effect().if_destroyed().if_group("doghates").set_target(symbol).change_value_bonus(symbol.values[1]))

func patch_values(values, value_index):
	self.value_index = value_index
	values.push_back(8)
	return values