extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "landmine"
	self.value = -3
	self.values = [1, 35]
	self.rarity = "uncommon"
	self.groups = []
	self.sfx = ["growhit"]
	
	self.texture = load_texture("res://drs/symbols/landmine.png")
	self.name = "Landmine"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> for each adjacent symbol.  When adjacent to <all_or_human>, <color_E14A68>destroys<end> itself and all adjacent symbols. Gives <icon_coin><color_FBF236><value_2><end> when <color_E14A68>destroyed<end>."

func add_conditional_effects(symbol, adjacent):
    var act = false
    for i in adjacent:
        symbol.add_effect_for_symbol(i, effect().if_type("empty").negate().set_target(symbol).change_value_bonus(values[0]))
        if i.groups.has("human"):
            act = true
    if act:
        var targets = adjacent
        adjacent.push_back(symbol)
        symbol.add_effect(effect().animate("shake", 0, targets))
        for j in targets:
            symbol.add_effect_for_symbol(j, effect().set_destroyed())
    symbol.add_effect(effect().if_destroyed().change_value_bonus(values[1]))