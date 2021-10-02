extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "fire"
    self.value = 3
    self.values = [4]
    self.rarity = "uncommon"
    self.groups = ["omelettestuff", "firebend"]
    self.sfx = ["sizzle", "rockroll"]
    
    self.texture = load_texture("res://drs/symbols/fire.png")
    self.name = "Fire"
    self.description = "<color_E14A68>Destroys<end> itself after <color_E14A68><value_1><end> spins. <color_E14A68>Destroys<end> adjacent <icon_tree>. Adjacent <icon_stick> transforms into <icon_campfire>."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_type("tree").set_destroyed().animate("circle", 0, [symbol, i]))
		symbol.add_effect_for_symbol(i, effect().if_type("stick").change_type("campfire").animate("circle", 0, [symbol, i]))
	symbol.add_effect(effect().if_property_at_least("times_displayed", values[0]).set_destroyed().animate("shake", 1))

func update_value_text(symbol, values):
	symbol.value_text = values[0] - symbol.times_displayed
	symbol.value_text_color = "<color_E14A68>"