extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "queen"
	self.value = 1
	self.values = [5, 2]
	self.rarity = "rare"
	self.groups = ["chessupper", "chess", "pawnform"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/queen.png")
	self.name = "Chess Queen"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> more if its <color_E14A68>position<end> is in the same row, column, or diagonal of its previous <color_E14A68>position<end>."

func add_conditional_effects(symbol, adjacent):
	var hor_condition = symbol.get_persistent_data("prev_x") == symbol.grid_position.x
	var ver_condition = symbol.get_persistent_data("prev_y") == symbol.grid_position.y
	var diag_condition = abs(symbol.get_persistent_data("prev_x") - symbol.grid_position.x) == abs(symbol.get_persistent_data("prev_y") - symbol.grid_position.y)
	if (hor_condition or ver_condition or diag_condition) and symbol.times_displayed > 1:
		symbol.add_effect(effect().change_value_bonus(values[0]))
	symbol.add_effect(effect().set_persistent_data("prev_y", symbol.grid_position.y))
	symbol.add_effect(effect().set_persistent_data("prev_x", symbol.grid_position.x))	
