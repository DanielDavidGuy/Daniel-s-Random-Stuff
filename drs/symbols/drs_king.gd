extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "king"
	self.value = 2
	self.values = [3, 2, -100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000]
	self.rarity = "rare"
	self.groups = ["chessupper", "chess"]
	self.sfx = ["dice"]
	
	self.texture = load_texture("res://drs/symbols/king.png")
	self.name = "Chess King"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> more if its <color_E14A68>position<end> is adjacent to its previous <color_E14A68>position<end>. Adjacent <all_and_chess> give <color_E14A68><value_2>x<end> more. When <color_E14A68>destroyed<end>, <color_E14A68>you lose<end>."

func add_conditional_effects(symbol, adjacent):
	symbol.add_effect(effect().if_type("king").if_destroyed().change_value_bonus(values[2]))
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("chess").change_value_multiplier(values[1]).animate("circle", 0, [symbol, i]))
	var hor_condition = abs(symbol.get_persistent_data("prev_x") - symbol.grid_position.x) < 2
	var ver_condition = abs(symbol.get_persistent_data("prev_y") - symbol.grid_position.y) < 2
	if (hor_condition or ver_condition) and symbol.times_displayed > 1:
		symbol.add_effect(effect().change_value_bonus(values[0]))
	symbol.add_effect(effect().set_persistent_data("prev_y", symbol.grid_position.y))
	symbol.add_effect(effect().set_persistent_data("prev_x", symbol.grid_position.x))	
