extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "hooligan"

func patch_description(description):
	return join(description, "Also <color_E14A68>destroys<end> adjacent <icon_bag_of_chips>.")

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_type("bag_of_chips").set_destroyed().animate("bounce", 1, [symbol, i]))
