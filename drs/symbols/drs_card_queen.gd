extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "card_queen"
	self.value = 3
	self.values = [2, -1]
	self.rarity = "rare"
	self.groups = ["jokerlikes", "acelikes"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/card_queen.png")
	self.name = "Queen of Cards"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> for <color_E14A68>each<end> <all_and_redsuits>. Gives <icon_coin><color_FBF236><value_2><end> for <color_E14A68>each<end> <all_and_blacksuits>."

func add_conditional_effects(symbol, adjacent):
	var reds := count_symbols("reels", {"group": "redsuits"})
	var blacks := count_symbols("reels", {"group": "blacksuits"})
	symbol.add_effect(effect().change_value_bonus((values[0] * reds)))
	symbol.add_effect(effect().change_value_bonus((values[1] * blacks)))