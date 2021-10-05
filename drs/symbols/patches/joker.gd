extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "joker"

func patch_description(description):
	return join(description, "Adjacent <all_and_jokerlikes> also give <color_E14A68>2x<end> more <icon_coin>.")

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("jokerlikes").change_value_multiplier(2).animate("rotate", 0, [symbol, i]))