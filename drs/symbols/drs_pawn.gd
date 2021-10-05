extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "pawn"
	self.value = 1
	self.values = [4, 1, 2, 3]
	self.rarity = "common"
	self.groups = ["chesslower", "chess"]
	self.sfx = ["matryoshka"]
	
	self.texture = load_texture("res://drs/symbols/pawn.png")
	self.name = "Pawn"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> more if its <color_E14A68>position<end> is <color_E14A68><value_2><end> or <color_E14A68><value_3><end> spaces directly above its previous <color_E14A68>position<end>. Transforms into <all_or_pawnform> after having done this <color_E14A68><value_4><end> times."

func add_conditional_effects(symbol, adjacent):
	var ver_condition = symbol.get_persistent_data("prev_y") - symbol.grid_position.y == values[1] or symbol.get_persistent_data("prev_y") - symbol.grid_position.y == values[2]
	var hor_condition = symbol.get_persistent_data("prev_x") - symbol.grid_position.x == 0
	if ver_condition and hor_condition and symbol.times_displayed > 1:
		symbol.add_effect(effect().change_value_bonus(values[0]).add_to_persistent_data("til_transform", 1))
	symbol.add_effect(effect().set_persistent_data("prev_y", symbol.grid_position.y))
	symbol.add_effect(effect().set_persistent_data("prev_x", symbol.grid_position.x))
	symbol.add_effect(effect().if_persistent_data_at_least("til_transform", values[3]).change_group("pawnform", "uncommon").animate("shake", 0))

func update_value_text(symbol, values):
	symbol.value_text = values[3] - symbol.get_persistent_data("til_transform")
	symbol.value_text_color = "<color_E14A68>"