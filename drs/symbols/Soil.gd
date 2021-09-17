extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "soil"
	self.value = 1
	self.values = [3]
	self.rarity = "uncommon"
	self.groups = ["earthbend"]
	self.sfx = ["farmer"]
	
	self.texture = load_texture("res://drs/symbols/soil.png")
	self.name = "Soil"
	self.description = "<all_and_plant> directly above this symbol give <color_E14A68><value_1>x<end> more <icon_coin>."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		if i.grid_position.y == symbol.grid_position.y - 1 && i.grid_position.x == symbol.grid_position.x:
			symbol.add_effect_for_symbol(i, effect().if_group("plant").change_value_multiplier(values[0]).animate("circle", 0, [symbol, i]))