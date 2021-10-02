extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "flag"
	self.value = 2
	self.values = [2]
	self.rarity = "rare"
	self.groups = []
	self.sfx = ["jump"]
	
	self.texture = load_texture("res://drs/symbols/flag.png")
	self.name = "Flag"
	self.description = "Permanently gives <icon_coin><color_FBF236><value_1><end> more when it lands on the space it first appeared. <color_E14A68>Destroys<end> adjacent <icon_landmine>. Gives <color_E14A68><value_1>x<end> more <icon_coin> for each symbol <color_E14A68>destroyed<end>."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		if i.type == "landmine":
			symbol.add_effect_for_symbol(i, effect().set_destroyed().animate("bounce", 0, [symbol, i]))
			symbol.add_effect(effect().change_value_multiplier(values[0]))
	if symbol.times_displayed < 2:
		symbol.add_effect(effect().set_persistent_data("init_x", symbol.grid_position.x))
		symbol.add_effect(effect().set_persistent_data("init_y", symbol.grid_position.y))
	else:
		symbol.add_effect(effect().if_grid_x(symbol.get_persistent_data("init_x")).if_grid_y(symbol.get_persistent_data("init_y")).add_permanent_bonus(values[0]))
		
