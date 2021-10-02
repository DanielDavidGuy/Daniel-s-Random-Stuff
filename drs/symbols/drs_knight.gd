extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "knight"
	self.value = 2
	self.values = [3, 1, 2]
	self.rarity = "uncommon"
	self.groups = ["chesslower", "chess", "pawnform"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/knight.png")
	self.name = "Knight"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> more if its <color_E14A68>position<end> is <color_E14A68><value_2><end> space in a direction and <color_E14A68><value_3><end> spaces in another direction from its previous <color_E14A68>position<end>."

func add_conditional_effects(symbol, adjacent):
	var hor_condition = abs(symbol.get_persistent_data("prev_y") - symbol.grid_position.y) == values[1] and abs(symbol.get_persistent_data("prev_x") - symbol.grid_position.x) == values[2]
	var ver_condition = abs(symbol.get_persistent_data("prev_y") - symbol.grid_position.y) == values[2] and abs(symbol.get_persistent_data("prev_x") - symbol.grid_position.x) == values[1]
	if (hor_condition or ver_condition) and symbol.times_displayed > 1:
		symbol.add_effect(effect().change_value_bonus(values[0]))
	symbol.add_effect(effect().set_persistent_data("prev_y", symbol.grid_position.y))
	symbol.add_effect(effect().set_persistent_data("prev_x", symbol.grid_position.x))	
