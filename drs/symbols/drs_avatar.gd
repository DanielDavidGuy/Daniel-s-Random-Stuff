extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "avatar"
	self.value = 3
	self.values = [3]
	self.rarity = "very_rare"
	self.groups = ["organism", "doglikes"]
	self.sfx = ["beam", "hex", "jump", "sizzle", "bubbling", "rockroll"]
	
	self.texture = load_texture("res://drs/symbols/avatar.png")
	self.name = "The Avatar"
	self.description = "Adjacent <all_na_waterbend> <all_na_earthbend> <all_na_firebend> and <icon_empty> give <color_FBF236><icon_coin><value_1><end> more. When adjacent to a <all_or_waterbend>, a <all_or_earthbend>, a <all_or_firebend>, and a <icon_empty>, all symbols give <color_E14A68><value_1>x<end> more <icon_coin>. Adds <icon_avatar> when destroyed."

func add_conditional_effects(symbol, adjacent):
	var fire = false
	var water = false
	var earth = false
	var air = false
	for i in adjacent:
		if i.groups.has("firebend"):
			symbol.add_effect_for_symbol(i, effect().change_value_bonus(values[0]).animate("circle", 3, [symbol, i]))
			fire = true
		if i.groups.has("waterbend"):
			symbol.add_effect_for_symbol(i, effect().change_value_bonus(values[0]).animate("circle", 4, [symbol, i]))
			water = true
		if i.groups.has("earthbend"):
			symbol.add_effect_for_symbol(i, effect().change_value_bonus(values[0]).animate("circle", 5, [symbol, i]))
			earth = true
		if i.type == "empty":
			symbol.add_effect_for_symbol(i, effect().change_value_bonus(values[0]))
			air = true
	if fire && water && earth && air:
		symbol.add_effect(effect().animate("bounce", 2))
		for i in list_symbols("reels"):
			symbol.add_effect_for_symbol(i, effect().change_value_multiplier(values[0]))
	symbol.add_effect(effect().if_destroyed().add_symbol_type("avatar").animate("rotate", 1))