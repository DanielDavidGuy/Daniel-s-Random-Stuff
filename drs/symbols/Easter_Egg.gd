extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "easter_egg"
    self.value = 2
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["toddlerlikes"]
    
    self.texture = load_texture("res://drs/symbols/easter_egg.png")
    self.name = "Easter Egg"
    self.description = ""