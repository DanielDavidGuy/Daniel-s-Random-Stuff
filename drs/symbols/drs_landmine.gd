extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "landmine"
	self.value = 2
	self.values = [15]
	self.rarity = "uncommon"
	self.groups = []
	self.sfx = ["growhit"]
	
	self.texture = load_texture("res://drs/symbols/landmine.png")
	self.name = "Landmine"
	self.description = "When adjacent to <all_or_human>, <color_E14A68>destroys<end> itself and all adjacent symbols. Gives <icon_coin><color_FBF236><value_1><end> after <color_E14A68>destroying<end> itself."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		if i.groups.has("human"):
			symbol.add_effect(effect().change_value_bonus(values[0]))
			symbol.add_effect(effect().set_destroyed().animate("shake", 0, [symbol, i]))
			for j in adjacent:
				symbol.add_effect_for_symbol(j, effect().set_destroyed())