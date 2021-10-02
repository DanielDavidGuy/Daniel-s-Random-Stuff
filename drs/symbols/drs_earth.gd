extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "earth"
	self.value = 2
	self.values = [1]
	self.rarity = "rare"
	self.groups = ["earthbend", "night"]
	self.sfx = ["bubbling"]
	
	self.texture = load_texture("res://drs/symbols/earth.png")
	self.name = "Earth"
	self.description = "Adjacent <all_na_organism> <all_and_plant> give <color_FBF236><icon_coin><value_1><end> more."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("organism").change_value_bonus(values[0]).animate("circle", 0, [symbol, i]))
		symbol.add_effect_for_symbol(i, effect().if_group("plant").change_value_bonus(values[0]).animate("circle", 0, [symbol, i]))