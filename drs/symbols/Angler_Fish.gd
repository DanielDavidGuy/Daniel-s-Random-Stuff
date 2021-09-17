extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
	# Set this symbol's reference to the modloader. Always include this line.
	self.modloader = modloader
	
	self.id = "angler_fish"
	self.value = -3
	self.values = [4]
	self.rarity = "rare"
	self.groups = ["organism", "animal"]
	self.sfx = []
	
	self.texture = load_texture("res://drs/symbols/angler_fish.png")
	self.name = "Angler Fish"
	self.description = "Gives <icon_coin><color_FBF236><value_1><end> for each row above it."

func add_conditional_effects(symbol, adjacent):
	symbol.add_effect(effect().change_value_bonus((values[0] * (symbol.grid_position.y))))