extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "magic_key"

func patch_groups(groups):
    groups.push_back("key")
    return groups