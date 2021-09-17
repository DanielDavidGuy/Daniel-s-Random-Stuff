extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "iceberg"
    self.value = 3
    self.values = [4, 1]
    self.rarity = "rare"
    self.groups = []
    self.sfx = ["chemicalseven"]
    
    self.texture = load_texture("res://drs/symbols/iceberg.png")
    self.name = "Iceberg"
    self.description = "<color_E14A68>Adds<end> <icon_ice_block> every spin. <color_E14A68>Destroys<end> itself after <color_E14A68>adding<end> <icon_ice_block> <color_E14A68><value_1> times<end>.  Has a <color_E14A68><value_2>%<end> chance to add <icon_avatar> when destroyed."

func add_conditional_effects(symbol, adjacent):
    symbol.add_effect(effect().add_symbol_type("ice_block").animate("shake", 0))
    if symbol.times_displayed >= values[0]:
        symbol.add_effect(effect().set_destroyed())
    symbol.add_effect(effect().if_destroyed().if_value_random(1).add_symbol_type("avatar"))

func update_value_text(symbol, values):
	symbol.value_text = values[0] - symbol.times_displayed
	symbol.value_text_color = "<color_E14A68>"