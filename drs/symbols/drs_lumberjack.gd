extends "res://effects-builder-plugin/symbols/AbstractSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "lumberjack"
	self.value = 2
	self.values = [1]
	self.rarity = "rare"
	self.groups = ["organism", "human", "doglikes"]
	self.sfx = ["rockbreak"]

	self.destroys.push_back(destroy().set_group("lumber").set_buff("permanent_bonus", 1).animate("bounce", 0))
	self.texture = load_texture("res://drs/symbols/lumberjack.png")
	self.name = "Lumberjack"
	self.description = .get_description() + " Adjacent <icon_fruit_tree> <color_E14A68>adds<end> <icon_wood>."

func add_conditional_effects(symbol, adjacent):
	.add_conditional_effects(symbol, adjacent)
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_type("fruit_tree").add_symbol_type("wood").set_target(symbol).animate("bounce", 0, [symbol, i]))
		