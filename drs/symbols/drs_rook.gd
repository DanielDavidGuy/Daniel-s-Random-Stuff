extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "rook"
	self.value = 1
	self.values = [4, 1]
	self.rarity = "uncommon"
	self.groups = ["chesslower", "chess", "pawnform"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/rook.png")
	self.name = "Rook"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> more if its <color_E14A68>position<end> is in the same row or column of its previous <color_E14A68>position<end>. Adjacent <all_and_chesslower> give <icon_coin><color_FBF236><value_2><end> more."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("chesslower").change_value_bonus(values[1]))
	var hor_condition = symbol.get_persistent_data("prev_x") == symbol.grid_position.x
	var ver_condition = symbol.get_persistent_data("prev_y") == symbol.grid_position.y
	if (hor_condition or ver_condition) and symbol.times_displayed > 1:
		symbol.add_effect(effect().change_value_bonus(values[0]))
	symbol.add_effect(effect().set_persistent_data("prev_y", symbol.grid_position.y))
	symbol.add_effect(effect().set_persistent_data("prev_x", symbol.grid_position.x))	
