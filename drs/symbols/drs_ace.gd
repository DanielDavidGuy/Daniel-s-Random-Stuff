extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "ace"
	self.value = 4
	self.values = [1.3]
	self.rarity = "very_rare"
	self.groups = ["jokerlikes"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/ace.png")
	self.name = "Ace"
	self.description = "Gives <color_E14A68><value_1>x<end> more for <color_E14A68>each<end> <all_and_acelikes>."

func add_conditional_effects(symbol, adjacent):
	var cards := count_symbols("reels", {"group": "acelikes"})
	symbol.add_effect(effect().change_value_bonus((values[0] * cards)))