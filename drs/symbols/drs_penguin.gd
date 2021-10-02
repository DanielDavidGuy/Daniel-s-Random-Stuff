extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "penguin"
    self.value = 2
    self.values = [10]
    self.rarity = "uncommon"
    self.groups = ["bird", "animal", "organism"]
    self.sfx = ["jump"]
    
    self.texture = load_texture("res://drs/symbols/penguin.png")
    self.name = "Penguin"
    self.description = "<color_E14A68>Destroys<end> adjacent <all_and_snowy>. Gives <icon_coin> equal to <color_E14A68>8x<end> the value of each symbol <color_E14A68>destroyed<end>."

func add_conditional_effects(symbol, adjacent):
    for i in adjacent:
        if i.groups.has("snowy"):
            symbol.add_effect_for_symbol(i, effect().set_destroyed().animate("bounce", 0, [symbol, i]))
            var i_effect = effect().if_destroyed().set_target(symbol).change_value_bonus(0).dynamic_symbol_value(i, values[0], true)
            i_effect.effect_dictionary.erase("diff")
            symbol.add_effect_for_symbol(i, i_effect)