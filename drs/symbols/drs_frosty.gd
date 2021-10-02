extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "frosty"
	self.value = 1
	self.values = [12, 6]
	self.rarity = "very_rare"
	self.groups = ["snowmen", "organism"]
	self.sfx = ["beam", "ding"]
	
	self.texture = load_texture("res://drs/symbols/frosty.png")
	self.name = "Frosty"
	self.description = "<color_E14A68>Destroys<end> itself after <color_E14A68><value_1><end> spins. Gives <icon_coin><color_FBF236>1<end> more for each spin it has remaining. Adjacent <all_and_snowmen> last for <color_E14A68><value_2><end> additional spins."

func add_conditional_effects(symbol, adjacent):
	var compare := symbol.times_displayed - values[0] + 1
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("snowmen").add_to_persistent_data("melt", values[1]).animate("circle", 1, [i]))
	var giveThis := (values[0] + symbol.get_persistent_data("melt") - symbol.times_displayed)
	symbol.add_effect(effect().change_value_bonus(giveThis))
	symbol.add_effect(effect().if_persistent_data_less_than("melt", compare).set_destroyed().animate("shake", 0))


func update_value_text(symbol, values):
	symbol.value_text = values[0] + symbol.get_persistent_data("melt") - symbol.times_displayed
	symbol.value_text_color = "<color_E14A68>"