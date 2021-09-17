extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "rain"

func patch_groups(groups):
    groups.push_back("waterbend")
    return groups