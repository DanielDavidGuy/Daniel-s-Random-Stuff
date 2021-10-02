extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "everyman"
	self.value = 1
	self.values = []
	self.rarity = "uncommon"
	self.groups = ["organism", "human", "doglikes"]
	self.sfx = ["mmm"]
	
	self.texture = load_texture("res://drs/symbols/everyman.png")
	self.name = "Everyman"
	self.description = "When adjacent to <all_or_human>, transforms into that symbol."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_type("everyman").negate().if_group("human").set_target(symbol).change_type(i.type).animate("circle", 0, [symbol, i]))