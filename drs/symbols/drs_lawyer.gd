extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "lawyer"
	self.value = 1
	self.values = [3]
	self.rarity = "uncommon"
	self.groups = ["organism", "human"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/lawyer.png")
	self.name = "Lawyer"
	self.description = "If an adjacent symbol takes <icon_coin>, this symbol gives <color_E14A68><value_1>x<end> the amount of <icon_coin> taken."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
			var i_effect = effect().if_final_value_less_than(0).set_target(symbol).change_value_bonus(0).dynamic_symbol_value(i, -values[0], true)
			i_effect.effect_dictionary.erase("diff")
			symbol.add_effect_for_symbol(i, i_effect)