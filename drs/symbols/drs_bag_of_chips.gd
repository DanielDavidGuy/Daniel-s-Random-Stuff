extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "bag_of_chips"
	self.value = 0
	self.values = [12]
	self.rarity = "common"
	self.groups = ["food"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/bag_of_chips.png")
	self.name = "Bag of Chips"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> the first time it is spun."

func add_conditional_effects(symbol, adjacent):
	if symbol.times_displayed < 2:
		symbol.add_effect(effect().change_value_bonus(values[0]))