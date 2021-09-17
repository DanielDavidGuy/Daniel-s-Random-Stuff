extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "snow_globe"
    self.value = 2
    self.values = [2]
    self.rarity = "uncommon"
    self.groups = []
    self.sfx = ["ding"]
    
    self.texture = load_texture("res://drs/symbols/snow_globe.png")
    self.name = "Snow Globe"
    self.description = "Adjacent <all_and_snowy> last for <color_E14A68><value_1><end> spins longer."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("snowy").add_to_persistent_data("melt", 2).animate("circle", 0, [symbol, i]))
