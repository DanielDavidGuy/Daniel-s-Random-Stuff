extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "ice_block"
    self.value = 3
    self.values = [4, -2, 2]
    self.rarity = "uncommon"
    self.groups = ["minerlikes", "anivillikes", "snowy"]
    self.sfx = ["beam"]
    
    self.texture = load_texture("res://drs/symbols/ice_block.png")
    self.name = "Ice Block"
    self.description = "<color_E14A68>Destroys<end> itself after <color_E14A68><value_1><end> spins. Gives <icon_coin><color_FBF236><value_2><end> when it has less than <color_E14A68><value_3><end> spins remaining. <color_E14A68>Adds<end> <icon_puddle> after <color_E14A68>destroying<end> itself."

func add_conditional_effects(symbol, adjacent):
	var compare := symbol.times_displayed - values[0] + 1
	var almost := compare + 1
	symbol.add_effect(effect().if_persistent_data_less_than("melt", almost).change_value_bonus(values[1]))
	symbol.add_effect(effect().if_persistent_data_less_than("melt", compare).set_destroyed().animate("shake", 0))
	symbol.add_effect(effect().if_persistent_data_less_than("melt", compare).if_destroyed().add_symbol_type("puddle"))

func update_value_text(symbol, values):
	symbol.value_text = values[0] + symbol.get_persistent_data("melt") - symbol.times_displayed
	symbol.value_text_color = "<color_E14A68>"