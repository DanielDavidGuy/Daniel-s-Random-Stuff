extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "magic_hat"
	self.value = 1
	self.values = [1]
	self.rarity = "rare"
	self.groups = []
	self.sfx = ["shine", "ding"]
	
	self.texture = load_texture("res://drs/symbols/magic_hat.png")
	self.name = "Magic Hat"
	self.description = "<all_and_human> directly below this symbol permanently gives <color_FBF236><icon_coin><value_1><end> more."

func add_conditional_effects(symbol, adjacent):
	for i in adjacent:
		if i.grid_position.y == symbol.grid_position.y + 1 && i.grid_position.x == symbol.grid_position.x:
			symbol.add_effect_for_symbol(i, effect().if_group("human").add_permanent_bonus(values[0]).animate("circle", 0, [symbol, i]))
			symbol.add_effect_for_symbol(i, effect().if_type("snowman").change_type("frosty").animate("jump", 1, [symbol, i]))