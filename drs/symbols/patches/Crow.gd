extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "crow"

func patch_groups(groups):
    groups.push_back("scarebirds")
    return groups