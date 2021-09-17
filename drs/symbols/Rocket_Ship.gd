extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "rocket_ship"
	self.value = 2
	self.values = [1]
	self.rarity = "rare"
	self.groups = []
	self.sfx = ["rockroll", "moon"]
	
	self.texture = load_texture("res://drs/symbols/rocket_ship.png")
	self.name = "Rocket Ship"
	self.description = "Adjacent <icon_moon> <color_E14A68>adds<end> <icon_cheese>. Permanently gives <icon_coin><color_FBF236><value_1><end> more when adjacent to <icon_billionaire>"

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_type("moon").add_symbol_type("cheese").animate("shake", 0, [symbol, i]))
		symbol.add_effect_for_symbol(i, effect().if_type("billionaire").set_target(symbol).add_permanent_bonus(values[0]).animate("circle", 1, [symbol, i]))