extends "res://modloader/ModSymbol.gd"

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
	
	self.texture = load_texture("res://drs/symbols/lumberjack.png")
	self.name = "Lumberjack"
	self.description = "<color_E14A68>Destroys<end> adjacent <all_and_lumber>. Permanently gives <color_FBF236><icon_coin><value_1><end> more for each symbol <color_E14A68>destroyed<end>. Adjacent <icon_fruit_tree> <color_E14A68>adds<end> <icon_wood>."

func add_conditional_effects(symbol, adjacent):
	var counter = 0
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_type("fruit_tree").add_symbol_type("wood").animate("bounce", 0, [symbol, i]))
		if i.groups.has("lumber"):
			symbol.add_effect_for_symbol(i, effect().set_destroyed().animate("bounce", 0, [symbol, i]))
			counter += 1
	symbol.add_effect(effect().add_permanent_bonus((counter * values[0])))
