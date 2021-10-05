extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "trash_can"
	self.value = 0
	self.values = [2, 1]
	self.rarity = "uncommon"
	self.groups = []
	self.sfx = ["jump"]
	
	self.texture = load_texture("res://drs/symbols/trash_can.png")
	self.name = "Trash Can"
	self.description = "<color_E14A68>Removes<end> an adjacent <all_or_trash>. Gives <color_E14A68>1<icon_removal_token><end> for every <color_E14A68><value_1><end> symbols <color_E14A68>removed<end>."

func add_conditional_effects(symbol, adjacent):
	if not symbol.get_non_persistent_data("triggered"):
		var targets = []
		for i in adjacent:
			if i.groups.has("trash"):
				targets.push_back(i)
		if targets.size() > 0:
			targets.shuffle()
			symbol.set_non_persistent_data("triggered", 1)
			symbol.add_effect(effect().add_to_persistent_data("trash", 1))
			symbol.add_effect_for_symbol(targets[0], effect().set_removed().animate("bounce", 0, [symbol, targets[0]]))
	var n = symbol.get_persistent_data("trash")
	var count := 0
	while n >= values[0]:
		n -= values[0]
		count += 1
	symbol.add_effect(effect().change_value_bonus(count, "removal_token").add_to_persistent_data("trash", (-count * values[0])))

func update_value_text(symbol, values):
	symbol.value_text = symbol.get_persistent_data("trash")
	symbol.value_text_color = "<color_E14A68>"