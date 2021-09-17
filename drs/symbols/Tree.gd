extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "tree"
    self.value = 2
    self.values = [10]
    self.rarity = "uncommon"
    self.groups = ["plant", "farmerlikes", "spawner0", "lumber"]
    self.sfx = ["growhit"]
    
    self.texture = load_texture("res://drs/symbols/tree.png")
    self.name = "Tree"
    self.description = "Has a <color_E14A68><value_1>%<end> chance to <color_E14A68>add<end> <icon_stick>. <color_E14A68>Adds<end> <icon_wood> when <color_E14A68>destroyed<end>."

func add_conditional_effects(symbol, adjacent):
	symbol.add_effect(effect().if_value_random(0).add_symbol_type("stick").animate("shake", 0))
	symbol.add_effect(effect().if_destroyed().add_symbol_type("wood"))