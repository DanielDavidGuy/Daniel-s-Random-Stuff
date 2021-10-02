extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "locksmith"
	self.value = 2
	self.values = [0.5, 15]
	self.rarity = "rare"
	self.groups = ["human", "organism", "doglikes"]
	self.sfx = ["unlock", "jump"]
	
	self.texture = load_texture("res://drs/symbols/locksmith.png")
	self.name = "Locksmith"
	self.description = "<color_E14A68>Destroys<end> adjacent <all_and_chest>. Gives <icon_coin> equal to <color_E14A68><value_1>x<end> the value of each symbol <color_E14A68>destroyed<end>. Also <color_E14A68>destroys<end> adjacent <all_and_key>. Gives <color_FBF236><icon_coin><value_2><end> for each symbol <color_E14A68>destroyed<end>."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		if i.groups.has("chest"):
			symbol.add_effect_for_symbol(i, effect().set_destroyed().animate("shake", 0, [symbol, i]))
			symbol.add_effect(effect().change_value_bonus(values[0] * (i.value + i.values[0])))
		if i.groups.has("key"):
			symbol.add_effect_for_symbol(i, effect().set_destroyed().animate("bounce", 1, [symbol, i]))
			symbol.add_effect(effect().change_value_bonus(values[1]))