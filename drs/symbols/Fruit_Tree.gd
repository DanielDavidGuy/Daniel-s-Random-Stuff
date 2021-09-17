extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "fruit_tree"
    self.value = 3
    self.values = [20, 1]
    self.rarity = "rare"
    self.groups = ["plant", "farmerlikes", "spawner0"]
    self.sfx = ["growshine"]
    
    self.texture = load_texture("res://drs/symbols/fruit_tree.png")
    self.name = "Fruit Tree"
    self.description = "Has a <color_E14A68><value_1>%<end> chance to <color_E14A68>add<end> <all_or_fruit>. Adjacent <all_and_fruit> give <icon_coin><color_FBF236><value_2><end> more."

func add_conditional_effects(symbol, adjacent):
	symbol.add_effect(effect().if_value_random(0).add_symbol_group("fruit").animate("shake", 0))
	for i in adjacent:
		symbol.add_effect_for_symbol(i, effect().if_group("fruit").change_value_bonus(values[1]))