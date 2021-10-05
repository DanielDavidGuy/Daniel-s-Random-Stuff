extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "penguin"
	self.value = 2
	self.values = [15]
	self.rarity = "uncommon"
	self.groups = ["bird", "animal", "organism"]
	self.sfx = ["jump"]
	
	self.texture = load_texture("res://drs/symbols/penguin.png")
	self.name = "Penguin"
	self.description = "<color_E14A68>Destroys<end> adjacent <all_and_snowy>. Gives <icon_coin><color_FBF236><value_1><end> for each symbol <color_E14A68>destroyed<end>."

func add_conditional_effects(symbol, adjacent):
	var counter := 0
	for i in adjacent:
		if i.groups.has("snowy"):
			symbol.add_effect_for_symbol(i, effect().set_destroyed().animate("bounce", 0, [symbol, i]))
			counter += 1
	symbol.add_effect(effect().change_value_bonus(counter * values[0]))