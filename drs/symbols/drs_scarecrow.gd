extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "scarecrow"
    self.value = 2
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["farmerlikes"]
    self.sfx = ["whistle"]
    
    self.texture = load_texture("res://drs/symbols/scarecrow.png")
    self.name = "Scarecrow"
    self.description = "Adjacent <all_and_scarebirds> give the amount of <icon_coin> they would take."

func add_conditional_effects(symbol, adjacent):
    for i in adjacent:
	    symbol.add_effect_for_symbol(i, effect().if_group("scarebirds").if_final_value_less_than(0).change_value_multiplier(-1).animate("circle", 0, [symbol, i]))