extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "snowman"
	self.value = 1
	self.values = [10, 3, 2]
	self.rarity = "rare"
	self.groups = ["snowmen"]
	self.sfx = ["beam", "ding"]
	
	self.texture = load_texture("res://drs/symbols/snowman.png")
	self.name = "Snowman"
	self.description = "<color_E14A68>Destroys<end> itself after <color_E14A68><value_1><end> spins. Gives <icon_coin> for every <color_E14A68><value_3><end> spins it has remaining. Adjacent <all_and_snowmen> last for <color_E14A68><value_2><end> additional spins. <color_E14A68>Transforms<end> into <icon_frosty> when directly below <icon_magic_hat>."

func add_conditional_effects(symbol, adjacent):
	var compare := symbol.times_displayed - values[0] + 1
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("snowmen").add_to_persistent_data("melt", values[1]).animate("circle", 1, [i]))
	var giveThis := (values[0] + symbol.get_persistent_data("melt") - symbol.times_displayed) / values[2]
	symbol.add_effect(effect().change_value_bonus(giveThis))
	symbol.add_effect(effect().if_persistent_data_less_than("melt", compare).set_destroyed().animate("shake", 0))

func update_value_text(symbol, values):
	symbol.value_text = values[0] + symbol.get_persistent_data("melt") - symbol.times_displayed
	symbol.value_text_color = "<color_E14A68>"