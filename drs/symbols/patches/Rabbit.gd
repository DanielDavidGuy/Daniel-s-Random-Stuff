extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "rabbit"

func patch_description(description):
	return join(description, "Adjacent <icon_egg> transforms into <icon_easter_egg>.")

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_type("egg").change_type("easter_egg").animate("bounce", 0, [symbol, i]))