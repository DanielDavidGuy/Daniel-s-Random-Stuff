extends "res://modloader/ModSymbol.gd"

# Called when the symbol is first initialized.
func init(modloader: Reference, params):
    # Set this symbol's reference to the modloader. Always include this line.
    self.modloader = modloader
    
    self.id = "stick"
    self.value = 1
    self.values = []
    self.rarity = "common"
    self.groups = ["woodlikes", "doghates"]
    
    self.texture = load_texture("res://drs/symbols/stick.png")
    self.name = "Stick"
    self.description = ""