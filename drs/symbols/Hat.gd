extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "hat"
	self.value = 1
	self.values = [2]
	self.rarity = "uncommon"
	self.groups = []
	self.sfx = ["whistle"]
	
	self.texture = load_texture("res://drs/symbols/hat.png")
	self.name = "Hat"
	self.description = "<all_and_human> directly below this symbol give <color_E14A68><value_1>x<end> more <icon_coin>."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		if i.grid_position.y == symbol.grid_position.y + 1 && i.grid_position.x == symbol.grid_position.x:
			symbol.add_effect_for_symbol(i, effect().if_group("human").change_value_multiplier(values[0]).animate("circle", 0, [symbol, i]))