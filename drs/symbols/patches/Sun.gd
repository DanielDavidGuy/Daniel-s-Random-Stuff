extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "sun"

func patch_description(description):
	return join(description, "Adjacent <icon_earth> gives <color_E14A68>3x<end> more <icon_coin>.")

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_type("earth").change_value_multiplier(3).animate("circle", 0, [symbol, i]))