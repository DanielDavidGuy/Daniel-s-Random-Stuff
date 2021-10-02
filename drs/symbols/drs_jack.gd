extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "jack"
	self.value = 2
	self.values = [1]
	self.rarity = "uncommon"
	self.groups = ["jokerlikes", "acelikes"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/jack.png")
	self.name = "Jack of Cards"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> for <color_E14A68>each<end> <all_na_redsuits> <all_and_blacksuits> if you have the same number of <all_and_redsuits> as <all_and_blacksuits>."

func add_conditional_effects(symbol, adjacent):
	var reds := count_symbols("reels", {"group": "redsuits"})
	var blacks := count_symbols("reels", {"group": "blacksuits"})
	if reds == blacks:
		symbol.add_effect(effect().change_value_bonus((values[0] * (reds+blacks))))