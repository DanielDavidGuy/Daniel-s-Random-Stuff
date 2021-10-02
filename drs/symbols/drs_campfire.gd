extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "campfire"
    self.value = 1
    self.values = [1, 5]
    self.rarity = "rare"
    self.groups = ["firebend"]
    self.sfx = ["sizzle", "rockroll"]
    
    self.texture = load_texture("res://drs/symbols/campfire.png")
    self.name = "Campfire"
    self.description = "Adjacent <all_and_fruit> permanently give <icon_coin><color_FBF236><value_1><end> more. <color_E14A68>Destroys<end> itself after making other symbols permanently give more <icon_coin> <color_E14A68><value_2> times.<end>"

func add_conditional_effects(symbol, adjacent):
    var counter = 0
    for i in adjacent:
        if i.groups.has("fruit"):
            symbol.add_effect_for_symbol(i, effect().add_permanent_bonus(values[0]).animate("circle", 0, [symbol, i]))
            counter += 1
    symbol.add_effect_for_symbol(symbol, effect().add_to_persistent_data("buff_times", counter))
    symbol.add_effect_for_symbol(symbol, effect().if_persistent_data_at_least("buff_times", values[1]).set_destroyed(true).animate("shake", 1)) 

func update_value_text(symbol, values):
    symbol.value_text = values[1] - symbol.get_persistent_data("buff_times")
    symbol.value_text_color = "<color_E14A68>"