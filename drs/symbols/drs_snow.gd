extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "snow"
    self.value = 1
    self.values = [5, 2]
    self.rarity = "common"
    self.groups = ["eachother", "snowy", "waterbend"]
    self.sfx = ["beam"]
    
    self.texture = load_texture("res://drs/symbols/snow.png")
    self.name = "Snow"
    self.description = "<color_E14A68>Destroys<end> itself after <color_E14A68><value_1><end> spins. Gives <icon_coin><color_FBF236><value_2><end> more for <color_E14A68>each other<end> <icon_snow>."

func add_conditional_effects(symbol, adjacent):
	var symbol_count := values[1] * (count_symbols("reels", {"type": "snow"}) - 1)
	var compare := symbol.times_displayed - values[0] + 1
	symbol.add_effect(effect().change_value_bonus(symbol_count))
	symbol.add_effect(effect().if_persistent_data_less_than("melt", compare).set_destroyed().animate("shake", 0))

func update_value_text(symbol, values):
	symbol.value_text = values[0] + symbol.get_persistent_data("melt") - symbol.times_displayed
	symbol.value_text_color = "<color_E14A68>"