extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "puddle"
    self.value = 2
    self.values = []
    self.rarity = "uncommon"
    self.groups = ["doghates", "waterbend"]
    
    self.texture = load_texture("res://drs/symbols/puddle.png")
    self.name = "Puddle"
    self.description = ""