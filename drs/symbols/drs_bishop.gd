extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "bishop"
	self.value = 1
	self.values = [4, 1]
	self.rarity = "uncommon"
	self.groups = ["chessupper", "chess", "pawnform"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/bishop.png")
	self.name = "Bishop"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> more if its <color_E14A68>position<end> is in the same diagonal of its previous <color_E14A68>position<end>. Adjacent <all_and_chessupper> give <icon_coin><color_FBF236><value_2><end> more."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("chessupper").change_value_bonus(values[1]))
	var diag_condition = abs(symbol.get_persistent_data("prev_x") - symbol.grid_position.x) == abs(symbol.get_persistent_data("prev_y") - symbol.grid_position.y)
	if diag_condition and symbol.times_displayed > 1:
		symbol.add_effect(effect().change_value_bonus(values[0]))
	symbol.add_effect(effect().set_persistent_data("prev_y", symbol.grid_position.y))
	symbol.add_effect(effect().set_persistent_data("prev_x", symbol.grid_position.x))	
